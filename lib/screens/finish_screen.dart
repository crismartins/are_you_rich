import 'package:are_you_rich/components/cta_button.dart';
import 'package:are_you_rich/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:are_you_rich/constants.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:are_you_rich/components/app_info.dart';
import '../rich_aspects_brain.dart';

RichAspectsBrain aspectsBrain = RichAspectsBrain();

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});
  static const String id = 'finish_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(PhosphorIconsRegular.arrowLeft),
        ),
        title: Text(
          kAppTitle,
        ),
        actions: [
          AppInfo(),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      PhosphorIconsLight.sealWarning,
                      size: 40.0,
                      color: kGoldColor,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Remember, being "RICH" is a subjective concept. It\'s more about achieving financial security and meeting your life goals than reaching a specific income level. Define what financial success means to you, set realistic goals, and regularly assess your progress toward them.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  CtaButton(
                    title: 'FINISH TEST',
                    onPressed: () {
                      Navigator.pushNamed(context, ResultScreen.id);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
