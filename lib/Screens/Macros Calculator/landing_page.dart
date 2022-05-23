import 'package:GymApp/Drawers/homeNavigationDrawer.dart';
import 'package:GymApp/Screens/Macros%20Calculator/macro_results.dart';
import 'package:GymApp/Widgets/custom_number_field2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var calories = TextEditingController() ;

  final List<String> dietTypeList = ['High Carbs (60:25:15)', 'Moderate Carbs (50:30:20)', 'Zone Diet(40:30:30)', 'Low Carbs (25:35:40)', 'Keto Diet (05:35:60)'];
  var dietType = 'High Carbs (60:25:15)';

  DropdownButton<String> dietTypeDropdown() {
    List<DropdownMenuItem<String>> codes1 = [];
    for (String diet in dietTypeList) {
      codes1.add(
        DropdownMenuItem(
          child: Text(
            diet,
            textAlign: TextAlign.center,
            style: GoogleFonts.ptSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF263238),
            ),
          ),
          value: diet,
        ),
      );
    }

    return DropdownButton<String>(
      isExpanded: true,
      dropdownColor: Colors.white,
      iconEnabledColor: Colors.black,focusColor: Color(0xffffc400),
      value: dietType,itemHeight: 50,
      items: codes1,
      onChanged: (value) {
        setState(
              () {
                dietType = value.toString();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: Text('Macro Calculator',style: TextStyle(color: Color(0xffffc400)),),
        iconTheme: IconThemeData(color: Color(0xffffc400)),
        automaticallyImplyLeading: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10,top: 50),
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)
                  ),
                ),
              child: Column(
               // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  CustomInputNumberField2(
                    label: 'Calories',
                    isObscurred: false,
                    controller: calories,
                    validation: 'Calories',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40,0,0,0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            "Diet Type" ,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "     (Below Ratio is Carbs : Protein : Fats)" ,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(fontWeight: FontWeight.w500,fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width * 0.75,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0),
                          child: dietTypeDropdown(),
                        )),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                      GestureDetector(
                        onTap: () {
                          if(calories != null) {
                              if (_formKey.currentState.validate()) {
                                Map<String, String> macroDetails = {
                                  'Calories': calories.text.toString(),
                                  'Diet Type': dietType.toString(),
                                };
                                  print(macroDetails);
                                  if(calories != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                            MacroResults(calories, dietType)
                                        )
                                    );
                                  }else {
                                    Fluttertoast.showToast(
                                        msg: 'Please Enter Your Calories',
                                        backgroundColor: Color(0xffffc400),
                                        textColor: Colors.black,
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.SNACKBAR
                                    );
                                  }
                             }
                            }
                          else{
                            Fluttertoast.showToast(
                                msg: 'Please Enter Your Calories',
                                backgroundColor: Color(0xffffc400),
                                textColor: Colors.black,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.SNACKBAR
                            );
                          }
                        },
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Color(0xffffc400)),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)
                              ),
                            ),
                            height: 50,
                            width: 100,
                            child: Center(
                              child: Text('Calculate',style: TextStyle(color: Color(0xffffc400),fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                      )
                    ],
              ),
              ),),
            ],
          ),
        ),
      ),
      drawer: HiddenDrawer(),
    );
  }
}
