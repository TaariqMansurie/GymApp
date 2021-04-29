import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopMealTile extends StatelessWidget {
  final Color color;
  final String title;
  final String assetPath;
  final String details;

  const TopMealTile (
      {Key key, this.color, this.title, this.assetPath, this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      height: 200,
      width: 150,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  this.assetPath,
                  height: 80,
                  width: 80,
                ),
                Text(
                  this.title,
                  style: GoogleFonts.varelaRound(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  this.details,
                  style: GoogleFonts.varelaRound(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black38),
                ),
              ],
            ),
          ),

          // Positioned(
          //   right: 0,
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: Colors.white24,
          //         borderRadius:
          //         BorderRadius.only(bottomLeft: Radius.circular(20))),
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: <Widget>[
          //         Padding(
          //           padding:
          //           const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //           child: Icon(Icons.add),
          //         ),
          //         Padding(
          //           padding:
          //           const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //           child: Icon(Icons.remove),
          //         )
          //       ],
          //     ),
          //   ),
          // ),

          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          //     child: Icon(
          //       Icons.favorite_border,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}