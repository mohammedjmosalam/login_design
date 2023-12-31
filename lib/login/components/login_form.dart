import 'package:flutter/material.dart';
import 'package:login_screen_app/login/components/text_field_and_title.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isHidePassword = true;
  bool isCheckBoxEnable = false;
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          width: double.maxFinite,
          child: Form(
            key: keyForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFieldAndTitle(
                  title: 'Username',
                  hitText: 'Enter User ID or Email',
                  validator: (value) {
                    RegExp regExp = RegExp(
                        r'^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$');
                    if (value?.isEmpty ?? true) {
                      return "Username is required";
                    } else if (value!.length < 8) {
                      return "Username must have at least 8 char";
                    } else if (!regExp.hasMatch(value)) {
                      return 'Username is weak';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TextFieldAndTitle(
                    helperText:
                        'Password must have at least one uppercase char and one lowercase char and one number and one spacial char ',
                    validator: (value) {
                      RegExp regExp = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (value?.isEmpty ?? true) {
                        return "Password is required";
                      } else if (value!.length < 8) {
                        return "Password must have at least 8 char";
                      } else if (!regExp.hasMatch(value)) {
                        return 'Password must have at least one uppercase char and one lowercase char and one number and one spacial char';
                      }
                      return null;
                    },
                    title: 'Password',
                    hitText: 'Enter Password',
                    isShowPassword: isHidePassword,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isHidePassword = !isHidePassword;
                          });
                        },
                        icon: Icon(
                          isHidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: isHidePassword ? Colors.green : Colors.red,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.green.shade800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Colors.green.shade800),
                            value: isCheckBoxEnable,
                            onChanged: (value) {
                              setState(() {
                                isCheckBoxEnable = value ?? false;
                              });
                            },
                          ),
                          Text(
                            'Remember Me',
                            style: TextStyle(
                              color: Colors.green.shade800,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          if (keyForm.currentState!.validate()) {
                            print('login done');
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 15, 79, 60),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                              )),
                          child: const Center(
                            child: Text(
                              'Sign In',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
