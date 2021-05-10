
import 'package:GymApp/Widgets/top_meals.dart';
import 'package:GymApp/Widgets/top_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'diet_plans.dart';

class Diet extends StatefulWidget {
  @override
  _DietState createState() => _DietState();
}

class _DietState extends State<Diet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diet'),
        backgroundColor: Colors.deepPurple[500],
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
              children: <Widget>[
                Center(child: Text(
                  "Transform Into A Better Version Of Yourself ! ",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.w900),textAlign: TextAlign.start,
                ),),
                buildTopProducts(),
                buildTopMeals(),
                Center(child: Image.asset('assets/meditation_bg.png')),
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
                  'Top Packages',
                  style: GoogleFonts.varelaRound(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                _ExploreAllButton(
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder : (context) => DietPlans()),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildTopProductsList(),

        ],
      ),
    );
  }

  Widget buildTopProductsList() {
    List topProductList = [
      TopProductTile(
        assetPath: 'assets/apple.png',
        color: Color(0xffDFECF8),
        details: '\$50.00',
        title: 'Yearly Plan',
      ),
      TopProductTile(
        color: Color(0xffF4DEF8),
        assetPath: 'assets/summer.png',
        title: 'Monthly Plan',
        details: '\$18.00',
      ),
      TopProductTile(
        color: Color(0xffFFF2C5),
        assetPath: 'assets/vegetable.png',
        title: 'Quaterly Plan',
        details: '\$30.00',
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

  Widget buildTopMeals() {
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
                  'Top Meals',
                  style: GoogleFonts.varelaRound(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                _ExploreAllButton(
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder : (context) => DietPlans()),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
           buildTopMealsList()
        ],
      ),
    );
  }

  Widget buildTopMealsList() {
    List topProductList = [
      TopMealTile(
        assetPath: 'assets/vegetable.png',
        color: Color(0xffDFECF8),
        details: '\$12.99',
        title: 'Keto Meal',
      ),
      TopMealTile(
        color: Color(0xffF4DEF8),
        assetPath: 'assets/summer.png',
        title: 'High Protein Meal',
        details: '\$12.99',
      ),
      TopMealTile(
        color: Color(0xffFFF2C5),
        assetPath: 'assets/apple.png',
        title: 'Vegan Meal',
        details: '\$13.50',
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
}
class _ExploreAllButton extends StatelessWidget {
  final Function onTap;
  const _ExploreAllButton({
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
          color: Color(0xffE0E6EE),
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
              color: Colors.grey[700]),
        ),
      ),
    );
  }
}

