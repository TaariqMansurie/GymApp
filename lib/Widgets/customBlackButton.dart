import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBlackButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  CustomBlackButton({@required this.onPressed, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 42.0,
        vertical: 34,
      ),
      child: GestureDetector(
        onTap: () => onPressed(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFF263238),
            border: Border.all(
              color: Color(0xFF263238),
              width: 3,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                8,
              ),
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
