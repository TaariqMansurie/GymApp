import 'package:GymApp/Screens/Trainers/afterClientMeasurementForm.dart';
import 'package:GymApp/Services/database.dart';
import 'package:GymApp/Widgets/custom_input_field_with_hint4.dart';
import 'package:GymApp/Widgets/custom_input_field_with_hint5.dart';
import 'package:GymApp/shared/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class ClientBodyMeasurements extends StatefulWidget {
  const ClientBodyMeasurements({Key key}) : super(key: key);

  @override
  _ClientBodyMeasurementsState createState() => _ClientBodyMeasurementsState();
}

class _ClientBodyMeasurementsState extends State<ClientBodyMeasurements> {

  final GlobalKey<FormState> _formKeyy = GlobalKey<FormState>();
  DatabaseMethods db = DatabaseMethods();

  var height = TextEditingController();
  var weight = TextEditingController();
  var neck = TextEditingController();
  var chest = TextEditingController();
  var arms = TextEditingController();
  var forearms = TextEditingController();
  var waist = TextEditingController();
  var thighs = TextEditingController();
  var calves = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<User>(context).uid;
    CollectionReference ref = Firestore.instance
        .collection('users')
        .document(uid)
        .collection('body_measurements');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Color(0xffffc400)),
        automaticallyImplyLeading: true,
      ),
      body: Form(
        key: _formKeyy,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 125,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image(
                                image: AssetImage('assets/Hide.png'),
                                height: 20,
                                width: 20,
                              ),
                            ],
                          ),
                          Text(
                            'Body & Weight',
                            style: GoogleFonts.rubik(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF263238),
                            ),
                          ),
                          Text(
                            'Measurements',
                            style: GoogleFonts.rubik(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF263238),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/gifs/z.png'),
                      height: 141,
                      width: 126,
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    border: Border.all(color: Colors.black)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        CustomInputFieldWithHint4(
                          label: 'Height',
                          isObscurred: false,
                          controller: height,
                          validation: 'height',
                        ),
                        CustomInputFieldWithHint5(
                          label: 'Weight',
                          isObscurred: false,
                          controller: weight,
                          validation: 'weight',
                        ),
                        CustomInputFieldWithHint4(
                          label: 'Neck',
                          isObscurred: false,
                          controller: neck,
                          validation: 'neck',
                        ),

                        CustomInputFieldWithHint4(
                          label: 'Chest',
                          isObscurred: false,
                          controller: chest,
                          validation: 'chest',
                        ),

                        CustomInputFieldWithHint4(
                          label: 'Arms',
                          isObscurred: false,
                          controller: arms,
                          validation: 'arms',
                        ),

                        CustomInputFieldWithHint4(
                          label: 'Forearms',
                          isObscurred: false,
                          controller: forearms,
                          validation: 'forearms',
                        ),

                        CustomInputFieldWithHint4(
                          label: 'Waist',
                          isObscurred: false,
                          controller: waist,
                          validation: 'waist',
                        ),

                        CustomInputFieldWithHint4(
                          label: 'Thighs',
                          isObscurred: false,
                          controller: thighs,
                          validation: 'Thighs',
                        ),

                        CustomInputFieldWithHint4(
                          label: 'Calves',
                          isObscurred: false,
                          controller: calves,
                          validation: 'Calves',
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 42.0,
                            vertical: 10,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (_formKeyy.currentState.validate()) {
                                Map<String, String> personalBodyDetails = {
                                  'Height': height.text.toString(),
                                  'Weight': weight.text.toString(),
                                  'Neck': neck.text.toString(),
                                  'Chest': chest.text.toString(),
                                  'Arms': arms.text.toString(),
                                  'Forearms': forearms.text.toString(),
                                  'Waist': waist.text.toString(),
                                  'Thighs': thighs.text.toString(),
                                  'Calves': calves.text.toString(),
                                };
                                ref.add({
                                  'Height': '${height.text.toString()} cms',
                                  'Weight': '${weight.text.toString()} kgs',
                                  'Neck': '${neck.text.toString()} cms',
                                  'Chest': '${chest.text.toString()} cms',
                                  'Arms': '${arms.text.toString()} cms',
                                  'Forearms': '${forearms.text.toString()} cms',
                                  'Waist': '${waist.text.toString()} cms',
                                  'Thighs': '${thighs.text.toString()} cms',
                                  'Calves': '${calves.text.toString()} cms',
                                }).whenComplete(() => Fluttertoast.showToast(
                                    msg: 'Form Submitted Successfully ',
                                    backgroundColor: Color(0xffffc400),
                                    textColor: Colors.black,
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.SNACKBAR
                                ));
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                      return AfterClientMeasurementForm();
                                      }
                                    )
                                );
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Submit',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffffc400),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //Center(child: Image.asset('assets/meditation_bg.png')),
            ],
          ),
        ),
      ),
    );
  }
}
