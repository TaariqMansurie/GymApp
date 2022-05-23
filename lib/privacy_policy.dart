import 'package:GymApp/Drawers/userNavigationDrawer.dart';

import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          'Privacy Policy',style: TextStyle(
            color: Color(0xffffc400)
        ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color(0xffffc400)
        ),
        automaticallyImplyLeading: true,
      ),
      drawer: UserNavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffffc400),
                  shape: BoxShape.circle
              ),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Privacy Policy" ,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5,10,0,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "1. Collection of your Information " ,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Text('We value the trust you place in us and recognize the importance of secured transactions and information privacy.'),

                    SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "2. Use of your profile" ,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Text('We assure you that  you personal information provided to us will not be shared to any other third party.'),

                    SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "3. Sharing Personal Information " ,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Text('Our platform may provide links to other sites or application that may collect personal information about you. We are not responsible'
                      'For privacy practices Or the content of those linked websites. '),

                    SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "4. Other sites" ,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Text('We assure that your personal data provided to us will not be shared with any other party. '),

                    SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "5. Collection of your Information " ,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Text('By visiting our platform Or by providing your information,  you consent to the collection use , storage, disclosure, and otherwise processing of information on the platform in accordance with the privacy policy. If you disclose to us any personal information relating to other people, you represent that you have the authority to do so and to permit us to use to use the information in accordance with this privacy policy'),

                    SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "6. Queries " ,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Text('If you have a query, issue, concern, or complaint in relation to collection or usage of your personal information under this privacy policy, please contact us using the contact us section'),

                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
