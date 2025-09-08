import 'package:flutter/material.dart';

class CreateNewPin extends StatefulWidget {
  const CreateNewPin({super.key});

  @override
  State<CreateNewPin> createState() => _CreateNewPinState();
}

class _CreateNewPinState extends State<CreateNewPin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New PIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 115, 24, 24),
        child: Column(
          children: [

            Container(
              width: double.infinity,
              height: 191,

              child: const SizedBox(
                height: 50,
                child: Text('Add a PIN number to make your account more secure',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF212121),
                ),),
              ),
            )
          ],
        ),
      ),

    );
  }
}
