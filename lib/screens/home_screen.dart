import 'package:are_you_rich/rich_aspects_brain.dart';
import 'package:are_you_rich/screens/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:are_you_rich/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:are_you_rich/components/cta_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:are_you_rich/components/app_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

RichAspectsBrain aspectsBrain = RichAspectsBrain();

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  double lottieSize = 240.0;

  @override
  void initState() {
    scrollController.addListener(
      () {
        double showOffset = 10.0;
        if (scrollController.offset > showOffset) {
          setState(() {
            lottieSize = 140.0;
          });
        } else {
          setState(() {
            lottieSize = 240.0;
          });
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          kAppTitle,
        ),
        actions: [
          AppInfo(),
        ],
      ),
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.ease,
                  height: lottieSize,
                  child: Lottie.network(kLottieFile),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Determining whether you are "rich" is subjective and depends on various factors, including your financial goals, lifestyle, and personal circumstances.',
                            ),
                            const SizedBox(height: 40.0),
                            const Text(
                              'Here are a few considerations:',
                            ),
                            // Text(aspectsBrain.getAspect()),
                            aspectsBrain.getAllAspectsHome(),
                            const SizedBox(height: 80.0),
                          ],
                        ),
                      ),
                      const Positioned.fill(
                        bottom: 0,
                        top: null,
                        child: CtaAnimationWidget(),
                      ),
                    ],
                  ),
                ),
                CtaButton(
                  title: 'START',
                  onPressed: () {
                    Navigator.pushNamed(context, QuizScreen.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CtaAnimationWidget extends StatefulWidget {
  const CtaAnimationWidget({super.key});

  @override
  State<CtaAnimationWidget> createState() => _CtaAnimationWidgetState();
}

class _CtaAnimationWidgetState extends State<CtaAnimationWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  )..repeat(reverse: true);

  late final Animation<Offset> _arrowAnimation =
      Tween(begin: const Offset(0.0, -0.4), end: const Offset(0.0, 0.0))
          .animate(_controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.1, 0.6],
          colors: [
            kBgColor.withOpacity(0.2),
            kBgColor,
          ],
        ),
      ),
      child: Column(
        children: [
          const Text(
            'PRESS THE BUTTON TO DISCOVER',
            style: TextStyle(
              color: kGoldColor,
              fontSize: 14.0,
            ),
          ),
          SlideTransition(
            position: _arrowAnimation,
            child: const Icon(
              PhosphorIconsRegular.caretDoubleDown,
              size: 28.0,
            ),
          ),
        ],
      ),
    );
  }
}
