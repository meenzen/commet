import 'package:commet/ui/atoms/circle_button.dart';
import 'package:commet/ui/atoms/seperator.dart';
import 'package:commet/ui/pages/settings/settings_tab.dart';
import 'package:flutter/material.dart';

import '../../../config/style/theme_extensions.dart';
import '../../atoms/simple_text_button.dart';

class DesktopSettingsPage extends StatefulWidget {
  const DesktopSettingsPage({super.key});

  @override
  State<DesktopSettingsPage> createState() => _DesktopSettingsPageState();
}

class _DesktopSettingsPageState extends State<DesktopSettingsPage> {
  late List<SettingsTab> tabs;
  int selectedTabIndex = 0;

  @override
  void initState() {
    tabs = List.empty(growable: true);

    tabs.add(SettingsTab(label: "Settings 1", pageBuilder: (context) => Placeholder()));

    tabs.add(SettingsTab(label: "Settings 2", pageBuilder: (context) => Placeholder()));

    tabs.add(SettingsTab(label: "More Settings", seperator: true));

    tabs.add(SettingsTab(label: "Settings 3", pageBuilder: (context) => Placeholder()));

    tabs.add(SettingsTab(label: "Settings 4", pageBuilder: (context) => Placeholder()));

    tabs.add(SettingsTab(seperator: true));

    tabs.add(SettingsTab(label: "Settings 5", pageBuilder: (context) => Placeholder()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            color: Theme.of(context).extension<ExtraColors>()!.surfaceLow1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 240,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CircleButton(
                            radius: 25,
                            icon: Icons.arrow_back,
                            onPressed: () => Navigator.of(context).pop(),
                          )),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (tabs[index].seperator) {
                          if (tabs[index].label == null) return Seperator();
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: Text(
                              tabs[index].label!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Theme.of(context).disabledColor),
                            ),
                          );
                        }
                        return SizedBox(
                            height: 40,
                            width: 200,
                            child: SimpleTextButton(
                              tabs[index].label!,
                              highlighted: index == selectedTabIndex,
                              onTap: () {
                                setState(() {
                                  selectedTabIndex = index;
                                });
                              },
                            ));
                      },
                      itemCount: tabs.length,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              switchInCurve: Curves.easeInOutCubic,
              //switchOutCurve: Curves.easeInExpo,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: Tween(
                    begin: Offset(0.0, 1.5),
                    end: Offset(0.0, 0.0),
                  ).animate(animation),
                  child: child,
                );
              },
              child: Container(key: ValueKey(selectedTabIndex), child: tabs[selectedTabIndex].pageBuilder!(context)),
            ),
          )
        ],
      ),
    );
  }
}