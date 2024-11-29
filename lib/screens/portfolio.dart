import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:user_profile/core/constants/app_assets.dart';
import 'package:user_profile/core/constants/app_colors.dart';
import 'package:user_profile/core/constants/app_text_style.dart';
import 'package:user_profile/core/constants/constants.dart';
import 'package:user_profile/core/utils/responsive.dart';

class MyPortfolio extends StatefulWidget {
  const MyPortfolio({Key? key}) : super(key: key);

  @override
  State<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> {
  final onHoverEffect = Matrix4.identity()..scale(1.0);

  List<String> images = <String>[
    AppAssets.work1,
    AppAssets.work2,
    AppAssets.work1,
    AppAssets.work2,
    AppAssets.work1,
    AppAssets.work2,
  ];

  List<String> titles = [
    'Recipe App',
    'UI/UX Design App',
    'API Integration App',
    'Expense Tracker App',
    'Repository',
    'English Dictionary App',
  ];

  List<String> descriptions = [
    'Specializing in Flutter apps with a focus on performance.',
    'Creating user-friendly and responsive designs.',
    'Enhancing functionality through seamless API integration.',
    'Building responsive and dynamic expense tracker app.',
    'Crafting visually appealing graphic designs.',
    'Providing vocabulary word to improve the language.',
  ];

  List<String> githubLinks = [
    'https://github.com/M-AWAIS786/RecipeApp',
    'https://github.com/M-AWAIS786/UI_Flutter',
    'https://github.com/M-AWAIS786/F_List_Object_model_api',
    'https://github.com/M-AWAIS786/Expenses_tracker_App',
    'https://github.com/M-AWAIS786?tab=repositories',
    'https://github.com/M-AWAIS786/EnglishWordsApp',
  ];

  var hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 1, isMobile: true),
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 2, isMobile: false),
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 3, isMobile: false),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor,
    );
  }

  GridView buildProjectGridView({required int crossAxisCount, required bool isMobile}) {
    return GridView.builder(
      itemCount: images.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 280,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        var image = images[index];
        var title = titles[index];
        var description = descriptions[index];

        return FadeInUpBig(
          duration: const Duration(milliseconds: 1600),
          child: InkWell(
            onTap: () async {
              var url = githubLinks[index];
              final Uri _url = Uri.parse(url);
              if (await launchUrl(_url)) {
              } else {
                throw 'Could not launch $url';
              }
            },
            onHover: isMobile ? null : (value) {
              setState(() {
                hoveredIndex = value ? index : null;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                if (isMobile || hoveredIndex == index)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    transform: isMobile ? null : (index == hoveredIndex ? onHoverEffect : null),
                    curve: Curves.easeIn,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.themeColor.withOpacity(1.0),
                          AppColors.themeColor.withOpacity(0.9),
                          AppColors.themeColor.withOpacity(0.8),
                          AppColors.themeColor.withOpacity(0.6),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.montserratStyle(
                            color: Colors.black87,
                            fontSize: 20,
                          ),
                        ),
                        Constants.sizedBox(height: 15.0),
                        Text(
                          description,
                          style: AppTextStyles.normalStyle(
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Constants.sizedBox(height: 30.0),
                        CircleAvatar(
                          maxRadius: 25,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            AppAssets.share,
                            width: 25,
                            height: 25,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  FadeInDown buildProjectText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Latest ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Projects',
              style: AppTextStyles.headingStyles(
                fontSize: 30,
                color: AppColors.robinEdgeBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
