import 'package:flutter/material.dart';
import 'package:flutter_user_guidance/models/models.dart';
import 'package:flutter_user_guidance/widgets/guidance_controller.dart';

class GuidingWidget extends StatefulWidget {
  final List<GuideVisual> guideExts;
  final GuidanceController controller;
  final Duration duration;
  const GuidingWidget({
    Key key,
    @required this.guideExts,
    this.controller,
    this.duration = const Duration(milliseconds: 250),
  })  : assert(guideExts.length > 0,
            'Property "guides" should have at least one element'),
        super(key: key);

  @override
  _GuidingWidgetState createState() => _GuidingWidgetState();
}

class _GuidingWidgetState extends State<GuidingWidget> {
  GuidanceController _controller;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? GuidanceController();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<GuidanceValue>(
      valueListenable: widget.controller,
      builder: (_, value, child) {
        return AnimatedSwitcher(
          duration: widget.duration,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: value.visible
              ? SizedBox(key: ValueKey(0), child: child)
              : const SizedBox(key: ValueKey(1)),
        );
      },
      child: GestureDetector(
        onTap: _handlePressed,
        child: Stack(
          children: [
            Positioned.fill(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black87,
                  BlendMode.srcOut,
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          backgroundBlendMode: BlendMode.dstOut,
                        ),
                      ),
                    ),
                    ValueListenableBuilder<GuidanceValue>(
                      valueListenable: widget.controller,
                      builder: (context, value, child) {
                        final userGuide = widget.guideExts[value.step];

                        return AnimatedPositioned.fromRect(
                          duration: widget.duration,
                          rect: userGuide.rect,
                          child: AnimatedContainer(
                            duration: widget.duration,
                            decoration: userGuide.decoration,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ValueListenableBuilder<GuidanceValue>(
                valueListenable: _controller,
                builder: (context, value, child) {
                  final guideChild = widget.guideExts[value.step].widget;

                  return AnimatedSwitcher(
                    duration: widget.duration,
                    child: SizedBox(
                      key: ValueKey<int>(value.step),
                      child: guideChild,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handlePressed() {
    if (widget.controller.value.step + 1 < widget.guideExts.length) {
      widget.controller.next();
    } else {
      widget.controller.hide();
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }

    super.dispose();
  }
}
