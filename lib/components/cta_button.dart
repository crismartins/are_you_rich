import 'package:flutter/material.dart';
import 'package:are_you_rich/constants.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CtaButton extends StatelessWidget {
  const CtaButton({super.key, required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: kGoldColor,
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            child: const Icon(
              PhosphorIconsRegular.arrowRight,
              size: 28.0,
            ),
          ),
        ],
      ),
    );
  }
}
