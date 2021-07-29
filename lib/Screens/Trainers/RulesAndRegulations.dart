import 'package:GymApp/Drawers/adminNavigationDrawer.dart';
import 'package:GymApp/Screens/Trainers/trainersForm.dart';
import 'package:GymApp/Widgets/list_element_with_bullet.dart';
import 'package:GymApp/shared/utility.dart';
import 'package:flutter/material.dart';


class TrainersRulesAndRegulations extends StatelessWidget {
  const TrainersRulesAndRegulations({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> rules = [
      "Your clients will be having the same gender as yours.",
      "There will be 12 sessions per month each of 1 hr.",
      'You must take weight and body measurements of the client at the beginning of the first session.',
      "You should be very punctual.",
      'You should be having a good device and a stable internet connection inorder to prevent any kind of interruption dusring the session.',
      "There should be no complaints from the clients regarding misbehaviour,foul language, etc.",
      "Prompt replies should be given to the clients.",
      "If there is any cancellation from your side, then you have to inform the client 2hrs prior failing to which 50% of the session cost will be deducted from your payment.",
      "We will be charging 10% of your entire payment for the first few months",
      "The above mentioned term may vary and can eb changed without any prior notice.",
      "If you accept any kind of payments(under the table or ) directly from the clients,your association with us will be terminated on immediate basis.",
      "Online Sessions would be on whatsapp/meet",
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple[500],
        title: new Text(" Rules"),
        automaticallyImplyLeading: true,
        //
      ),
      drawer: UserNavigationDrawer(),
      body: Container(
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
                        Positioned(
                          right: 0,
                          child: Image.asset(
                            "assets/Hide.png",
                            height: 20,
                          ),
                        ),
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
                    "assets/Chef.gif",
                    width: 103,
                    height: 108,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurple[50],
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20))),
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
                                  ('  For Trainers  ',style: TextStyle(
                                    fontSize: 40,
                                    backgroundColor: Colors.deepPurple[100],
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                                ),),
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
                              SizedBox(height: 15,)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => TrainerForm()));
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
                                color: Colors.white,
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
      ),
    );
  }
}

