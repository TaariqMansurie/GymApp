import 'package:GymApp/Drawers/userNavigationDrawer.dart';
import 'package:GymApp/Screens/Trainers/femaleTrainersList2.dart';
import 'package:GymApp/Screens/Trainers/trainersList2.dart';
import 'package:GymApp/Widgets/list_element_with_bullet.dart';
import 'package:GymApp/shared/users.dart';
import 'package:GymApp/shared/utility.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ClientRulesAndRegulations extends StatelessWidget {
  DocumentSnapshot data;

  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<User>(context).uid;

    List<String> clientRules = [
      "We have a policy of providing male trainers to male clients and female trainers to female clients. ",
      "Payments once made will be non-refundable.",
      'If you have any complaints about your training, or your trainer please feel free to connect with us on chat Or mail us on fitnessden19@gmail.com',
      "You should be very punctual.",
      'Training will be strictly for one hour. ',
      'Please make sure you have a stable internet connection in order to prevent any kind of interruption during the session.',
      "Training will be only online as of now. ",
      "Online Sessions would be on whatsapp/meet. ",
      "If offline training is needed then any other charges(gym charges + travelling charges) will be born by the client and subject to availability of time.",
      "We provide 12 sessions per month which should be completed in 1 month's time. ",
      "Each session will be of 1 hour duration. ",
      "On Purchasing any of our package, 6 free sessions will be given at Life Changerz Versova, For more queries kindly contact our team. ",
      "Free Sessions would only be given to subject to availability of the slots. ",
      "Please avoid making any kind of payments(under the table or ) directly to the trainers failing which your association with us will be terminated on immediate basis.",
      "Any session cancellations has to be informed 2 hrs prior, failing to which the session would be charged. ",
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: new Text(" Rules",style: TextStyle(
            color: Color(0xffffc400)
        ),),
        automaticallyImplyLeading: true,
        //
        iconTheme: IconThemeData(
            color: Color(0xffffc400)
        ),
      ),
      drawer: UserNavigationDrawer(),
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('users')
            .document(uid)
            .snapshots(),
    builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    if (snapshot.hasData) {
    print(snapshot.hasData);
    print(snapshot.data['userName']);
    // String userName = snapshot.data['userName'];
    // String email = snapshot.data['userEmail'];
   // String profilePicUrl = snapshot.data['profile_pic_url'];
    String gender = snapshot.data['gender'];
    // String paymentDone = snapshot.data['payment_successful'];
    // String packageDuration = snapshot.data['package_duration'];
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        // color: Colors.blue,
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
                        width: 103,
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
                              // color: Colors.cyan,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Center(
                                    child:Text
                                      ('  For Clients  ',style: TextStyle(
                                        fontSize: 40,
                                        backgroundColor: Color(0xffffc400),
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                    ),),
                                  SizedBox(height: 15,),
                                  RuleElement(writings: clientRules[0]),
                                  RuleElement(writings: clientRules[1]),
                                  RuleElement(writings: clientRules[2]),
                                  RuleElement(writings: clientRules[3]),
                                  RuleElement(writings: clientRules[4]),
                                  RuleElement(writings: clientRules[5]),
                                  RuleElement(writings: clientRules[6]),
                                  RuleElement(writings: clientRules[7]),
                                  RuleElement(writings: clientRules[8]),
                                  RuleElement(writings: clientRules[9]),
                                  RuleElement(writings: clientRules[10]),
                                  RuleElement(writings: clientRules[11]),
                                  RuleElement(writings: clientRules[12]),
                                  RuleElement(writings: clientRules[13]),
                                  RuleElement(writings: clientRules[14]),
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
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => TrainersList2()))
                                    :Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => FemaleTrainersList2()));
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
                                  'Continue',
                                  style: TextStyle(
                                    color: Color(0xffffc400),
                                    fontSize: 15,
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
          );
        }else {
      return Container(height: 0,width: 0,);
      }
    }
      ),
    );
  }
}

