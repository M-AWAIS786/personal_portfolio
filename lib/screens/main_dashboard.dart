import 'package:flutter/material.dart';
import 'package:user_profile/core/constants/app_colors.dart';
import 'package:user_profile/core/constants/app_text_style.dart';
import 'package:user_profile/core/constants/constants.dart';
import 'package:user_profile/screens/about_page.dart';
import 'package:user_profile/screens/contact_us.dart';
import 'package:user_profile/screens/footer_page.dart';
import 'package:user_profile/screens/home_page.dart';
import 'package:user_profile/screens/portfolio.dart';
import 'package:user_profile/screens/services.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({Key? key}) : super(key: key);

  @override
  _MainDashBoardState createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  final ScrollController yourScrollController = ScrollController();
  final onMenuHover = Matrix4.identity()..scale(1.0);
  final menuItems = <String>[
    'Home',
    'About',
    'Services',
    'Portfolio',
    'Contact',
  ];

  final menuIcons = <IconData>[
    Icons.home,
    Icons.info,
    Icons.business_center,
    Icons.work,
    Icons.contact_mail,
  ];

  var menuIndex = 0;

  final screensList = const <Widget>[
    HomePage(),
    AboutMe(),
    MyServices(),
    MyPortfolio(),
    ContactUs(),
  ];

  Future scrollTo({required int index}) async {
    final offset = index * MediaQuery.of(context).size.height;
    yourScrollController.animateTo(
      offset,
      duration: const Duration(seconds: 2),
      curve: Curves.fastLinearToSlowEaseIn,
    ).whenComplete(() {
      setState(() {
        menuIndex = index;
      });
    });
  }

  @override
  void dispose() {
    yourScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 90,
        titleSpacing: 40,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.white),
        title: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 768) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Awais',
                    style: AppTextStyles.headerTextStyle(color: Colors.white),
                  ),
                  const Spacer(),

                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Awais',
                    style: AppTextStyles.headerTextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                      itemCount: menuItems.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, child) => Constants.sizedBox(width: 8.0),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            scrollTo(index: index);
                          },
                          borderRadius: BorderRadius.circular(100),
                          onHover: (value) {
                            setState(() {
                              if (value) {
                                menuIndex = index;
                              } else {
                                menuIndex = 0;
                              }
                            });
                          },
                          child: buildNavBarAnimatedContainer(index, menuIndex == index),
                        );
                      },
                    ),
                  ),
                  Constants.sizedBox(width: 30.0),
                ],
              );
            }
          },
        ),
      ),
      drawer: size.width < 768 ? buildDrawer() : null,
      body: Scrollbar(
        trackVisibility: false,
        thumbVisibility: false,
        thickness: 8,
        interactive: false,
        controller: yourScrollController,
        child: CustomScrollView(
          controller: yourScrollController,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return index < screensList.length
                      ? screensList[index]
                      : FooterClass(scrollController: yourScrollController);
                },
                childCount: screensList.length+1 ,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.themeColor, // Darker shade for a professional look
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    color: AppColors.white,
                    size: 72,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Welcome!',
                    style: AppTextStyles.headerTextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          ...menuItems.asMap().entries.map((e) {
            return ListTile(
              leading: Icon(
                menuIcons[e.key],
                color: AppColors.themeColor, // Change icon color to theme color
              ),
              title: Text(
                e.value,
                style: AppTextStyles.headerTextStyle(color: AppColors.bgColor), // Use white for text
              ),
              onTap: () {
                scrollTo(index: e.key);
                Navigator.pop(context);
              },
            );
          }).toList(),
        ],
      ),
    );
  }

  AnimatedContainer buildNavBarAnimatedContainer(int index, bool hover) {
    return AnimatedContainer(
      alignment: Alignment.center,
      width: hover ? 80 : 75,
      duration: const Duration(milliseconds: 200),
      transform: hover ? onMenuHover : null,
      child: Text(
        menuItems[index],
        style: AppTextStyles.headerTextStyle(
          color: hover ? AppColors.themeColor : AppColors.white,
        ),
      ),
    );
  }
}