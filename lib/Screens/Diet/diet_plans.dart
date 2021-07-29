
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';

import 'diet_category.dart';
import 'diet_food_tile.dart';
import 'diet_item.dart';

class DietPlans extends StatefulWidget {
  @override
  _DietPlansState createState() => _DietPlansState();
}

class _DietPlansState extends State<DietPlans> {
  //jo bhi id hain voh sab yearly,quarterly ,etc plans ki same hi hain !
  List<Category> data = [
    Category(
      id: 1,
      name: 'POPULAR\n Plans',
      dietPlanList: <DietItem>[
        DietItem(
            id: 11,
            name: 'Yearly Muscle Gain\nPlan',
            price: 50,
            imagePath: 'assets/pizza-1.png',
            lock : FontAwesomeIcons.lock),
        DietItem(
            id: 10,
            name: '6 Monthly Muscle Gain\nPlan',
            price: 50,
            imagePath: 'assets/pizza-1.png',
            lock : FontAwesomeIcons.lock),
      //   DietItem(
      //       id: 2,
      //       name: 'Greek Shaurama',
      //       price: 6.99,
      //       imagePath: 'assets/images/hotdog.png'),
      //
      ],
    ),
    Category(
      id: 2,
      name: 'Transformation Plan',
      dietPlanList: <DietItem>[
        DietItem(
            id: 2,
            name: '3 Month Plan',
            price: 12.99,
            imagePath: 'assets/pizza-2.png'),
        DietItem(
            id: 3,
            name: '6 Month Plan',
            price: 12.99,
            imagePath: 'assets/hotdog.png'),
        DietItem(
            id: 4,
            name: 'Yearly Plan',
            price: 13.50,
            imagePath: 'assets/hotdog.png'),
        // DietItem(
        //     id: 5,
        //     name: 'Mexican Meal',
        //     price: 12.99,
        //     imagePath: 'assets/hotdog.png'),
        // DietItem(
        //     id: 6,
        //     name: 'Low Carbs Meal',
        //     price: 12.99,
        //     imagePath: 'assets/hamburger.png'),
      ],
    ),
    Category(
      id: 3,
      name: 'Fat Loss ',
      dietPlanList: <DietItem>[
        DietItem(
            id: 7,
            name: 'Monthly Plan',
            price: 15.00,
            imagePath: 'assets/hamburger.png'),
        DietItem(
            id: 8,
            name: 'Quarterly Plan',
            price: 35.00,
            imagePath: 'assets/hamburger.png'),
        DietItem(
            id: 9,
            name: '6 Monthly Plan',
            price: 50,
            imagePath: 'assets/pizza-1.png',
            lock : FontAwesomeIcons.lock),
        DietItem(
            id: 1,
            name: 'Yearly Plan',
            price: 50.00,
            imagePath: 'assets/hamburger.png'),
      ],
    ),
    Category(
      id: 4,
      name: 'Muscle Gain ',
      dietPlanList: <DietItem>[
        DietItem(
            id: 7,
            name: 'Monthly Plan',
            price: 15.00,
            imagePath: 'assets/hamburger.png'),
        DietItem(
            id: 8,
            name: 'Quarterly Plan',
            price: 35.00,
            imagePath: 'assets/hamburger.png'),
        DietItem(
            id: 9,
            name: '6 Monthly Plan',
            price: 50,
            imagePath: 'assets/pizza-1.png',
            lock : FontAwesomeIcons.lock),
        DietItem(
            id: 1,
            name: 'Yearly Plan',
            price: 50.00,
            imagePath: 'assets/hamburger.png'),
        ],
        //yearly plan
      ),
    // Category(
    //   id: 4,
    //   name: 'PIZZAS',
    //   foodList: <FoodItem>[
    //     FoodItem(
    //         id: 9,
    //         name: 'Margherita',
    //         price: 15.99,
    //         imagePath: 'assets/images/pizza-1.png'),
    //     FoodItem(
    //         id: 10,
    //         name: 'Double Cheese Margherita',
    //         price: 18.99,
    //         imagePath: 'assets/images/pizza-2.png'),
    //     FoodItem(
    //         id: 11,
    //         name: 'Pepper',
    //         price: 16.99,
    //         imagePath: 'assets/images/pizza-1.png'),
    //     FoodItem(
    //         id: 12,
    //         name: 'Zesty Chicken',
    //         price: 22.99,
    //         imagePath: 'assets/images/pizza-2.png'),
    //   ],
    // ),

  ];

