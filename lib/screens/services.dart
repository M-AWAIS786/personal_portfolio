import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:user_profile/core/constants/app_assets.dart';
import 'package:user_profile/core/constants/app_buttons.dart';
import 'package:user_profile/core/constants/app_colors.dart';
import 'package:user_profile/core/constants/app_text_style.dart';
import 'package:user_profile/core/constants/constants.dart';
import 'package:user_profile/core/utils/responsive.dart';

class MyServices extends StatefulWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  bool isAppHovered = false;
  bool isGraphicHovered = false;
  bool isDataAnalystHovered = false;
  bool isAppTapped = false;
  bool isGraphicTapped = false;
  bool isDataAnalystTapped = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    bool isMobile =size.width< 768 ? true : false;

    return HelperClass(
      mobile: Column(
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          InkWell(
            onTap: () {
              setState(() {
                isAppTapped = !isAppTapped;
              });
            },
            onHover: isMobile ? null : (value) {
              setState(() {
                isAppHovered = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'App Development',
              asset: AppAssets.code,
              isHovered: isMobile ? isAppTapped : isAppHovered,
            ),
          ),
          Constants.sizedBox(height: 24.0),
          InkWell(
            onTap: () {
              setState(() {
                isGraphicTapped = !isGraphicTapped;
              });
            },
            onHover: isMobile ? null : (value) {
              setState(() {
                isGraphicHovered = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'UI/UX Design',
              asset: AppAssets.brush,
              isHovered: isMobile ? isGraphicTapped : isGraphicHovered,
            ),
          ),
          Constants.sizedBox(height: 24.0),
          InkWell(
            onTap: () {
              setState(() {
                isDataAnalystTapped = !isDataAnalystTapped;
              });
            },
            onHover: isMobile ? null : (value) {
              setState(() {
                isDataAnalystHovered = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'API Integration',
              asset: AppAssets.analyst,
              isHovered: isMobile ? isDataAnalystTapped : isDataAnalystHovered,
            ),
          )
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isAppTapped = !isAppTapped;
                  });
                },
                onHover: isMobile ? null : (value) {
                  setState(() {
                    isAppHovered = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'App Development',
                  asset: AppAssets.code,
                  isHovered: isMobile ? isAppTapped : isAppHovered,
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {
                  setState(() {
                    isGraphicTapped = !isGraphicTapped;
                  });
                },
                onHover: isMobile ? null : (value) {
                  setState(() {
                    isGraphicHovered = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'UI/UX Design',
                  asset: AppAssets.brush,
                  isHovered: isMobile ? isGraphicTapped : isGraphicHovered,
                ),
              ),
            ],
          ),
          Constants.sizedBox(height: 26.0),
          InkWell(
            onTap: () {
              setState(() {
                isDataAnalystTapped = !isDataAnalystTapped;
              });
            },
            onHover: isMobile ? null : (value) {
              setState(() {
                isDataAnalystHovered = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'API Integration',
              asset: AppAssets.analyst,
              isHovered: isMobile ? isDataAnalystTapped : isDataAnalystHovered,
              width: 725.0,
            ),
          )
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isAppTapped = !isAppTapped;
                  });
                },
                onHover: isMobile ? null : (value) {
                  setState(() {
                    isAppHovered = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'App Development',
                  asset: AppAssets.code,
                  isHovered: isMobile ? isAppTapped : isAppHovered,
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {
                  setState(() {
                    isGraphicTapped = !isGraphicTapped;
                  });
                },
                onHover: isMobile ? null : (value) {
                  setState(() {
                    isGraphicHovered = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'UI/UX Design',
                  asset: AppAssets.brush,
                  isHovered: isMobile ? isGraphicTapped : isGraphicHovered,
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {
                  setState(() {
                    isDataAnalystTapped = !isDataAnalystTapped;
                  });
                },
                onHover: isMobile ? null : (value) {
                  setState(() {
                    isDataAnalystHovered = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'API Integration',
                  asset: AppAssets.analyst,
                  isHovered: isMobile ? isDataAnalystTapped : isDataAnalystHovered,
                ),
              )
            ],
          ),
        ],
      ),
      paddingWidth: size.width * 0.02,
      bgColor: AppColors.bgColor,
    );
  }

  FadeInDown buildMyServicesText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'My ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Services',
              style: AppTextStyles.headingStyles(
                  fontSize: 30.0, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer({
    required String title,
    required String asset,
    required bool isHovered,
    double width = 350,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isHovered ? 360 : width,
      height: isHovered ? 390 : 380,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(30),
        border: isHovered ? Border.all(color: AppColors.themeColor, width: 3) : null,
        boxShadow: isHovered ? [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 4.0,
            blurRadius: 4.5,
            offset: Offset(3.0, 4.5),
          )
        ] : null,
      ),
      child: Column(
        children: [
          Image.asset(
            asset,
            width: 50,
            height: 50,
            color: AppColors.themeColor,
          ),
          Constants.sizedBox(height: 30.0),
          Text(
            title,
            style: AppTextStyles.montserratStyle(
                color: Colors.white, fontSize: 22.0),
          ),
          Constants.sizedBox(height: 12.0),
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              title == 'App Development'
                  ? 'I specialize in creating high-performance mobile applications using Flutter, focusing on delivering intuitive user experiences and seamless functionality. My approach involves understanding client requirements thoroughly to build applications that not only meet but exceed user expectations.'
                  : title == 'UI/UX Design'
                  ? 'I create intuitive and visually appealing user interfaces that enhance user experience. My designs focus on user needs, ensuring seamless navigation and responsive layouts across devices.'
                  : 'I specialize in integrating APIs to enhance application functionality and streamline data exchange. By leveraging RESTful services and third-party APIs, I ensure seamless connectivity between front-end and back-end systems, enabling dynamic features and improving user engagement.',
              style: AppTextStyles.normalStyle(fontSize: 14.0),
              textAlign: TextAlign.center,
            ),
          ),
          Constants.sizedBox(height: 20.0),
          AppButtons.buildMaterialButton(buttonName: 'Show More', onTap: () {
            setState(() {
              // Implement the functionality for 'Show More' button here
            });
          })
        ],
      ),
    );
  }
}
