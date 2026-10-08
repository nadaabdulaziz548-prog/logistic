import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/logic/helper_methods.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/views/home/view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isPasswordHidden = true;
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool isEmailError = false;
  bool isPasswordError = false;
  bool isLoginError = false;

  LoginStatus? status;

  void login() async {
    setState(() {
      status = LoginStatus.loading;
      isEmailError = false;
      isPasswordError = false;
    });
    final dio = Dio();
    try {
      final resp = await dio.post(
        "https://wa7eed.growfet.com/api/Account/login",
        data: {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );
      print(resp.data);
      status = LoginStatus.loading;
      setState(() {});
      prefs.setBool("is login", true);
      goTo(page: HomeView(), keepHistory: false);
    } on DioException catch (ex) {
      status = LoginStatus.failed;
      setState(() {
        status = LoginStatus.failed;
        isLoginError = true;
        isEmailError = true;
        isPasswordError = true;
        passwordController.clear();
        emailController.clear();
      });
      print(ex.response?.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //gsco login
      body: Image.asset(
        "assets/images/login_bg.png",
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            onChanged: () {
              setState(() {});
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 57),
                Image.asset("assets/images/logo.png", height: 54, width: 162),
                SizedBox(height: 24),
                Text(
                  "Log In ",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1c3877),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Enter your email and password to log in",
                  style: TextStyle(fontSize: 14, color: Color(0xff6c7278)),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  onChanged: (value) {
                    setState(() {
                      isEmailError = false;
                      isLoginError = false;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "EMAIL ID",
                    hintText: "Enter your email",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isEmailError ? Colors.red : Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isEmailError ? Colors.red : Colors.blue,
                        width: 2.0,
                      ),
                    ),

                    prefixIcon: SvgPicture.asset(
                      "assets/icons/email_id.svg",
                      width: 20,
                      height: 20,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  obscuringCharacter: "*",
                  controller: passwordController,
                  obscureText: isPasswordHidden,
                  onChanged: (value) {
                    setState(() {
                      isPasswordError = false;
                      isLoginError = false;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "PASSWORD",
                    hintText: "Enter your password",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isPasswordError ? Colors.red : Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isPasswordError ? Colors.red : Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 24,
                          child: VerticalDivider(
                            color: Color(0xffD9D9D9),
                            thickness: 1,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            isPasswordHidden = !isPasswordHidden;
                            setState(() {});
                          },
                          icon: SvgPicture.asset(
                            "assets/icons/password_${isPasswordHidden ? "off" : "on"}.svg",
                            width: 20,
                            height: 20,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ],
                    ),
                    prefixIcon: SvgPicture.asset(
                      "assets/icons/password.svg",
                      width: 20,
                      height: 20,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                if (isLoginError) ...[
                  SizedBox(height: 8),
                  Text(
                    "Invalid email or password",
                    style: TextStyle(color: Colors.red, fontSize: 13),
                  ),
                ],

                SizedBox(height: 24),
                FilledButton.icon(
                  icon: SizedBox(
                    width: 20,
                    height: 20,
                    child: status == LoginStatus.loading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          )
                        : null,
                  ),
                  onPressed:
                      emailController.text.isEmpty ||
                          passwordController.text.isEmpty ||
                          status == LoginStatus.loading
                      ? null
                      : login,
                  label: Text("Login"),
                ),
                SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum LoginStatus { loading, failed, success }
