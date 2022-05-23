
import 'package:GymApp/Drawers/userNavigationDrawer.dart';
import 'package:GymApp/Widgets/list_element_with_bullet.dart';
import 'package:GymApp/shared/utility.dart';
import 'package:flutter/material.dart';


class TrainersRulesAndRegulations2 extends StatelessWidget {
  const TrainersRulesAndRegulations2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> rules = [
      "We have a policy of providing male trainers to male clients and female trainers to female clients.",
      "We will provide 12 sessions per month each of 1 hr.",
      'You must take weight and body measurements of the client at the beginning of the first session.',
      "Please be punctual.",
      'Please make sure you have a stable internet connection in order to prevent any kind of interruption during the session.',
      "Any kind of misbehaviour or foul language will be dealt with strictly.",
      "If you make any cancellations, then you have to inform the client 2hrs prior failing to which 50% of the session cost will be deducted from your payment.",
      "30 percent will be our convenience charges from your final payment. ",
      "Payments will be made after the completion of 12 sessions. ",
      "The above mentioned term may vary and can eb changed without any prior notice.",
      "If you accept any kind of payments(under the table or ) directly from the clients,your association with us will be terminated on immediate basis.",
      "Online Sessions would be on whatsapp/ google meet/ zoom",
      'For any further clarifications please call us Or mail to us at fitnessden19@gmail.com',
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: new Text("Terms & Condition",style: TextStyle(
            color: Color(0xffffc400)
        ),),
        iconTheme: IconThemeData(
            color: Color(0xffffc400)
        ),
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
                                  ('  For Trainers  ',style: TextStyle(
                                    fontSize: 40,
                                    backgroundColor: Color(0xffffc400),
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                                ),),
                              SizedBox(height: 15,),
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
                              SizedBox(height: 15,)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
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
                                color: Color(0xffffc400),
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
      ),
    );
  }
}

