import 'package:boxchat/assets/image.dart';
import 'package:boxchat/dang_nhap/login_page.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 59, 24, 59),
            child: Text(
              "Create your Account",
              style: TextStyle(
                fontSize: 48,
                color: Color(0xFF212121),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: TextField(
              focusNode: _emailFocus,
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: "Nhập email của bạn",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(
                  Icons.email,
                  color: Color(0xFF9E9E9E),
                  size: 20,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: TextField(
              focusNode: _passwordFocus,
              controller: _passwordController,
              obscureText: _isObscured,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: "Nhập mật khẩu của bạn",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(
                  Icons.lock,
                  size: 20,
                  color: Color(0xFF9E9E9E),
                ),
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
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
          _checkBox(),
          const SizedBox(height: 20),
          _buildButtonSignup(),
          const SizedBox(height: 40),
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
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9E9E9E),
                      fontFamily: "Urbanist Script",
                    ),
                  ),
                  TextSpan(
                      text: '  Sign in',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF00CDBD),
                        fontFamily: "Urbanist Script",
                      )),
                ]),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonSignup() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
      child: Container(
        width: 380,
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color(0xFF11B1A5),
        ),
        child: const Center(
          child: Text(
            "Sign up",
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

  Widget _checkBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(scale: 1.5),
        Checkbox(
          side: const BorderSide(
            width: 2.5,
            color: Color(0xFF00CDBD),
          ),
          activeColor: const Color(0xFF00CDBD),
          checkColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        const Text(
          "Remember me",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: "Urbanist Script",
          ),
        ),
      ],
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
            fontFamily: "Urbanist Script",
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
