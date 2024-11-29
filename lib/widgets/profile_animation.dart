import 'package:flutter/material.dart';
import 'package:user_profile/core/constants/app_assets.dart';
import 'package:user_profile/core/constants/app_colors.dart';

class ProfileAnimation extends StatefulWidget {
   ProfileAnimation({super.key});


  @override
  State<ProfileAnimation> createState() => _ProfileAnimationState();
}

class _ProfileAnimationState extends State<ProfileAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Offset> _animation;
  // late Animation<double> _rotationAnimation;



  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))
          ..repeat(reverse: true);

    _animation = Tween(begin: const Offset(0.0, 0.05), end: const Offset(0.0, 0.0))
        .animate(_controller);

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        width: 360,
        height: 360,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Rotating Border
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * 3.14159,
                  child: Container(
                    width: 380,
                    height: 380,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.electricBlue, // Electric Blue
                        width: 4,
                      ),
                    ),
                  ),
                );
              },
            ),
            // Profile Image with Glow Effect
            Container(
              width: 360,
              height: 360,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AppAssets.profile1),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.softCyan, // Soft Cyan
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      AppColors.deepNavyBlue.withOpacity(0.4), // Deep Navy Blue
                      AppColors.turquoiseBlue.withOpacity(0.1), // Turquoise Blue
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}