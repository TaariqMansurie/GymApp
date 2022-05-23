import 'package:GymApp/Drawers/userNavigationDrawer.dart';
import 'package:GymApp/Screens/Trainers/trainersList2.dart';
import 'package:GymApp/Widgets/list_element_with_bullet.dart';
import 'package:GymApp/shared/users.dart';
import 'package:GymApp/shared/utility.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'femaleTrainersList2.dart';

class ClientsRulesAndRegulationn2 extends StatelessWidget {
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
      body: ClientRuless(),
      drawer: UserNavigationDrawer(),
    );
  }

}

class ClientRuless extends StatelessWidget{
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
                                                .copyWith(fontWeight: FontWeight.w900,backgroundColor: Color(0xffffc400)),
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