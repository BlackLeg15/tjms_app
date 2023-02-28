import 'package:flutter/material.dart';

class ExplicitAnimationExample extends StatefulWidget {
  const ExplicitAnimationExample({super.key});

  @override
  createState() => _ExplicitAnimationExampleState();
}

class _ExplicitAnimationExampleState extends State<ExplicitAnimationExample> with TickerProviderStateMixin {
  late final Tween tween;
  late final Animation animation;
  late final AnimationController controller;

  late final ColorTween colorTween;
  late final AnimationController colorController;
  late final Animation<Color?> colorAnimation;

  @override
  initState() {
    super.initState();
    tween = Tween(begin: 255, end: 0);
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = tween.animate(controller);

    colorTween = ColorTween(begin: Colors.red, end: Colors.white);
    colorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    colorAnimation = colorTween.animate(colorController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AnimatedBuilder(
              animation: colorAnimation,
              builder: (context, child) {
                return Container(
                  color: colorAnimation.value,
                  width: 200,
                  height: 200,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (colorController.isAnimating) {
                      colorController.reset();
                      return;
                    }
                    colorController.repeat(reverse: true);
                  },
                  child: const Text('Repeat/Reset'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (colorController.isCompleted) {
                      colorController.animateBack(
                        0.0,
                        curve: Curves.linear,
                        duration: const Duration(seconds: 5),
                      );
                      return;
                    }
                    colorController.animateTo(
                      1.0,
                      curve: Curves.easeOutBack,
                      duration: const Duration(seconds: 5),
                    );
                  },
                  child: const Text('Animate to/Animate back'),
                ),
              ],
            ),
//             AnimatedBuilder(
//               animation: animation,
//               builder: (context, child) {
//                 return Container(
//                   color: Colors.red,
//                   width: animation.value * 2,
//                   height: animation.value,
//                 );
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (controller.isAnimating) {
//                   controller.reset();
//                   return;
//                 }
//                 controller.repeat(reverse: true);
//               },
//               child: const Text('GO'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (controller.isCompleted) {
//                   controller.animateBack(
//                     0.0,
//                     curve: Curves.linear,
//                     duration: const Duration(seconds: 5),
//                   );
//                   return;
//                 }
//                 controller.animateTo(
//                   1.0,
//                   curve: Curves.easeOutBack,
//                   duration: const Duration(seconds: 5),
//                 );
//               },
//               child: const Text('GO'),
//             ),
          ],
        ),
      ),
    );
  }
}
