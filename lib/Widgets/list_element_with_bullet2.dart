import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RuleElement2 extends StatefulWidget {
  final String writings;
  RuleElement2({@required this.writings});

  @override
  _RuleElement2State createState() => _RuleElement2State();
}

class _RuleElement2State extends State<RuleElement2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10, bottom:10, right: 10,left: 25),
      child: Align(
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
      ),
    );
  }
}
