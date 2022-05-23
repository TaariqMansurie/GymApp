import 'package:GymApp/Screens/Diet/dietDetails.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'diet_item.dart';

class FoodTile2 extends StatelessWidget {
  final DietItem2 dietItem2 ;

  const FoodTile2({Key key, this.dietItem2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // overflow: Overflow.visible,
      children: <Widget>[
        InkWell(
          onTap: (){
            Navigator.push(
              context, MaterialPageRoute(builder : (context) => DietDetails()),
              );
            },
          child: Card(
            elevation: 10,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            shadowColor: const Color(0xffF7CBAB),
            child: Container(
              height: 160,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    dietItem2.name,
                    style: GoogleFonts.varelaRound(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '\₹${dietItem2.price}',
                    style: GoogleFonts.varelaRound(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: ColorConstants.primaryColor,
                      //  color: Colors.deepPurple
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: -10,
          top: -30,
          child: Image.asset(
            dietItem2.imagePath,
            height: 120,
            width: 120,
          ),
        ),
      ],
    );
  }
}