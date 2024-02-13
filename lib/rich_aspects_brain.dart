import 'package:are_you_rich/constants.dart';
import 'package:are_you_rich/screens/finish_screen.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'components/check_button.dart';
import 'rich_aspect.dart';

class RichAspectsBrain extends ChangeNotifier {
  int _aspectIndex = 0;
  String resultStatus = '';
  int get aspectSelected => _aspectIndex;

  final List<RichAspect> _aspectsData = [
    RichAspect(
      aspectTitle: 'FINANCIAL GOALS',
      aspectIcon: const Icon(PhosphorIconsLight.coins, size: 40.0),
      aspectText:
          'Evaluate whether you\'ve achieved your financial goals, such as saving for retirement, owning a home, or funding education. If you\'ve met these objectives, you might be in a comfortable financial position.',
      aspectChecker: false,
      buttonStatus: '',
      aspectImg: 'images/bg_1.png',
    ),
    RichAspect(
      aspectTitle: 'INCOME VS. EXPENSES',
      aspectIcon: const Icon(PhosphorIconsLight.calculator, size: 40.0),
      aspectText:
          'Compare your income to your expenses. If you consistently have money left over after covering your bills and saving for the future, you may be in a stable financial situation.',
      aspectChecker: false,
      buttonStatus: '',
      aspectImg: 'images/bg_2.png',
    ),
    RichAspect(
      aspectTitle: 'NET WORTH',
      aspectIcon:
          const Icon(PhosphorIconsLight.currencyCircleDollar, size: 40.0),
      aspectText:
          'Calculate your net worth by subtracting your liabilities (debts) from your assets (savings, investments, property). A positive net worth suggests financial health.',
      aspectChecker: false,
      buttonStatus: '',
      aspectImg: 'images/bg_3.png',
    ),
    RichAspect(
      aspectTitle: 'QUALITY OF LIFE',
      aspectIcon: const Icon(PhosphorIconsLight.smiley, size: 40.0),
      aspectText:
          'Consider your overall quality of life. If you can afford the lifestyle you desire without constant financial stress, you may feel financially secure.',
      aspectChecker: false,
      buttonStatus: '',
      aspectImg: 'images/bg_4.png',
    ),
    RichAspect(
      aspectTitle: 'EMERGENCY FUND',
      aspectIcon: const Icon(PhosphorIconsLight.piggyBank, size: 40.0),
      aspectText:
          'Having an emergency fund to cover unexpected expenses is a sign of financial stability. Experts often recommend saving three to six months\' worth of living expenses.',
      aspectChecker: false,
      buttonStatus: '',
      aspectImg: 'images/bg_5.png',
    ),
    RichAspect(
      aspectTitle: 'INVESTMENTS',
      aspectIcon: const Icon(PhosphorIconsLight.chartBar, size: 40.0),
      aspectText:
          'If you\'re actively investing and growing your wealth, it may be an indicator of financial success.',
      aspectChecker: false,
      buttonStatus: '',
      aspectImg: 'images/bg_6.png',
    ),
    RichAspect(
      aspectTitle: 'FINANCIAL FREEDOM',
      aspectIcon: const Icon(PhosphorIconsLight.sunglasses, size: 40.0),
      aspectText:
          'Assess whether you have the freedom to make choices based on your preferences rather than financial constraints. This includes the ability to pursue passions, travel, or take time off work.',
      aspectChecker: false,
      buttonStatus: '',
      aspectImg: 'images/bg_7.png',
    ),
  ];

  ListView getAllAspectsHome() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _aspectsData.length,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        itemBuilder: (BuildContext context, int index) {
          int i = index + 1;
          return Row(
            children: [
              SizedBox(
                width: 32.0,
                child: Text(
                  i.toString(),
                  style: const TextStyle(color: kGoldColor),
                ),
              ),
              Text(_aspectsData[index].aspectTitle),
              const SizedBox(
                height: 40.0,
              ),
            ],
          );
        });
  }

  String getAspect() {
    return _aspectsData[aspectSelected].aspectTitle;
  }

  List<Tab> getAllAspectsTabs() {
    List<Tab> tabs = [];
    for (var i = 0; i < _aspectsData.length; i++) {
      tabs.add(
        Tab(
          text: _aspectsData[i].aspectTitle,
        ),
      );
    }
    return tabs;
  }

  void selectOption(index, controller, context) {
    _aspectIndex = index;
    if (index < _aspectsData.length - 1) {
      controller.animateTo(aspectSelected + 1);
    } else {
      Navigator.pushNamed(context, FinishScreen.id);
    }
  }

  List<Container> getAllAspectsTabsContent(controller, context) {
    List<Container> tabsContent = [];
    for (var i = 0; i < _aspectsData.length; i++) {
      tabsContent.add(
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(_aspectsData[i].aspectImg),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _aspectsData[i].aspectIcon ?? const Icon(Icons.add),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        _aspectsData[i].aspectText,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    'ARE YOU?',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CheckButton(
                        isYes: false,
                        onPressed: () {
                          selectOption(i, controller, context);
                          _aspectsData[i].aspectChecker = false;
                          _aspectsData[i].buttonStatus = 'no';
                          quizResults();
                          notifyListeners();
                        },
                        isSelected: _aspectsData[i].buttonStatus == 'no',
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: CheckButton(
                        isYes: true,
                        onPressed: () {
                          selectOption(i, controller, context);
                          _aspectsData[i].aspectChecker = true;
                          _aspectsData[i].buttonStatus = 'yes';
                          quizResults();
                          notifyListeners();
                        },
                        isSelected: _aspectsData[i].buttonStatus == 'yes',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
    return tabsContent;
  }

  void quizResults() {
    final resultsArray = _aspectsData.map((e) => e.aspectChecker);
    final positiveQuestions =
        resultsArray.where((question) => question == true).length;
    if (positiveQuestions == _aspectsData.length) {
      resultStatus = 'Rich';
    } else if (positiveQuestions == 0) {
      resultStatus = 'Poor';
    } else {
      resultStatus = 'Almost';
    }
  }

  void restartQuiz() {
    _aspectsData.forEach((status) => status.buttonStatus = '');
    _aspectsData.forEach((checked) => checked.aspectChecker = false);
    notifyListeners();
  }
}
