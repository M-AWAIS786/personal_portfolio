import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:user_profile/core/constants/app_buttons.dart';
import 'package:user_profile/core/constants/app_colors.dart';
import 'package:user_profile/core/constants/app_text_style.dart';
import 'package:user_profile/core/utils/responsive.dart';
import 'package:user_profile/widgets/profile_animation.dart';

import '../core/constants/constants.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildAboutMeContents(),
          Constants.sizedBox(height: 35.0),
          ProfileAnimation(),
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileAnimation(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileAnimation(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor,
    );
  }

  Column buildAboutMeContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: RichText(
            text: TextSpan(
              text: 'About ',
              style: AppTextStyles.headingStyles(fontSize: 30.0),
              children: [
                TextSpan(
                  text: 'Me!',
                  style: AppTextStyles.headingStyles(
                      fontSize: 30, color: AppColors.robinEdgeBlue),
                )
              ],
            ),
          ),
        ),
        Constants.sizedBox(height: 6.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Flutter Developer!',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 8.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1600),
          child: Text(textAlign: TextAlign.justify,
            isExpanded
        ? 'My journey into software development has been fueled by my curiosity and enthusiasm for technology, driving me to explore various frameworks and tools. I have a keen interest in UI/UX design, believing that aesthetics and functionality should go hand in hand. In addition to my technical skills in Dart and Flutter, I am also developing my knowledge in full-stack development, aiming to build comprehensive applications that solve real-world problems. I thrive in collaborative environments where I can share ideas and learn from others, and I am always looking for opportunities to enhance my skills and contribute to impactful projects.......'
        : 'I am a passionate Flutter Developer with a strong desire to create intuitive and dynamic user experiences. With a background in problem-solving and a commitment to continuous learning, I enjoy tackling challenges and turning ideas into functional applications.',
            style: AppTextStyles.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: AppButtons.buildMaterialButton(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            buttonName: isExpanded ? 'Show Less' : 'Read More',
          ),
        )
      ],
    );
  }
}
