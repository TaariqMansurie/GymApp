import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordInputField extends StatefulWidget {
//  final String label;
  final IconData icon ;
  final TextEditingController controller;
  PasswordInputField({ @required this.icon, @required this.controller});

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        0,0,0,0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   widget.label,
          //   style: GoogleFonts.rubik(
          //     fontWeight: FontWeight.w500,
          //     fontSize: 14,
          //   ),
          // ),
          TextFormField(

            validator: (val) {
              if (val.isEmpty) {
                return 'PASSWORD cannot be empty';
              }
              return null;
            },
            controller: widget.controller,
            obscureText: isObscured,
            cursorColor: Color(0xffff5a5f),
            style: GoogleFonts.ptSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            onChanged: (inputEmail) {},
            decoration: InputDecoration(
              hintText: 'Enter your Password',
              suffix: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscured = !isObscured;
                  });
                },
                child: Image(
                  height: 18,
                  width: 18,
                  image: AssetImage('assets/Hide.png'),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red[900],
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5.0),gapPadding: 50.0
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffff5a5f),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 20,
              ),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          // SizedBox(
          //   height: 24,
          // ),
        ],
      ),
    );
    ;
  }
}

class PasswordInputField2 extends StatefulWidget {
  final IconData icon ;
  final TextEditingController controller;
  PasswordInputField2({ @required this.icon, @required this.controller});

  @override
  _PasswordInputField2State createState() => _PasswordInputField2State();
}

class _PasswordInputField2State extends State<PasswordInputField2> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          0,0,0,0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   widget.label,
          //   style: GoogleFonts.rubik(
          //     fontWeight: FontWeight.w500,
          //     fontSize: 14,
          //   ),
          // ),
          TextFormField(

            validator: (val) {
              if (val.isEmpty) {
                return 'PASSWORD cannot be empty';
              }
              return null;
            },
            controller: widget.controller,
            obscureText: isObscured,
            cursorColor: Color(0xffff5a5f),
            style: GoogleFonts.ptSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            onChanged: (inputEmail) {},
            decoration: InputDecoration(
              hintText: 'Enter your Password To Confirm',
              suffix: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscured = !isObscured;
                  });
                },
                child: Image(
                  height: 18,
                  width: 18,
                  image: AssetImage('assets/Hide.png'),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red[900],
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),gapPadding: 50.0
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffff5a5f),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 20,
              ),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          // SizedBox(
          //   height: 24,
          // ),
        ],
      ),
    );
    ;
  }
}

