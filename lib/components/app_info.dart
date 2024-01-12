import 'package:flutter/material.dart';
import 'package:are_you_rich/constants.dart';
import 'cta_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        return await showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: Colors.white,
          context: context,
          builder: (context) => Container(
            padding: const EdgeInsets.all(20.0),
            height: 262,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'PROUDLY DESIGNED AND DEVELOPED BY:',
                        style: TextStyle(
                          color: kBgColor,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      SvgPicture.asset('images/logo.svg'),
                      SizedBox(height: 20),
                      Text(
                        'cristophermartins.com',
                        style: TextStyle(
                          color: kGoldColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                CtaButton(
                  title: 'GET IN TOUCH',
                  onPressed: () async {
                    final url =
                        Uri.parse('https://cristophermartins.com/#contact');
                    if (await canLaunchUrl(url)) {
                      launchUrl(url, mode: LaunchMode.externalApplication);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
      icon: Icon(
        PhosphorIconsRegular.info,
        color: Colors.white.withOpacity(0.4),
      ),
    );
  }
}
