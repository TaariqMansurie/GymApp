import 'package:GymApp/Authentication/login.dart';
import 'package:GymApp/Widgets/top_plan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Diet4 extends StatefulWidget {
  @override
  _Diet4State createState() => _Diet4State();
}

class _Diet4State extends State<Diet4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          'Diet',style: TextStyle(
            color: Color(0xffffc400)
        ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color(0xffffc400)
        ),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,0,0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Transform Into A Better Version\nOf Yourself !" ,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                buildTopProducts(),
               // buildTopMeals(),
               // Center(child: Image.asset('assets/meditation_bg.png')),
                // RaisedButton(
                //   onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => DietPlans(),));},
                //   child: Text(
                //     'Get Started',
                //     style: GoogleFonts.varelaRound(
                //       color: Colors.white,
                //       fontWeight: FontWeight.w600,
                //       fontSize: 18,
                //     ),
                //   ),
                // ),
              ],
            )
        ),
      ),
    );
  }

  Widget buildTopProducts() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Top Plans',
                  style: GoogleFonts.varelaRound(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: ExploreAllButton(
                    onTap: () {
                      // Navigator.push(
                      //   context, MaterialPageRoute(builder : (context) => DietPlans()),
                      // );
                      _alertDialog();
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildTopPlanList(),
        ],
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

  Widget buildTopPlanList() {
    List topProductList = [
      TopPlanTile(
        assetPath: 'assets/gifs/health.png',
        color: Color(0xffDFECF8),
        details: '\₹?',
        title: 'Yearly Plan',
      ),
      TopPlanTile(
        assetPath: 'assets/gifs/health2.png',
        color: Color(0xffF4DEF8),
        details: '\₹?',
        title: '6 - Month Plan',
      ),
      TopPlanTile(
        color: Color(0xffFFF2C5),
        assetPath: 'assets/summer.png',
        title: 'Monthly Plan',
        details: '\₹?',
      ),
      TopPlanTile(
        color: Color(0xffDFECF8),
        assetPath: 'assets/vegetable.png',
        title: 'Quarterly Plan',
        details: '\₹?',
      ),
    ];

    return Column(
      children: <Widget>[
        Container(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => topProductList[index],
            separatorBuilder: (context, index) => SizedBox(width: 20),
            itemCount: topProductList.length,
          ),
        )
      ],
    );
  }

  // Widget buildTopMeals() {
  //   return Padding(
  //     padding: const EdgeInsets.all(20),
  //     child: Column(
  //       children: <Widget>[
  //         Container(
  //           width: MediaQuery
  //               .of(context)
  //               .size
  //               .width,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: <Widget>[
  //               Text(
  //                 'Top Packages',
  //                 style: GoogleFonts.varelaRound(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(right: 5),
  //                 child: ExploreAllButton(
  //                   onTap: () {
  //                     // Navigator.push(
  //                     //   context, MaterialPageRoute(builder : (context) => DietPlans()),
  //                     // );
  //                     _alertDialog();
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         buildTopPackageList()
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget buildTopPackageList() {
  //   List topProductList = [
  //     TopPackageTile(
  //       assetPath: 'assets/vegetable.png',
  //       color: Color(0xffDFECF8),
  //       details: '\₹?',
  //       title: 'Transformation Package',
  //     ),
  //     TopPackageTile(
  //       color: Color(0xffF4DEF8),
  //       assetPath: 'assets/summer.png',
  //       title: 'Fat Loss Package',
  //       details: '\₹?',
  //     ),
  //     TopPackageTile(
  //       color: Color(0xffFFF2C5),
  //       assetPath: 'assets/apple.png',
  //       title: 'Muscle Gain Package',
  //       details: '\₹?',
  //     ),
  //   ];
  //
  //   return Column(
  //     children: <Widget>[
  //       Container(
  //         height: 200,
  //         child: ListView.separated(
  //           scrollDirection: Axis.horizontal,
  //           itemBuilder: (context, index) => topProductList[index],
  //           separatorBuilder: (context, index) => SizedBox(width: 20),
  //           itemCount: topProductList.length,
  //         ),
  //       )
  //     ],
  //   );
  // }
}
class ExploreAllButton extends StatelessWidget {
  final Function onTap;
  const ExploreAllButton({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
        child: Text(
          'Explore All',
          style: GoogleFonts.varelaRound(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xffffc400)),
        ),
      ),
    );
  }
}

