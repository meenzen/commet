import 'package:commet/client/client.dart';
import 'package:commet/ui/molecules/user_panel.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:tiamat/tiamat.dart';

class DirectMessageList extends StatefulWidget {
  const DirectMessageList({required this.directMessages, this.onSelected, super.key});
  final List<Room> directMessages;
  @override
  State<DirectMessageList> createState() => _DirectMessageListState();
  final Function(int index)? onSelected;
}

class _DirectMessageListState extends State<DirectMessageList> {
  int numDMs = 0;
  int selectedIndex = -1;

  @override
  void initState() {
    numDMs = widget.directMessages.length;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      initialItemCount: numDMs,
      itemBuilder: (context, index, animation) {
        var room = widget.directMessages[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
          child: UserPanel(
            displayName: room.displayName,
            avatar: room.avatar,
            onClicked: () {
              setState(() {
                selectedIndex = index;
                widget.onSelected?.call(index);
              });
            },
          ),
        );
      },
    );
  }
}