  // List<Category> data = [
  //   Category(
  //     id: 1,
  //     name: 'POPULAR',
  //     dietPlanList: <Diet>[
  //       Diet(
  //           id: 1,
  //           name: 'Chicago Hot Dog',
  //           price: 5.99,
  //           imagePath: 'assets/images/hamburger.png'),
  //       Diet(
  //           id: 2,
  //           name: 'Greek Shaurama',
  //           price: 6.99,
  //           imagePath: 'assets/images/hotdog.png'),
  //     ],
  //   ),
  //   Category(
  //     id: 2,
  //     name: 'MEAL DEALS',
  //     dietPlanList: <Diet>[
  //       Diet(
  //           id: 3,
  //           name: 'Fix Meal',
  //           price: 10.99,
  //           imagePath: 'assets/images/hamburger.png'),
  //       Diet(
  //           id: 4,
  //           name: 'Maxican Meal',
  //           price: 12.99,
  //           imagePath: 'assets/images/hamburger.png'),
  //     ],
  //   ),
  //   Category(
  //     id: 3,
  //     name: 'HOT DOGS',
  //     dietPlanList: <Diet>[
  //       Diet(
  //           id: 1,
  //           name: 'Chicago Hot Dog',
  //           price: 5.99,
  //           imagePath: 'assets/images/hamburger.png'),
  //       Diet(
  //           id: 5,
  //           name: 'Hot Dog',
  //           price: 4.99,
  //           imagePath: 'assets/images/hamburger.png'),
  //     ],
  //   ),
  //   Category(
  //     id: 4,
  //     name: 'BURGERS',
  //     dietPlanList: <Diet>[
  //       Diet(
  //           id: 6,
  //           name: 'Burger',
  //           price: 5.99,
  //           imagePath: 'assets/images/hamburger.png'),
  //       Diet(
  //           id: 7,
  //           name: 'Bacon Clubhouse Burger',
  //           price: 7.99,
  //           imagePath: 'assets/images/hamburger.png'),
  //       Diet(
  //           id: 8,
  //           name: 'Hamburger',
  //           price: 9.99,
  //           imagePath: 'assets/images/hamburger.png'),
  //     ],
  //   ),
  //   Category(
  //     id: 4,
  //     name: 'PIZZAS',
  //     dietPlanList: <Diet>[
  //       Diet(
  //           id: 9,
  //           name: 'Margherita',
  //           price: 15.99,
  //           imagePath: 'assets/images/pizza-1.png'),
  //       Diet(
  //           id: 10,
  //           name: 'Double Cheese Margherita',
  //           price: 18.99,
  //           imagePath: 'assets/images/pizza-2.png'),
  //       Diet(
  //           id: 11,
  //           name: 'Pepper',
  //           price: 16.99,
  //           imagePath: 'assets/images/pizza-1.png'),
  //       Diet(
  //           id: 12,
  //           name: 'Zesty Chicken',
  //           price: 22.99,
  //           imagePath: 'assets/images/pizza-2.png'),
  //     ],
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
            'Diet Plans'
        ),
        backgroundColor: Colors.deepPurple[500] ,
        automaticallyImplyLeading: true,
        // leading: IconButton(
        //   icon: Icon(FontAwesomeIcons.arrowCircleLeft),
        //   onPressed: () {
        //     Navigator.pop(context) ;
        //   },
        //   color: Colors.black,
        //   tooltip: 'Back',
        // ),
      ),
      backgroundColor: Colors.deepOrange[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              'assets/Chef.gif',
              height: 250,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple[50],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    _buildIntro(),
                    Expanded(
                      child: _buildMenu(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntro() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Fitnezz Den',
            style: GoogleFonts.varelaRound(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Transforming Lives SINCE 2002',
            style: GoogleFonts.varelaRound(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Life Changerz is located at Versova in Mumbai . There is a certain joy driving down to Versova and seeing that iconic Life Changerz place with the fork and lights.',
            style: GoogleFonts.varelaRound(
              fontSize: 15,
              fontWeight: FontWeight.w200,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return Container(
      child: DefaultTabController(
        length: data.length,
        child: Column(
          children: <Widget>[
            _buildTabBar(),
            Expanded(
              child: _buildTabBarView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      labelColor: Colors.black,
      isScrollable: true,
      indicatorColor: Colors.deepPurple,
      unselectedLabelColor: Colors.grey,
      labelStyle: GoogleFonts.varelaRound(fontWeight: FontWeight.w600),
      tabs: List.generate(
        data.length,
            (index) => Tab(
          text: data[index].name,
        ),
      ),
    );
  }

  _buildTabBarView() {
    return Container(
      child: TabBarView(
        children: List.generate(
          data.length,
              (index) {
            ///TabBarView children length = Number of categories
            ///Each category have foodList (ListView)
            return ListView.separated(
                padding: EdgeInsets.all(20),
                itemBuilder: (context, foodIndex) {
                  return FoodTile(
                    dietItem: data[index].dietPlanList[foodIndex],
                  );
                },
                separatorBuilder: (context, foodIndex) {
                  return SizedBox(
                    height: 20,
                  );
                },
                itemCount: data[index].dietPlanList.length);
          },
        ),
      ),
    );
  }
}
