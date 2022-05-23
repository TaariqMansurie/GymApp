
import 'package:GymApp/Screens/Diet/diet_food_tile3.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';

import 'diet_category.dart';
import 'diet_item.dart';

class DietPlans extends StatefulWidget {
  @override
  _DietPlansState createState() => _DietPlansState();
}

class _DietPlansState extends State<DietPlans> {
  //jo bhi id hain voh sab yearly,quarterly ,etc plans ki same hi hain !
  List<Category3> data = [
    Category3(
      id: 1,
      name: 'POPULAR\n Plans',
      dietPlanList3: <DietItem3>[
        DietItem3(
            id: 11,
            name: 'Yearly Muscle Gain\nPlan',
            imagePath: 'assets/pizza-1.png',
            lock : FontAwesomeIcons.lock),
        DietItem3(
            id: 10,
            name: '6 Monthly Muscle Gain\nPlan',
            imagePath: 'assets/pizza-1.png',
            lock : FontAwesomeIcons.lock),
      ],
    ),
    Category3(
      id: 2,
      name: 'Transformation Plan',
      dietPlanList3: <DietItem3>[
        DietItem3(
            id: 4,
            name: 'Yearly Plan',
            imagePath: 'assets/hotdog.png'),
        DietItem3(
            id: 3,
            name: '6 Month Plan',
            imagePath: 'assets/hotdog.png'),
        DietItem3(
            id: 2,
            name: 'Quarterly Plan',
            imagePath: 'assets/pizza-2.png'),
      ],
    ),
    Category3(
      id: 3,
      name: 'Fat Loss ',
      dietPlanList3: <DietItem3>[
        DietItem3(
            id: 1,
            name: 'Yearly Plan',
            imagePath: 'assets/hamburger.png'),
        DietItem3(
            id: 9,
            name: '6 Monthly Plan',
            imagePath: 'assets/pizza-1.png',
            lock : FontAwesomeIcons.lock),
        DietItem3(
            id: 8,
            name: 'Quarterly Plan',
            imagePath: 'assets/hamburger.png'),
        DietItem3(
            id: 7,
            name: 'Monthly Plan',
            imagePath: 'assets/hamburger.png'),
      ],
    ),
    Category3(
      id: 4,
      name: 'Muscle Gain ',
      dietPlanList3: <DietItem3>[
        DietItem3(
            id: 1,
            name: 'Yearly Plan',
            imagePath: 'assets/hamburger.png'),
        DietItem3(
            id: 9,
            name: '6 Monthly Plan',
            imagePath: 'assets/pizza-1.png',
            lock : FontAwesomeIcons.lock),
        DietItem3(
            id: 8,
            name: 'Quarterly Plan',
            imagePath: 'assets/hamburger.png'),
        DietItem3(
            id: 7,
            name: 'Monthly Plan',
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
      backgroundColor: Colors.deepOrangeAccent[100],
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
                  height: MediaQuery.of(context).size.height * 0.25,width: MediaQuery.of(context).size.width,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.65,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Fitnezz Den',
            style: GoogleFonts.varelaRound(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Transforming Lives SINCE 2002',
            style: GoogleFonts.varelaRound(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xffffc400)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'The transformation plan consists of personal\ntraining + Diet. Contact us to know more',
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
      child: TabBarView(
        children: List.generate(
          data.length,
              (index) {
            ///TabBarView children length = Number of categories
            ///Each category have foodList (ListView)
            return ListView.separated(
                padding: EdgeInsets.all(20),
                itemBuilder: (context, foodIndex) {
                  return FoodTile3(
                    dietItem3: data[index].dietPlanList3[foodIndex],
                  );
                },
                separatorBuilder: (context, foodIndex) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: data[index].dietPlanList3.length);
          },
        ),
      ),
    );
  }

}
