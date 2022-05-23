import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RuleElement extends StatefulWidget {
  final String writings;
  RuleElement({@required this.writings});

  @override
  _RuleElementState createState() => _RuleElementState();
}

class _RuleElementState extends State<RuleElement> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10,top: 10),
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .72,
              child: Text(widget.writings,
                  style: GoogleFonts.ptSans(
                      fontSize: 14,height: 1,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}
