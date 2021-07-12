import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputField extends StatelessWidget {
 // final String label;
  final bool isObscurred;
  final TextEditingController controller;
  final String validation;
  var maxLines;

  CustomInputField({
   // @required this.label,
    @required this.isObscurred,
    @required this.controller,
    this.maxLines = 1,
    @required this.validation,
  });

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
          //   label,
          //   style: GoogleFonts.rubik(
          //     fontWeight: FontWeight.w500,
          //     fontSize: 14,
          //   ),
          // ),
          // SizedBox(
          //   height: 12,
          // ),
          TextFormField(
            validator: (String value) {
              if (value.isEmpty) {
                return '${validation.toUpperCase()} cannot be empty';
              }
              return null;
            },
            maxLines: maxLines,
            controller: controller,
            obscureText: isObscurred,
            style: GoogleFonts.ptSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            onChanged: (inputEmail) {},
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red[900],
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0),gapPadding: 50.0
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
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
