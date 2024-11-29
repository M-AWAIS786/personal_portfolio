import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_profile/core/constants/app_assets.dart';
import 'package:user_profile/core/constants/app_buttons.dart';
import 'package:user_profile/core/constants/app_colors.dart';
import 'package:user_profile/core/constants/app_text_style.dart';
import 'package:user_profile/core/constants/constants.dart';
import 'package:user_profile/core/utils/responsive.dart';
import 'package:user_profile/widgets/profile_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final socialButtons = <String>[
    AppAssets.leetcode,
    AppAssets.linkedIn,
    AppAssets.github,
    AppAssets.watsapp,
    AppAssets.gfg,
  ];

  var socialBI;
  Future<void> _downloadCV() async {
    const url = 'https://github.com/M-AWAIS786/M-AWAIS786/raw/main/Awais.pdf%20(2.1).pdf'; // Direct download link

    final Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(
        _url,
        mode: LaunchMode.externalApplication, // Opens in the browser for download
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  Future<void> _onSocialIconTap(int index) async {
    const urls = [
      'https://leetcode.com/u/awaisaslam0335/',   // Leetcode
      'https://www.linkedin.com/in/muhammad-awais-329656244', // LinkedIn
      'https://github.com/M-AWAIS786',         // GitHub
      'https://wa.me/+923180583015',      //watsapp
      'https://www.geeksforgeeks.org/user/muhammadawaispak786/',  // geekforgeek

    ];

    final Uri _url = Uri.parse(urls[index]);
    if (await canLaunchUrl(_url)) {
      await launchUrl(
        _url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch ${urls[index]}';
    }
  }





  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildHomePersonalInfo(size),
          Constants.sizedBox(height: 25.0),
          ProfileAnimation()
        ],
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          Constants.sizedBox(width: 25.0),
          ProfileAnimation(),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          Constants.sizedBox(width: 25.0),
          ProfileAnimation(),
        ],
      ),
      paddingWidth: size.width * 0.1,

      bgColor: Colors.transparent,
    );
  }

  Column buildHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            'Hello, It\'s Me',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInRight(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Muhammad Awais',
            style: AppTextStyles.headingStyles(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Row(
            children: [
              Text(
                'And I\'m a ',
                style: AppTextStyles.montserratStyle(color: Colors.white),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: AnimatedTextKit(isRepeatingAnimation: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      'Flutter Developer',
                      textStyle: AppTextStyles.montserratStyle(
                          color: Colors.lightBlue),
                    ),
                    TyperAnimatedText(
                      'UI/UX Enthusiast',
                      textStyle: AppTextStyles.montserratStyle(
                          color: AppColors.robinEdgeBlue),
                    ),
                    TyperAnimatedText(
                      'Tech Innovator',
                      textStyle: AppTextStyles.montserratStyle(
                          color: Colors.lightBlue),
                    ),
                    TyperAnimatedText('Dart Developer',
                        textStyle: AppTextStyles.montserratStyle(
                            color: AppColors.robinEdgeBlue)),
                    TyperAnimatedText('Creative Problem Solver',
                        textStyle: AppTextStyles.montserratStyle(
                            color: Colors.lightBlue)),
                    TyperAnimatedText('Passionate Learner',
                        textStyle: AppTextStyles.montserratStyle(
                            color: AppColors.robinEdgeBlue)),
                  ],
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              )
            ],
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInDown(
          duration: const Duration(milliseconds: 1600),
          child: Text(textAlign: TextAlign.justify,
            'As a dedicated and aspiring developer, I am passionate about creating innovative solutions that enhance user experiences. My journey in software development is driven by a commitment to continuous learning and improvement. I am excited to contribute my skills in Flutter and Dart to impactful projects and collaborate with like-minded individuals in the tech community.',
            style: AppTextStyles.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 22.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          child: SizedBox(
            height: 48,
            child: ListView.separated(
              itemCount: socialButtons.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, child) =>
                  Constants.sizedBox(width: 8.0),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => _onSocialIconTap(index),
                  onHover: (value) {
                    setState(() {
                      if (value) {
                        socialBI = index;
                      } else {
                        socialBI = null;
                      }
                    });
                  },
                  borderRadius: BorderRadius.circular(550.0),
                  hoverColor: AppColors.themeColor,
                  splashColor: AppColors.lawGreen,
                  child: buildSocialButton(
                      asset: socialButtons[index],
                      hover: socialBI == index ? true : false),
                );
              },
            ),
          ),
        ),
        Constants.sizedBox(height: 20.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: AppButtons.buildMaterialButton(
              onTap:_downloadCV, buttonName: 'Download CV'),
        ),
      ],
    );
  }

  Ink buildSocialButton({required String asset, required bool hover}) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.themeColor, width: 2.0),
        color: AppColors.bgColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: Image.asset(
        asset,
        width: 10,
        height: 12,
        color: hover ? AppColors.bgColor : AppColors.themeColor,
        // fit: BoxFit.fill,
      ),
    );
  }
}
