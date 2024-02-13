import 'package:flutter/material.dart';
import 'package:are_you_rich/constants.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CheckButton extends StatelessWidget {
  const CheckButton(
      {super.key,
      required this.isYes,
      this.isSelected,
      required this.onPressed});

  final bool isYes;
  final bool? isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: isSelected!
          ? ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                isYes ? Color(0xff2B8D75) : Color(0xff853535),
              ),
              overlayColor: MaterialStatePropertyAll(
                isYes ? Color(0xff2B8D75) : Color(0xff853535),
              ),
            )
          : ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                isYes ? kGoldColor : Colors.white.withOpacity(0.2),
              ),
              overlayColor: MaterialStatePropertyAll(
                isYes ? Color(0xff2B8D75) : Color(0xff853535),
              ),
            ),
      child: isYes
          ? const Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  PhosphorIconsRegular.checkCircle,
                  size: 36.0,
                ),
                Text('YES'),
              ],
            )
          : const Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('NO'),
                Icon(
                  PhosphorIconsRegular.xCircle,
                  size: 36.0,
                ),
              ],
            ),
    );
  }
}
