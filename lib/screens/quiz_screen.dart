import 'package:are_you_rich/components/app_info.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:are_you_rich/constants.dart';
import 'package:are_you_rich/rich_aspects_brain.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  static const String id = 'quiz_screen';

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

RichAspectsBrain aspectsBrain = RichAspectsBrain();

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  late final _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: aspectsBrain.getAllAspectsTabs().length,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Consumer<RichAspectsBrain>(
      builder: (context, value, child) => DefaultTabController(
        length: value.getAllAspectsTabs().length,
        child: Scaffold(
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
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: value.getAllAspectsTabs(),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: value.getAllAspectsTabsContent(_tabController),
          ),
        ),
      ),
    );
  }
}
