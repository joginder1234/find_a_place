import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:find_a_place/commons/colors.dart';
import 'package:find_a_place/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  int activeButtonIndex = 3;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double fheight = MediaQuery.of(context).size.height;
    double fwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(minHeight: 530),
              width: fwidth,
              height: fheight * 0.65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/auth_icons/forgotPass.png',
                    width: fwidth * 0.5,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Forgot Password',
                        style: GoogleFonts.ubuntu(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Select which contact details should we use to reset your password',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ubuntu(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: kdarkgreyColor),
                        ),
                      ),
                    ],
                  ),
                  BouncingWidget(
                      duration: const Duration(milliseconds: 70),
                      scaleFactor: 1.8,
                      child: _buildChoiceBox(0, 'assets/auth_icons/phone.png',
                          'via SMS:', 'xxx xxx 1444'),
                      onPressed: () {
                        Future.delayed(const Duration(milliseconds: 100), () {
                          setState(() {
                            activeButtonIndex = 0;
                            isLoading = true;
                          });
                        });
                      }),
                  BouncingWidget(
                      duration: const Duration(milliseconds: 70),
                      scaleFactor: 1.8,
                      child: _buildChoiceBox(1, 'assets/auth_icons/mailBox.png',
                          'via email:', 'xxxxxxhsr@gmail.com'),
                      onPressed: () {
                        Future.delayed(const Duration(milliseconds: 60), () {
                          setState(() {
                            activeButtonIndex = 1;
                            isLoading = true;
                          });
                        });
                      }),
                ],
              ),
            ),
          ),
        ),
        isLoading ? const CustomLoading() : const SizedBox()
      ]),
    );
  }

  Container _buildChoiceBox(
      int id, String icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: id == 0 && activeButtonIndex == 0
            ? kPrimaryLightColor
            : id == 1 && activeButtonIndex == 1
                ? kPrimaryLightColor
                : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 50,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: id == 0 && activeButtonIndex == 0
                      ? kwhiteColor
                      : id == 1 && activeButtonIndex == 1
                          ? kwhiteColor
                          : kdarkgreyColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                subtitle,
                style: TextStyle(
                    fontSize: 20,
                    color: id == 0 && activeButtonIndex == 0
                        ? kwhiteColor
                        : id == 1 && activeButtonIndex == 1
                            ? kwhiteColor
                            : Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
