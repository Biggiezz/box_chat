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
  final _formKey = GlobalKey<FormState>();
  final _EmailReg = RegExp(r'^[A-Za-z0-9]{2,}@([\w-]+\.)+[A-Za-z]{3,}$');
  final _PasswordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+={}\[\]|\\:;"<>,.?/~`]).{8,}$');

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
            padding: EdgeInsets.all(24),
            child: SizedBox(
              height: 160,
              child: Text(
                "Create your Account",
                style: TextStyle(
                  fontSize: 48,
                  color: Color(0xFF212121),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
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
                    //  color: const Color(0xFFFAFAFA),
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
                        hintText: "Nhập email của bạn",
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF00CDBD)),
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
          const SizedBox(height: 59),
          RichText(
            text: const TextSpan(children: <TextSpan>[
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
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(100), boxShadow: [
        BoxShadow(
          offset: const Offset(4, 8),
          blurRadius: 24,
          color: const Color(0xFF00CDBD).withValues(alpha: 0.25),
        ),
      ]),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00CDBD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          }
        },
        child: Container(
          width: 380,
          height: 58,
          alignment: Alignment.center,
          child: const Text(
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
