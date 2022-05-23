
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'diet_category.dart';
import 'diet_food_tile2.dart';
import 'diet_item.dart';

class DietPlans2 extends StatefulWidget {
  @override
  _DietPlans2State createState() => _DietPlans2State();
}

class _DietPlans2State extends State<DietPlans2> {
  //jo bhi id hain voh sab yearly,quarterly ,etc plans ki same hi hain !
  List<Category2> data = [
    Category2(
      id: 1,
      name: 'POPULAR\n Plans',
      dietPlanList2: <DietItem2>[
        DietItem2(
            id: 11,
            name: 'Yearly Muscle Gain\nPlan',
            price: 14000,
            imagePath: 'assets/pizza-1.png',),
        DietItem2(
            id: 10,
            name: '6 Monthly Muscle Gain\nPlan',
            price: 7500,
            imagePath: 'assets/pizza-1.png',)
      ],
    ),
    Category2(
      id: 2,
      name: 'Transformation Plan',
      dietPlanList2: <DietItem2>[
        DietItem2(
            id: 4,
            name: 'Yearly Plan',
            price: 100000.00,
            imagePath: 'assets/hotdog.png'),
        DietItem2(
            id: 3,
            name: '6 Month Plan',
            price: 60000.00,
            imagePath: 'assets/hotdog.png'),
        DietItem2(
            id: 2,
            name: '3 Month Plan',
            price: 35000.00,
            imagePath: 'assets/pizza-2.png'),
      ],
    ),
    Category2(
      id: 3,
      name: 'Fat Loss ',
      dietPlanList2: <DietItem2>[
        DietItem2(
            id: 1,
            name: 'Yearly Plan',
            price: 14000.00,
            imagePath: 'assets/hamburger.png'),
        DietItem2(
          id: 9,
          name: '6 Monthly Plan',
          price: 7500.00,
          imagePath: 'assets/pizza-1.png',
        ),
        DietItem2(
            id: 8,
            name: 'Quarterly Plan',
            price: 4000.00,
            imagePath: 'assets/hamburger.png'),
        DietItem2(
            id: 7,
            name: 'Monthly Plan',
            price: 1500.00,
            imagePath: 'assets/hamburger.png'),
      ],
    ),
    Category2(
      id: 4,
      name: 'Muscle Gain ',
      dietPlanList2: <DietItem2>[
        DietItem2(
            id: 1,
            name: 'Yearly Plan',
            price: 14000.00,
            imagePath: 'assets/hamburger.png'),
        DietItem2(
          id: 9,
          name: '6 Monthly Plan',
          price: 7500.00,
          imagePath: 'assets/pizza-1.png',),
        DietItem2(
            id: 8,
            name: 'Quarterly Plan',
            price: 4000.00,
            imagePath: 'assets/hamburger.png'),
        DietItem2(
            id: 7,
            name: 'Monthly Plan',
            price: 1500.00,
            imagePath: 'assets/hamburger.png'),
      ],
      //yearly plan
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          'Diet Plans',style: TextStyle(
            color: Color(0xffffc400)
        ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color(0xffffc400)
        ),
        automaticallyImplyLeading: true,
      ),
      backgroundColor: Color(0xffffc400),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  'assets/gifs/j.png',
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child : Container(
                          height: MediaQuery.of(context).size.height * 0.55,
                          child: Column(
                          children: <Widget>[
                            _buildIntro(),
                            Expanded(
                              flex: 7,
                              child: _buildMenu(),
                            )
                          ],
                        ),
                  ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
            height: 5,
          ),
          Text(
            'Transforming Lives SINCE 2002',
            style: GoogleFonts.varelaRound(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xffffc400)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'The transformation plan consists of personal\ntraining + Diet. Contact us to know more.',
            style: GoogleFonts.varelaRound(
              fontSize: 15,
              fontWeight: FontWeight.w200,
              color: Colors.grey,
            ),
          ),
          Text(
            'Below are the pricing of diet packages',
            style: GoogleFonts.varelaRound(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
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
      indicatorColor: Color(0xffffc400),
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
      height: 200,
      child: TabBarView(
        children: List.generate(
          data.length,
              (index) {
            ///TabBarView children length = Number of categories
            ///Each category have foodList (ListView)
            return ListView.separated(scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(20),
                itemBuilder: (context, foodIndex) {
                  return FoodTile2(
                    dietItem2: data[index].dietPlanList2[foodIndex],
                  );
                },
                separatorBuilder: (context, foodIndex) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: data[index].dietPlanList2.length);
          },
        ),
      ),
    );
  }
}
