import 'package:GymApp/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';

import 'diet_item.dart';

class FoodTile extends StatelessWidget {
  final DietItem dietItem;

  const FoodTile({Key key, this.dietItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Card(
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
                  dietItem.name,
                  style: GoogleFonts.varelaRound(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '\$${dietItem.price}',
                  style: GoogleFonts.varelaRound(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: ColorConstants.primaryColor,
                  //  color: Colors.deepPurple
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Icon(FontAwesomeIcons.lock)
              ],
            ),
          ),
        ),
        Positioned(
          right: -10,
          top: -30,
          child: Image.asset(
            dietItem.imagePath,
            height: 120,
            width: 120,
          ),
        ),
      ],
    );
  }
}