
import 'package:GymApp/Widgets/list_element_with_bullet.dart';
import 'package:GymApp/Widgets/list_element_with_bullet2.dart';
import 'package:GymApp/shared/utility.dart';
import 'package:flutter/material.dart';

class TermsAndCondtions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<String> trainerRules = [
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
      "Online Sessions would be on whatsapp/meet",
      'For any further clarifications please call us Or mail to us at fitnessden19@gmail.com',
    ];

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
      body: Column(
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Center(
                        child:Text
                          ('  For Trainers  ',style: TextStyle(
                            fontSize: 40,
                            backgroundColor: Color(0xffffc400),
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                        ),),
                    ),
                    SizedBox(height: 15,),
                    RuleElement2(writings: trainerRules[0]),
                    RuleElement2(writings: trainerRules[1]),
                    RuleElement2(writings: trainerRules[2]),
                    RuleElement2(writings: trainerRules[3]),
                    RuleElement2(writings: trainerRules[4]),
                    RuleElement2(writings: trainerRules[5]),
                    RuleElement2(writings: trainerRules[6]),
                    RuleElement2(writings: trainerRules[7]),
                    RuleElement2(writings: trainerRules[8]),
                    RuleElement2(writings: trainerRules[9]),
                    RuleElement2(writings: trainerRules[10]),
                    RuleElement2(writings: trainerRules[11]),
                    RuleElement2(writings: trainerRules[12]),
                    SizedBox(height: 15,),
                    Center(
                      child:Text
                        ('  For Clients ',style: TextStyle(
                          fontSize: 40,
                          backgroundColor: Color(0xffffc400),
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                      ),),
                    SizedBox(height: 15,),
                    RuleElement2(writings: clientRules[0]),
                    RuleElement2(writings: clientRules[1]),
                    RuleElement2(writings: clientRules[2]),
                    RuleElement2(writings: clientRules[3]),
                    RuleElement2(writings: clientRules[4]),
                    RuleElement2(writings: clientRules[5]),
                    RuleElement2(writings: clientRules[6]),
                    RuleElement2(writings: clientRules[7]),
                    RuleElement2(writings: clientRules[8]),
                    RuleElement2(writings: clientRules[9]),
                    RuleElement2(writings: clientRules[10]),
                    RuleElement2(writings: clientRules[11]),
                    RuleElement2(writings: clientRules[12]),
                    RuleElement2(writings: clientRules[13]),
                    RuleElement2(writings: clientRules[14]),
                    SizedBox(height: 15,),
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
    );
  }
}
