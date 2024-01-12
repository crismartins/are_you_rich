import 'package:are_you_rich/constants.dart';
import 'package:flutter/cupertino.dart';

import 'rich_aspect.dart';

class RichAspectsBrain {
  final List<RichAspect> _aspectsData = [
    RichAspect(
      aspectTitle: 'FINANCIAL GOALS',
      aspectText:
          'Evaluate whether you\'ve achieved your financial goals, such as saving for retirement, owning a home, or funding education. If you\'ve met these objectives, you might be in a comfortable financial position.',
      aspectChecker: null,
    ),
    RichAspect(
      aspectTitle: 'INCOME VS. EXPENSES',
      aspectText:
          'Evaluate whether you\'ve achieved your financial goals, such as saving for retirement, owning a home, or funding education. If you\'ve met these objectives, you might be in a comfortable financial position.',
      aspectChecker: null,
    ),
  ];

  ListView getAllAspects() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _aspectsData.length,
        padding: EdgeInsets.symmetric(vertical: 20.0),
        itemBuilder: (BuildContext context, int index) {
          int i = index + 1;
          return Row(
            children: [
              SizedBox(
                width: 32.0,
                child: Text(
                  i.toString(),
                  style: TextStyle(color: kGoldColor),
                ),
              ),
              Text(_aspectsData[index].aspectTitle),
              SizedBox(
                height: 40.0,
              ),
            ],
          );
        });
  }

  String getAspect() {
    return _aspectsData[aspectNumber].aspectTitle;
  }

  int aspectNumber = 0;
}
