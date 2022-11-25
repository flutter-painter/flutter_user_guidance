import 'package:flutter/material.dart';
import 'package:flutter_user_guidance/models/guide.dart';
import 'package:flutter_user_guidance/widgets/guidance_controller.dart';
import 'package:flutter_user_guidance/widgets/guiding.dart';

import 'build_guilding.dart';

class HomePageWithGuiding extends StatefulWidget {
  const HomePageWithGuiding(
      {Key key, this.duration = const Duration(milliseconds: 2500)})
      : super(key: key);

  final Duration duration;

  @override
  _HomePageWithGuidingState createState() => _HomePageWithGuidingState();
}

class _HomePageWithGuidingState extends State<HomePageWithGuiding> {
  final _userGuidanceController = GuidanceController();
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final media = MediaQuery.of(context);
    final List<GuideVisual> guidesExt = buildGuiding(media);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Flutter User Guidance Example'),
            centerTitle: false,
            actions: [
              IconButton(
                icon: const Icon(Icons.slideshow),
                onPressed: () => _userGuidanceController.show(),
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                Text('$_counter', style: theme.textTheme.headline4),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _handleFABPressed,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
        GuidingWidget(
          controller: _userGuidanceController,
          guideExts: guidesExt,
        ),
      ],
    );
  }

  void _handleFABPressed() => setState(() => _counter++);
}
