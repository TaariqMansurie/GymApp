import 'package:GymApp/Drawers/homeNavigationDrawer.dart';
import 'package:GymApp/Screens/Trainers/femaleTrainersList2.dart';
import 'package:GymApp/Screens/Trainers/trainersList2.dart';
import 'package:GymApp/Screens/Trainings/list_of_trainings3.dart';
import 'package:GymApp/Screens/Transformations/transformation5.dart';
import 'package:GymApp/Screens/articles.dart';
import 'package:GymApp/Screens/testimonials.dart';
import 'package:GymApp/shared/users.dart';
import 'package:GymApp/shared/utility.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Widgets/list_element_with_bullet.dart';

class AboutUs2 extends StatefulWidget {
  @override
  _AboutUs2State createState() => _AboutUs2State();
}

class _AboutUs2State extends State<AboutUs2> {

  ScrollController _controller ;
  ScrollController _controller2 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          'About Us',style: TextStyle(
            color: Color(0xffffc400)
        ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color(0xffffc400)
        ),
        automaticallyImplyLeading: true,
      ),
      body: Scrollbar(
        controller: _controller,
        interactive: true,
        thickness: 7,
        showTrackOnHover: true,
        isAlwaysShown: true,
        radius: Radius.circular(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0,left: 15.0),
                    child: Container(
                      width: 80,
                      height: 80,
                      child: Image.asset('assets/icons/logooo.png'),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30,0,0,0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Fitnezz Den" ,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontWeight: FontWeight.bold,fontSize: 25),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,10,0,0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "If you have the will,\nwe have the way.." ,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(fontWeight: FontWeight.w900,color: Color(0xffffc400),fontSize: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                child: Scrollbar(
                  controller: _controller2,
                  interactive: true,
                  thickness: 7,
                  showTrackOnHover: true,
                  isAlwaysShown: true,
                  radius: Radius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        children:[
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20,left: 10),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text('Who is Asif Shaikh ?',style: TextStyle(
                                        fontWeight: FontWeight.w900))),
                              ),
                              InkWell(
                                onTap:  () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SuperTransformation5()));
                                },
                                child: Card(
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 10),
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/videos/18.png"),
                                        fit: BoxFit.fill,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5,left: 5),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(' The founder of this company, \n & Also a certified Personal Trainer and a\n Nutritionist since 2002')),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20,left: 5),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(' Achievements',style: TextStyle(
                                    fontWeight: FontWeight.w900))),
                          ),
                          //articles
                          Padding(
                            padding: const EdgeInsets.only(top: 20,left: 5),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('1) Newspaper/ Media Articles',style: TextStyle(
                                    fontWeight: FontWeight.w700))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              color: Colors.grey[300],
                              width: 350,
                              //width: MediaQuery.of(context).size.width * 0.45,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Card(
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Articles()));
                                        },
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("assets/articles/1.png"),
                                              fit: BoxFit.fill,
                                              alignment: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Articles()));
                                        },
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("assets/articles/2.png"),
                                              fit: BoxFit.fill,
                                              alignment: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Articles()));
                                        },
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("assets/articles/3.png"),
                                              fit: BoxFit.fill,
                                              alignment: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Articles()));
                                        },
                                        child: Container(
                                          color: Colors.grey,
                                          height: 80,
                                          width: 75,
                                          child: Center(
                                            child: Text(
                                              '+13',style: TextStyle(
                                                fontWeight: FontWeight.bold
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

                          //client testimonials
                          Padding(
                            padding: const EdgeInsets.only(top: 20,left: 5),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('2) Client Testimonials',style: TextStyle(
                                    fontWeight: FontWeight.w700))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              color: Colors.grey[300],
                              width: 350,
                              //width: MediaQuery.of(context).size.width * 0.45,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Card(
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ClientTestimonials()));
                                        },
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("assets/videos/1.png"),
                                              fit: BoxFit.fill,
                                              alignment: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ClientTestimonials()));
                                        },
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("assets/videos/2.png"),
                                              fit: BoxFit.fill,
                                              alignment: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ClientTestimonials()));
                                        },
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("assets/videos/3.png"),
                                              fit: BoxFit.fill,
                                              alignment: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ClientTestimonials()));
                                        },
                                        child: Container(
                                          color: Colors.grey,
                                          height: 80,
                                          width: 75,
                                          child: Center(
                                            child: Text(
                                              '+11',style: TextStyle(
                                                fontWeight: FontWeight.bold
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

                          //training services
                          Padding(
                            padding: const EdgeInsets.only(top: 20,left: 5),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Training Services',style: TextStyle(
                                    fontWeight: FontWeight.w900))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text('We are providing various services to our clients, such as\nYoga, Kickboxing/MMA, Diet & Transformation packages,\n'
                                'Personal Training to MALE/Female, Online Training, etc.  '),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary:  Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    elevation: 5
                                ),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Trainings3()));
                                },
                                //padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                                child: Center(
                                  child: Text('Training Services',
                                    style: TextStyle(
                                        color: Color(0xffffc400)
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 20,left: 5),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Celebrity Clients',style: TextStyle(
                                    fontWeight: FontWeight.w900))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text('Has also trained many celebrity trainers such as:- \nSajid Nadiadwala(Producer/Director),\nMona Singh, Tisca Chopra, Sajid Khan, Mini Mathur, Karan Oberoi, Sherrin Varghese, Amita Nangia, Amaan Ali Khan, Ayaan Ali Khan, Gaurav Nanda, Bharat Kaul, Indraneel Bhattacharya, Sachin Khot,Liza Malik, Aarti Sharma, Pragati Mehra, Jig Joshi, Harsh Singh, Wasim Khan, Sheena shahabadi. '),
                          ),
                          SizedBox(height: 50,)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}


