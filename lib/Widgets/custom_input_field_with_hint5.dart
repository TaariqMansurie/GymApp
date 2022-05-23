import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputFieldWithHint5 extends StatelessWidget {
  final String label;
  final bool isObscurred;
  final TextEditingController controller;
  final String validation;
  var maxLines;

  CustomInputFieldWithHint5({
    @required this.label,
    @required this.isObscurred,
    @required this.controller,
    this.maxLines = 1,
    @required this.validation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 42,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.rubik(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(),
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
              hintText: 'in kgs',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.deepPurple[400],
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
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
