import 'dart:io';
import 'package:boxchat/assets/image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccountSetup extends StatefulWidget {
  const AccountSetup({super.key});

  @override
  State<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Fill Your Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 90,
                    backgroundColor: Colors.grey[300],
                    backgroundImage:
                        _imageFile != null ? FileImage(_imageFile!) : null,
                    child: _imageFile == null
                        ? const Icon(Icons.person,
                            size: 200, color: Colors.white)
                        : null,
                  ),

                  // Icon cây bút
                  Positioned(
                    bottom: 0,
                    right: 10,
                    child: InkWell(
                      onTap: _pickImage, // bấm để đổi ảnh
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF00CDBD),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildTextField(
                hintext: 'Full Name',
              ),
              const SizedBox(height: 20),
              _buildTextField(
                hintext: 'Nickname',
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFFAFAFA),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF212121),
                    ),
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9E9E9E),
                        ),
                        suffixIcon: Image.asset(ImageAssets.emailSetup),
                        border: InputBorder.none),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFFAFAFA),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      DropdownButton<String>(
                        value: "+1",
                        underline: const SizedBox(), // bỏ gạch dưới
                        items: const [
                          DropdownMenuItem(value: "+84", child: Text("🇻🇳")),
                          DropdownMenuItem(value: "+1", child: Text("🇺🇸")),
                          DropdownMenuItem(value: "+81", child: Text("🇯🇵")),
                        ],
                        onChanged: (value) {},
                      ),
                      const SizedBox(width: 8),
                      // Ô nhập số điện thoại
                      const Expanded(
                        child: TextField(
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF212121),
                          ),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintText: "Phone Number",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF9E9E9E),
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 160),
              _buildButtonContinue(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({String? hintext}) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFFAFAFA),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF212121),
          ),
          decoration: InputDecoration(
              hintText: hintext!,
              hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF9E9E9E),
              ),
              border: InputBorder.none),
        ),
      ),
    );
  }

  Widget _buildButtonContinue() {
    return Container(
      width: double.infinity,
      height: 58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color(0xFF11B1A5),
      ),
      child: const Center(
        child: Text(
          "Continue",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
