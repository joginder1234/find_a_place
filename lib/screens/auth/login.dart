import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:find_a_place/commons/colors.dart';
import 'package:find_a_place/screens/auth/forgot_password.dart';
import 'package:find_a_place/screens/navigation_screens/home_page.dart';
import 'package:find_a_place/screens/navigation_screens/homepage.dart';
import 'package:find_a_place/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isobsecure = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double fheight = MediaQuery.of(context).size.height;
    double fwidth = MediaQuery.of(context).size.width;
    double apptitleSize = fwidth * 0.18;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        body: Stack(children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              width: fwidth,
              height: fheight * 0.9,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'FIND A PLACE',
                        style: GoogleFonts.bebasNeue(
                            fontSize: apptitleSize, color: kPrimaryColor),
                      ),
                      Text(
                        'Property Rental Services',
                        style: GoogleFonts.roboto(
                            fontSize: apptitleSize * 0.3,
                            color: kPrimaryLightColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Welcome',
                    style: GoogleFonts.roboto(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Sign in or register to save your favorite properties',
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: kdarkgreyColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildTextField('Email/Phone', 'user@gmail.com', false),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildTextField('Password', '*******', true),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BouncingWidget(
                          scaleFactor: 1.5,
                          duration: const Duration(milliseconds: 100),
                          child: const Text(
                            'Forgot password',
                            style:
                                TextStyle(fontSize: 18, color: kdarkgreyColor),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => ForgotPasswordScreen()));
                          })
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    constraints: const BoxConstraints(minHeight: 150),
                    height: fwidth * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BouncingWidget(
                          duration: const Duration(milliseconds: 70),
                          scaleFactor: 2,
                          onPressed: () {
                            setState(() {
                              isLoading = true;
                            });
                            Future.delayed(const Duration(milliseconds: 2500),
                                () {
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => MyHomePage()));
                            });
                          },
                          child: _buildLoginButton(fwidth),
                        ),
                        _buildORSection(fwidth),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BouncingWidget(
                              duration: const Duration(milliseconds: 70),
                              scaleFactor: 1.3,
                              onPressed: () {},
                              child: _buildAuthButton(fwidth, kwhiteColor,
                                  FontAwesomeIcons.google, kredColor),
                            ),
                            BouncingWidget(
                              duration: const Duration(milliseconds: 70),
                              scaleFactor: 1.3,
                              onPressed: () {},
                              child: _buildAuthButton(fwidth, kblueColor,
                                  FontAwesomeIcons.facebook, kwhiteColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'New User? ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: kdarkgreyColor),
                          ),
                          Text(
                            'Sign up',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: kredColor),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          isLoading ? const CustomLoading() : const SizedBox()
        ]),
      ),
    );
  }

  // GOOGLE AND FACEBOOK AUTH BUTTONS
  Container _buildAuthButton(
      double fwidth, Color buttoncolor, IconData icon, Color iconColor) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: fwidth * 0.4,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(color: klightgreyColor, blurRadius: 10, offset: Offset(5, 5))
      ], color: buttoncolor, borderRadius: BorderRadius.circular(100)),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }

  // DIVIDE SECTION ----- OR ------
  Row _buildORSection(double fwidth) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, kdarkgreyColor])),
            height: 1.2,
            width: fwidth,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('OR'),
        ),
        Flexible(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              kdarkgreyColor,
              Colors.transparent,
            ])),
            height: 1.2,
            width: fwidth,
          ),
        ),
      ],
    );
  }

  // APP LOGIN BUTTON ///
  Container _buildLoginButton(double fwidth) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: fwidth,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: klightgreyColor, blurRadius: 10, offset: Offset(5, 5))
          ],
          gradient: const LinearGradient(colors: [kredColor, klightredColor]),
          borderRadius: BorderRadius.circular(100)),
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 18, color: kwhiteColor),
      ),
    );
  }

  // CUSTOM TEXT FIELDS
  // FOR EMAIL OR PASSWORD
  Column _buildTextField(String title, String hint, bool isTrailing) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          obscureText: isobsecure,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
            hintText: hint,
            hintStyle: const TextStyle(color: klightgreyColor),
            suffixIcon: isTrailing
                ? isobsecure
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isobsecure = !isobsecure;
                          });
                        },
                        icon: const Icon(
                          FontAwesomeIcons.eyeSlash,
                          color: kdarkgreyColor,
                        ))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            isobsecure = !isobsecure;
                          });
                        },
                        icon: const Icon(
                          FontAwesomeIcons.eye,
                          color: kdarkgreyColor,
                        ))
                : const SizedBox(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kdarkgreyColor, width: 1.2),
            ),
            fillColor: kwhiteColor,
            filled: true,
          ),
        )
      ],
    );
  }
}
