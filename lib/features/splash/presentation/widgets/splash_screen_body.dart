import 'package:app_books/features/home/presentation/home_screen.dart';
import 'package:app_books/features/splash/presentation/widgets/logo_animation.dart';
import 'package:app_books/features/splash/presentation/widgets/text_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreenBody extends StatefulWidget {

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<Offset> logoAnimation;

  @override
  void initState() {
    super.initState();

    initAnimation();
    navigationToHome();

  }




  void dispose ()
  {
    animationController.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LogoAnimation(logoAnimation: logoAnimation , ),
        TextAnimation(slidingAntimation: slidingAnimation)
      ],
    );
  }
  void initAnimation() {
    {
      animationController =
          AnimationController(vsync: this, duration: Duration(seconds: 1));
      slidingAnimation = Tween<Offset>(begin: Offset(0, 30), end: Offset.zero)
          .animate(animationController);
      logoAnimation = Tween<Offset>(begin: Offset(0, -30), end: Offset.zero)
          .animate(animationController);
      animationController.forward();
    }
  }
  void navigationToHome() {
    Future.delayed(Duration(seconds: 3),()
    {
      Get.offAll(HomeScreen() , transition: Transition.rightToLeftWithFade);
    });
  }
}




