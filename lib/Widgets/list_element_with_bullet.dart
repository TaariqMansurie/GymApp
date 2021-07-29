import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RuleElement extends StatefulWidget {
  final String writings;
  RuleElement({@required this.writings});
  // const RuleElement({Key? key}) : super(key: key);

  @override
  _RuleElementState createState() => _RuleElementState();
}

class _RuleElementState extends State<RuleElement> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        child: Container(
          // color: Colors.blue,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .72,
                child: Text(widget.writings,
                    style: GoogleFonts.ptSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffFF5A5F))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
