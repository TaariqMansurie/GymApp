import 'package:GymApp/Drawers/homeNavigationDrawer.dart';
import 'package:GymApp/shared/utility.dart';
import 'package:flutter/material.dart';

import 'Widgets/list_element_with_bullet.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
          backgroundColor: Colors.deepPurple[500],
          automaticallyImplyLeading: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text('About Us Page'),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              child: RaisedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ClientsRulesAndRegulation()));
                },
                color: Colors.deepPurple[50],
                textColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                //padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: Center(
                  child: Text('Terms & Condition',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: HiddenDrawer(),
      );
  }
}

class ClientsRulesAndRegulation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Condition'),
        backgroundColor: Colors.deepPurple[500],
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
        body: Container(
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
                                                  child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Center(
                                                        child:Text
                                                          ('  For Clients  ',style: TextStyle(
                                                            fontSize: 40,
                                                            backgroundColor: Colors.deepPurple[100],
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.w900
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
                                       ),
                                     );
  }
}
