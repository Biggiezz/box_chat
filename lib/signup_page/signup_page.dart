import 'package:boxchat/assets/image.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _rememberMe = false;

  get _signInRecognizer => null;
  @override
  void dispose() {
    _signInRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24, 59, 24, 20),
            child: const Text(
              'Create your Account',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w700,
                color: Color(0xff212121),
                fontFamily: 'Urbanist Script',
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
            child: TextField(
              decoration: InputDecoration(
                label: const Text('Email'),
                fillColor: const Color(0xffFAFAFA),
                hintText: 'Nhập vào email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon:const Icon(Icons.email, color: Color(0xff9E9E9E)),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
            child: TextField(
              decoration: InputDecoration(
                label: const Text('Password'),
                fillColor: const Color(0xffFAFAFA),
                hintText: 'Nhập vào mật khẩu',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon:const Icon(Icons.lock, color: Color(0xff9E9E9E)),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(scale: 2),
              Checkbox(
                side: const BorderSide(width: 2.5, color: Color(0XFF00CDBD)),
                activeColor: const Color(0XFF00CDBD),
                checkColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                value: _rememberMe,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                },
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Remember me',
                    style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 22),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(380, 58),
              backgroundColor: const Color(0xff11B1A5),
            ),
            onPressed: () {},
            child: const Text(
              'Sign up',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          const SizedBox(height: 59.75),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Divider(color: Color(0xffEEEEEE))),
              SizedBox(width: 15),
              Text(
                'or continue with',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff616161),
                ),
              ),
              SizedBox(width: 15),
              Expanded(child: Divider(color: Color(0xffEEEEEE))),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.logoFb, width: 24, height: 24),
              const SizedBox(width: 80),
              Image.asset(ImageAssets.logoGg, width: 24, height: 24),
              const SizedBox(width: 80),
              Image.asset(ImageAssets.logoApple, width: 24, height: 24),

            ],

          ),

          const SizedBox(height: 59.75),
          RichText(
            text: TextSpan(
                text: 'Already have an account?',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff9E9E9E),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '  Sign in',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff00CDBD),
                      fontFamily: 'Urbanist Script',
                    ),
                    recognizer: _signInRecognizer,
                  ),
                ]),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
