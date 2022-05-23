import 'package:GymApp/Authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopPlanTile extends StatefulWidget {
  final Color color;
  final String title;
  final String assetPath;
  final String details;

  const TopPlanTile(
      {Key key, this.color, this.title, this.assetPath, this.details})
      : super(key: key);

  @override
  _TopPlanTileState createState() => _TopPlanTileState();
}

class _TopPlanTileState extends State<TopPlanTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _alertDialog() ;
        },
      child: Container(
        decoration: BoxDecoration(
          color: this.widget.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        height: 80,
        width: 120,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    this.widget.assetPath,
                    height: 80,
                    width: 80,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    this.widget.title,
                    style: GoogleFonts.varelaRound(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    this.widget.details,
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
      ),
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