class ClientsRulesAndRegulation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          'Terms & Condition',style: TextStyle(
            color: Color(0xffffc400)
        ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color(0xffffc400)
        ),
        automaticallyImplyLeading: true,
      ),
      body: ClientRules(),
      drawer: HiddenDrawer(),
    );
  }

}

class ClientRules extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  String uid = Provider.of<User>(context).uid;
  List<String> rules = [
      "We provide male trainers to male clients & female trainers to female clients only.",
      "Payments once made will be non-refundable.",
      'If facing any issue with the trainer or at any given point of time you feel the need to change the trainer we will transfer the sessions to another trainer.',
      "You should be very punctual.",
      'You should be having a good device and a stable internet connection inorder to prevent any kind of interruption during the session.',
      "Training will be only online as of now. ",
      "Online Sessions would be on whatsapp/meet. ",
      "If offline training is needed then any other charges(gym charges + travelling charges) will be born by the client and subject to availability of time.",
      "There will be 12 sessions per month. ",
      "These 12 sessions has to be completed in 1 month time. ",
      "Each session will be of 1 hour duration. ",
      "On Purchasing any of our package, 6 free sessions will be given at Life Changerz Versova, For more queries kindly contact our team. ",
      "Free Sessions would only be given to subject to availability of the slots. ",
      "If you complete any kind of payments(under the table or ) directly to the trainers,your association with us will be terminated on immediate basis. ",
      "If you have to cancel any session or anything, you have to inform the trainer 2 hrs prior, failing to which the session would be charged. ",
    ];
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
      .collection('users')
      .document(uid)
      .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    if (snapshot.hasData) {
    String gender = snapshot.data['gender'];
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 80,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Rules and \nRegulations",
                                style: Utility()
                                    .customColorHeadingTextStyle(Colors.black, 24),
                              ),
                            )
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/gifs/e.png",
                        width: 133,
                        height: 108,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                        border: Border.all(color: Colors.black)
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10,0,0,10),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "For Clients" ,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                  RuleElement(writings: rules[0]),
                                  RuleElement(writings: rules[1]),
                                  RuleElement(writings: rules[2]),
                                  RuleElement(writings: rules[3]),
                                  RuleElement(writings: rules[4]),
                                  RuleElement(writings: rules[5]),
                                  RuleElement(writings: rules[6]),
                                  RuleElement(writings: rules[7]),
                                  RuleElement(writings: rules[8]),
                                  RuleElement(writings: rules[9]),
                                  RuleElement(writings: rules[10]),
                                  RuleElement(writings: rules[11]),
                                  RuleElement(writings: rules[12]),
                                  RuleElement(writings: rules[13]),
                                  RuleElement(writings: rules[14]),
                                  SizedBox(height: 15,)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: GestureDetector(
                              onTap: () {
                                gender == 'MALE' ?
                                Navigator.push(
                                    context, MaterialPageRoute(builder : (context) => TrainersList2())
                                ):Navigator.push(
                                    context, MaterialPageRoute(builder : (context) => FemaleTrainersList2())
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      10,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
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
              ],
            ),
          ); } else {
      return Container(height: 0,width: 0,);
    }
        }
      ),
    );
  }
}
