import 'package:are_you_rich/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:are_you_rich/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:are_you_rich/components/app_info.dart';
import 'package:are_you_rich/components/cta_button.dart';
import 'package:provider/provider.dart';
import 'package:are_you_rich/rich_aspects_brain.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  static const String id = 'result_screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<RichAspectsBrain>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: kBgColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (value.resultStatus == 'Rich') ...[
                        Text(
                          'CONGRATULATIONS',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: kGoldColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                      const SizedBox(
                        height: 12.0,
                      ),
                      if (value.resultStatus == 'Rich') ...[
                        Text(
                          'YOU ARE RICH!',
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ] else if (value.resultStatus == 'Almost') ...[
                        Text(
                          'YOU ARE ALMOST RICH!',
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ] else ...[
                        Text(
                          'YOU ARE NOT RICH!',
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                      SizedBox(
                        height: 12.0,
                      ),
                      if (value.resultStatus == 'Rich') ...[
                        Lottie.network(kLottieFile)
                      ] else ...[
                        Text(
                          'Following our QUIZ You’re not considered ”RICH” yet, but you can achieve this goal just keep saving your money.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                ),
                Column(
                  children: [
                    CtaButton(
                      title: 'START OVER',
                      onPressed: () {
                        Navigator.popUntil(
                            context, ModalRoute.withName(HomeScreen.id));
                        Provider.of<RichAspectsBrain>(context, listen: false)
                            .restartQuiz();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
