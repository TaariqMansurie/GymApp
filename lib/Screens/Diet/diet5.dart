import 'package:GymApp/Screens/Diet/dietDetails.dart';
import 'package:GymApp/Widgets/top_plan2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Diet5 extends StatefulWidget {
  @override
  _Diet5State createState() => _Diet5State();
}

class _Diet5State extends State<Diet5> {
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
                  padding: const EdgeInsets.fromLTRB(10,0,0,0),
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
                      Navigator.push(
                        context, MaterialPageRoute(builder : (context) => DietDetails()),
                      );
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

  Widget buildTopPlanList() {
    List topProductList = [
      TopPlanTile2(
        assetPath: 'assets/gifs/health.png',
        color: Color(0xffDFECF8),
        details: '\₹14300.00',
        title: 'Yearly Plan',
      ),
      TopPlanTile2(
        assetPath: 'assets/gifs/health2.png',
        color: Color(0xffF4DEF8),
        details: '\₹7800.00',
        title: '6 - Month Plan',
      ),
      TopPlanTile2(
        color: Color(0xffDFECF8),
        assetPath: 'assets/vegetable.png',
        title: 'Quarterly Plan',
        details: '\₹4300.00',
      ),
      TopPlanTile2(
        color: Color(0xffFFF2C5),
        assetPath: 'assets/summer.png',
        title: 'Monthly Plan',
        details: '\₹1800.00',
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
  //                     Navigator.push(
  //                       context, MaterialPageRoute(builder : (context) => DietPlans2()),
  //                     );
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
  //     TopPackageTile2(
  //       assetPath: 'assets/vegetable.png',
  //       color: Color(0xffDFECF8),
  //       details: '\₹60000.00',
  //       title: 'Transformation Package',
  //     ),
  //     TopPackageTile2(
  //       color: Color(0xffF4DEF8),
  //       assetPath: 'assets/summer.png',
  //       title: 'Fat Loss Package',
  //       details: '\₹14000.00',
  //     ),
  //     TopPackageTile2(
  //       color: Color(0xffFFF2C5),
  //       assetPath: 'assets/apple.png',
  //       title: 'Muscle Gain Package',
  //       details: '\₹7500.00',
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

