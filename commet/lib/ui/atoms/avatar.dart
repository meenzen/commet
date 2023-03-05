import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, this.image, required this.radius, this.placeholderText = null, this.isPadding = false})
      : super(key: key);

  const Avatar.small({
    Key? key,
    this.image,
    this.placeholderText = null,
    this.isPadding = false,
  })  : radius = 15,
        super(key: key);

  const Avatar.medium({Key? key, required this.image, this.placeholderText = null, this.isPadding = false})
      : radius = 22,
        super(key: key);

  const Avatar.large({Key? key, this.image, this.placeholderText = null, this.isPadding = false})
      : radius = 44,
        super(key: key);

  final double radius;
  final ImageProvider? image;
  final String? placeholderText;
  final bool isPadding;

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return SizedBox(
        width: radius * 2,
        height: radius * 2,
        child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius * 0.8), image: DecorationImage(image: image!))),
      );
    }
    return SizedBox(
      width: radius * 2,
      height: isPadding ? null : radius * 2,
      child: placeholderText != null
          ? DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius * 0.8),
                color: Colors.green,
              ),
              child: Align(
                  alignment: Alignment.center,
                  child: placeholderText != null
                      ? Text(
                          placeholderText!.substring(0, 1).toUpperCase(),
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: radius),
                        )
                      : null),
            )
          : null,
    );
  }
}
