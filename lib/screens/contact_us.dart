import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:user_profile/core/constants/app_buttons.dart';
import 'package:user_profile/core/constants/app_colors.dart';
import 'package:user_profile/core/constants/app_text_style.dart';
import 'package:user_profile/core/constants/constants.dart';
import 'package:user_profile/core/utils/responsive.dart';
import 'package:http/http.dart'as http;

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  void sendEmail(String name, String email, String subject, String message) async {
    // Validation
    if (_validateFields(name, email, subject, message)) {
      const String serviceId = 'service_kw2zgoq';
      const String templateId = 'template_qzcun0j';
      const String userId = '7byoB62KScFt12hgP';

      setState(() {
        _isLoading = true;
        _errorMessage = null; // Clear any previous error messages
      });

      final response = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'name': name,
            'email': email,
            'subject': subject,
            'message': message,
          },
        }),
      );

      setState(() {
        _isLoading = false; // Reset loading state
      });

      if (response.statusCode == 200) {
        _nameController.clear();
        _emailController.clear();
        _mobileController.clear();
        _subjectController.clear();
        _messageController.clear();
        print('Email sent successfully!');
        _showDialog(context, 'Success', 'Email sent successfully!', AppColors.themeColor);
      } else {
        _showDialog(context, 'Failed', 'Failed to send email. Please try again.', Colors.red);
        print('Failed to send email: ${response.body}');
      }
    }
  }
  void _showDialog(BuildContext context, String title, String message, Color color) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.bgColor,
          title: Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(color: AppColors.white, fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'OK',
                style: TextStyle(color: AppColors.themeColor),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
      },
    );
  }
  bool _validateFields(String name, String email, String subject, String message) {
    // Regular expression for validating email format
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    // Regular expression for validating mobile number (digits only)
    final RegExp mobileRegex = RegExp(r'^[0-9]+$');

    if (name.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter your name.';
      });
      return false;
    } else if (email.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter your email address.';
      });
      return false;
    } else if (!emailRegex.hasMatch(email)) {
      setState(() {
        _errorMessage = 'Please enter a valid email address.';
      });
      return false;
    } else if (subject.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter the subject.';
      });
      return false;
    } else if (message.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter your message.';
      });
      return false;
    } else if (_mobileController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter your mobile number.';
      });
      return false;
    } else if (!mobileRegex.hasMatch(_mobileController.text)) {
      setState(() {
        _errorMessage = 'Please enter a valid mobile number (digits only).';
      });
      return false;
    }
    return true; // All fields are valid
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildContactText(),
          Constants.sizedBox(height: 40.0),
          buildTextField(_nameController, 'Full Name'),
          Constants.sizedBox(height: 20.0),
          buildTextField(_emailController, 'Email Address'),
          Constants.sizedBox(height: 20.0),
          buildTextField(_mobileController, 'Mobile Number'),
          Constants.sizedBox(height: 20.0),
          buildTextField(_subjectController, 'Email Subject'),
          Constants.sizedBox(height: 20.0),
          buildTextField(_messageController, 'Your Message', maxLines: 15),
          Constants.sizedBox(height: 40.0),
          if (_errorMessage != null)
            Text(_errorMessage!, style: TextStyle(color: Colors.red)),
          if (_isLoading)
            CircularProgressIndicator()
          else
            AppButtons.buildMaterialButton(
                buttonName: 'Send Message', onTap:() => sendEmail(_nameController.text, _emailController.text, _subjectController.text, _messageController.text)),
          Constants.sizedBox(height: 30.0),
        ],
      ),
      tablet: buildForm(),
      desktop: buildForm(),
      paddingWidth: size.width * 0.2,
      bgColor: AppColors.bgColor,
    );
  }

  Material buildTextField(TextEditingController controller, String hintText, {int maxLines = 1}) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      elevation: 8,
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        cursorColor: AppColors.white,
        style: AppTextStyles.normalStyle(),
        decoration: buildInputDecoration(hintText: hintText),
      ),
    );
  }

  Column buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildContactText(),
        Constants.sizedBox(height: 40.0),
        Row(
          children: [
            Expanded(
              child: buildTextField(_nameController, 'Full Name'),
            ),
            Constants.sizedBox(width: 20.0),
            Expanded(
              child: buildTextField(_emailController, 'Email Address'),
            ),
          ],
        ),
        Constants.sizedBox(height: 20.0),
        Row(
          children: [
            Expanded(
              child: buildTextField(_mobileController, 'Mobile Number'),
            ),
            Constants.sizedBox(width: 20.0),
            Expanded(
              child: buildTextField(_subjectController, 'Email Subject'),
            ),
          ],
        ),
        Constants.sizedBox(height: 20.0),
        buildTextField(_messageController, 'Your Message', maxLines: 15),
        Constants.sizedBox(height: 40.0),
        if (_errorMessage != null)
          Text(_errorMessage!, style: TextStyle(color: Colors.red)),
        if (_isLoading)
          CircularProgressIndicator()
        else
          AppButtons.buildMaterialButton(
              buttonName: 'Send Message', onTap:() => sendEmail(_nameController.text, _emailController.text, _subjectController.text, _messageController.text)),
        Constants.sizedBox(height: 30.0),
      ],
    );
  }

  FadeInDown buildContactText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Contact ',
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
    );
  }

  InputDecoration buildInputDecoration({required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.comfortaaStyle(color: AppColors.grey, fontSize: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.themeColor, width: 2),
      ),
      filled: true,
      fillColor: AppColors.bgColor.withOpacity(0.8),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    );
  }
}
