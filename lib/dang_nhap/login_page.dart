import 'package:boxchat/account_setup/account_setup.dart';
import 'package:flutter/material.dart';

import '../assets/image.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscured = true;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _isObscured = true;
  }

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(24, 45, 24, 24),
          child: Text(
            "Login to your Account",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              color: Color(0xFF212121),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFFAFAFA),
                ),
                child: TextField(
                  focusNode: _emailFocus,
                  controller: _emailController,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    hintText: "Nhập email của bạn",
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFBDBDBD)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFFFAFAFA),
                      ),
                    ),
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email,
                        color: Color(0xFF9E9E9E), size: 20),
                  ),
                ))),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Nhập mật khẩu của bạn",
              border: OutlineInputBorder(
                //gapPadding: 100,


                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFFFAFAFA),
                ),
              ),
              labelText: 'Password',
              prefixIcon:
                  const Icon(Icons.lock, color: Color(0xFF9E9E9E), size: 20),
              suffixIcon: IconButton(
                padding: const EdgeInsetsDirectional.only(end: 12),
                icon: _isObscured
                    ? const Icon(
                        Icons.visibility,
                        color: Color(0xFF9E9E9E),
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: Color(0xFF9E9E9E),
                      ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              ),
            ),
          ),
        ),
        _buildCheckBox(),
        _buildButtonSign(),
        const SizedBox(height: 20),
        const Text(
          "Forgot the password?",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF00CDBD),
          ),
        ),
        _buildOr(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSocial(
              image: ImageAssets.logoFb,
            ),
            _buildSocial(
              image: ImageAssets.logoGg,
            ),
            _buildSocial(
              image: ImageAssets.logoApple,
            ),
          ],
        ),
        const SizedBox(height: 45),
        RichText(
          text: const TextSpan(
              children:  <TextSpan>[
                TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9E9E9E),
                  ),
                ),
                TextSpan(
                  text: "  Sign up ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF00CDBD),
                  ),
                ),
              ]),
        ),
      ]),
    );
  }

  Widget _buildCheckBox() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Transform.scale(scale: 1.5),
      Checkbox(
        side: const BorderSide(
          width: 2.5,
          color: Color(0xFF00CDBD),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        activeColor: const Color(0xFF00CDBD),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
      const Text("Remember me"),
    ]);
  }

  Widget _buildButtonSign() {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AccountSetup(),
          ));
      },
      child: Container(
        height: 58,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color(0xFF11B1A5),
        ),
        child: const Center(
          child: Text(
            "Sign in",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOr() {
    return const Padding(
      padding: EdgeInsets.all(34),
      child: Row(children: [
        Expanded(child: Divider(color: Color(0xFFEEEEEE))),
        SizedBox(width: 16),
        Text(
          "or continue with",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF616161),
          ),
        ),
        SizedBox(width: 16),
        Expanded(child: Divider(color: Color(0xFFEEEEEE))),
      ]),
    );
  }

  Widget _buildSocial({String? image}) {
    return Container(
      height: 60,
      width: 88,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFEEEEEE),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset(image ?? ''),
    );
  }
}
