import 'package:boxchat/assets/image.dart';
import 'package:boxchat/create_account/create_account.dart';
import 'package:flutter/material.dart';

import '../dang_nhap/login_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  get style async => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset(
                    ImageAssets.logoLogin,
                  ),
                  const SizedBox(height: 40.25),
                  const Text(
                    "Let's you in",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 48,
                     fontFamily: 'Urbanist Script',
                     shadows: <Shadow>[
                       Shadow(
                        offset: Offset(0, 4),
                         blurRadius: 4,



                       ),

                     ]


                      )
                    ),

                  const SizedBox(height: 40.25),
                  _buttonSignWith(
                      text: "Continue with Facebook",
                      image: ImageAssets.logoFb),
                  const SizedBox(height: 16),
                  _buttonSignWith(
                      text: "Continue with Google", image: ImageAssets.logoGg),
                  const SizedBox(height: 16),
                  _buttonSignWith(
                      text: "Continue with Apple",
                      image: ImageAssets.logoApple),
                  const SizedBox(height: 24),
                  _buildOr(),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: _buildLoginOption(text: "Sign in with password"),
                  ),
                ],
              ),
              const SizedBox(height: 40.25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9E9E9E),
                      fontFamily: 'Urbanist Script',
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Signup(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign up?",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF00CDBD),
                        fontFamily: 'Urbanist Script',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOr() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: 155,
                color: const Color(0xFF00CDBD), height: 1),
          ),
          const SizedBox(width: 16),
          const Text(
            'or',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Urbanist Script',
              fontWeight: FontWeight.w600,
              color: Color(0xff616161),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(color: const Color(0xFF00CDBD), height: 1),
          ),
        ],
      ),
    );
  }
}

// Widget tạo nút đăng nhập
Widget _buildLoginOption({
  required String text,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: const Color(0xFF00CDBD),
boxShadow: [BoxShadow(
  color: const Color(0xff00CDBD).withValues(alpha: 0.25),
  blurRadius: 24,
  offset: const Offset(4, 8),),
]


    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Urbanist Script',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ],
    ),
  );
}

Widget _buttonSignWith({String? text, String? image}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(width: 1, color: const Color(0xff00DECD)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image ?? ''),
        const SizedBox(width: 12),
        Text(
          text ?? '',
          style: const TextStyle(
            fontFamily: 'Urbanist Script',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xff212121),
          ),
        ),
      ],
    ),
  );
}
