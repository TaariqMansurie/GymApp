import 'package:GymApp/Authentication/login.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';

import 'diet_item.dart';

class FoodTile3 extends StatefulWidget {
  final DietItem3 dietItem3;

  const FoodTile3({Key key, this.dietItem3}) : super(key: key);

  @override
  _FoodTile3State createState() => _FoodTile3State();
}

class _FoodTile3State extends State<FoodTile3> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // overflow: Overflow.visible,
      children: <Widget>[
        InkWell(
          onTap: (){
            _alertDialog() ;
          },
          child: Card(
            elevation: 10,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            shadowColor: const Color(0xffF7CBAB),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.dietItem3.name,
                    style: GoogleFonts.varelaRound(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Icon(FontAwesomeIcons.lock)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: -10,
          top: -30,
          child: Image.asset(
            widget.dietItem3.imagePath,
            height: 120,
            width: 120,
          ),
        ),
      ],
    );
  }

  void _alertDialog() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 30,
            title: Text("To know more"),
            titleTextStyle: TextStyle(
                fontSize: 25,
                backgroundColor: Colors.white,
                color: Colors.black
            ),
            content: Text(
                "Kindly login to your account !"),
            buttonPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            actions: <Widget>[
              TextButton(
                child: Text("No",style: TextStyle(color: Colors.black),),style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffffc400)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  textStyle: MaterialStateProperty.all(TextStyle(
                      color: Colors.black
                  ))
              ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text("Yes",style: TextStyle(color: Colors.black),),style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffffc400)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  textStyle: MaterialStateProperty.all(TextStyle(
                      color: Colors.black
                  ))
              ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserSignIn()));
                },
              ),
            ],
          );
        }
    );
  }
}