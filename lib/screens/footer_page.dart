import 'package:flutter/material.dart';
import 'package:user_profile/core/constants/app_colors.dart';

class FooterClass extends StatelessWidget {
  final ScrollController scrollController;

  const FooterClass({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      color: AppColors.bgColor,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: InkWell(
        onTap: () {
          scrollController.animateTo(
            0, // Scroll to the top
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.themeColor,
          ),
          child: const Icon(
            Icons.arrow_upward,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
