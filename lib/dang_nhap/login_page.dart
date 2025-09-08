import 'package:boxchat/account_setup/account_setup.dart';
import 'package:flutter/material.dart';

import '../assets/image.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscured = true;
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  final _EmailReg = RegExp(r'^[A-Za-z0-9]{2,}@([\w-]+\.)+[A-Za-z]{3,}$');
  final _PasswordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 45, 24, 24),
            child: Text(
              "Login to your Account",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w700,
                color: Color(0xFF212121),
                fontFamily: 'Urbanist Script',
              ),
            ),
          ),
          // Email field
          // === (SỬA) ===
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  // Email container
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty || !_EmailReg.hasMatch(value)) {
                          return "Vui lòng nhập đúng email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle:const TextStyle(
                          color: Color(0xff9E9E9E),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF00CDBD)),
                          borderRadius: BorderRadius.circular(12),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffFAFAFA)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.email,
                            color: Color(0xFF9E9E9E), size: 20),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Password container (GIỜ NẰM TRONG CÙNG 1 FORM)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFFFAFAFA),

                    ),
                    child: TextFormField(

                      controller: _passwordController,
                      obscureText: _isObscured,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 8 ||
                            !_PasswordRegex.hasMatch(value)) {
                          return "Vui lòng nhập đúng mật khẩu";
                        }
                        return null;
                      },

                      decoration: InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF00CDBD)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.lock, color: Colors.grey, size: 20),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off,size: 20,),

                          onPressed: () => setState(() => _isObscured = !_isObscured),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          _buildCheckBox(),
          _buildButtonSign(),
          const Text(
            "Forgot the password?",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF00CDBD),
            ),
          ),
          const SizedBox(height: 45),
          _buildOr(),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSocial(image: ImageAssets.logoFb),
              _buildSocial(image: ImageAssets.logoGg),
              _buildSocial(image: ImageAssets.logoApple),
            ],
          ),
          const SizedBox(height: 45),
          RichText(
            text: const TextSpan(children: <TextSpan>[
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
        ],
      ),
    );
  }

  Widget _buildCheckBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
        const Text(
          "Remember me",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF212121),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonSign() {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AccountSetup()),
          );
        }
      },
      child: Container(
        height: 58,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color(0xFF00CDBD),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00CDBD).withValues(alpha: 0.25),
              blurRadius: 24,
              offset: const Offset(4, 8),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            "Sign in",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOr() {
    return const Row(
      children: [
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
      ],
    );
  }

  Widget _buildSocial({String? image}) {
    return Container(
      height: 60,
      width: 88,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEEEEEE)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset(image ?? ''),
    );
  }
}
