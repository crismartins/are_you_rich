import 'package:are_you_rich/constants.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'components/check_button.dart';
import 'rich_aspect.dart';

class RichAspectsBrain extends ChangeNotifier {
  int _aspectIndex = 0;
  int get aspectSelected => _aspectIndex;

  final List<RichAspect> _aspectsData = [
    RichAspect(
      aspectTitle: 'FINANCIAL GOALS',
      aspectIcon: const Icon(PhosphorIconsLight.coin, size: 40.0),
      aspectText:
          'Evaluate whether you\'ve achieved your financial goals, such as saving for retirement, owning a home, or funding education. If you\'ve met these objectives, you might be in a comfortable financial position.',
      aspectChecker: null,
      aspectImg: 'images/bg_1.png',
    ),
    RichAspect(
      aspectTitle: 'INCOME VS. EXPENSES',
      aspectIcon: const Icon(PhosphorIconsLight.calculator, size: 40.0),
      aspectText:
          'Evaluate whether you\'ve achieved your financial goals, such as saving for retirement, owning a home, or funding education. If you\'ve met these objectives, you might be in a comfortable financial position.',
      aspectChecker: null,
      aspectImg: 'images/bg_1.png',
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

  void selectOption(index, controller) {
    _aspectIndex = index;
    print(index);
    if (index < _aspectsData.length - 1) {
      controller.animateTo(aspectSelected + 1);
    } else {
      print('Finished!');
    }
  }

  List<Container> getAllAspectsTabsContent(controller) {
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
                          selectOption(i, controller);
                          _aspectsData[i].aspectChecker = false;
                          print(_aspectsData[i].aspectChecker);
                          notifyListeners();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: CheckButton(
                        isYes: true,
                        onPressed: () {
                          selectOption(i, controller);
                          _aspectsData[i].aspectChecker = true;
                          print(_aspectsData[i].aspectChecker);
                          notifyListeners();
                        },
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
}
