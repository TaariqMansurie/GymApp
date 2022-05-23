import 'package:GymApp/Screens/Payment/razorpay_payment3.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class DietDetails extends StatefulWidget {

  @override
  _DietDetailsState createState() => _DietDetailsState();
}

class _DietDetailsState extends State<DietDetails> {

  final GlobalKey<FormState> _formKeyy = GlobalKey<FormState>();

  var selectedDietPlan = 'Fatloss Plan';
  var selectedPackageDuration = 'Select your package duration';
  var priceselected ;

  final List<String> packageTypeList = ['Fatloss Plan', 'Muscle Gain Plan'];
  final List<String> packageDurationList = ['Select your package duration','1 Month', '3 Months', '6 Months','Yearly'];

  // var selectedPrice = '1500' ;
  // final List<String> packagePriceList = ['1500','4000','7500','14000'];
  // DropdownButton<String> packagePriceDropdown() {
  //   List<DropdownMenuItem<String>> codes = [];
  //   for (String packagePrice in packagePriceList) {
  //     codes.add(
  //       DropdownMenuItem(
  //         child: Text(
  //           packagePrice,
  //           textAlign: TextAlign.center,
  //           style: GoogleFonts.ptSans(
  //             fontWeight: FontWeight.w400,
  //             fontSize: 16,
  //             color: Color(0xFF263238),
  //           ),
  //         ),
  //         value: packagePrice,
  //       ),
  //     );
  //   }
  //
  //   return DropdownButton<String>(
  //     isExpanded: true,
  //     dropdownColor: Colors.white,
  //     iconEnabledColor: Color(0xFF263238),
  //     value: selectedPrice,
  //     items: codes,
  //     onChanged: (value) {
  //       setState(
  //             () {
  //           selectedPrice = value.toString();
  //         },
  //       );
  //     },
  //   );
  // }

  DropdownButton<String> packageTypeDropdown() {
    List<DropdownMenuItem<String>> codes = [];
    for (String packageType in packageTypeList) {
      codes.add(
        DropdownMenuItem(
          child: Text(
            packageType,
            textAlign: TextAlign.center,
            style: GoogleFonts.ptSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF263238),
            ),
          ),
          value: packageType,
        ),
      );
    }

    return DropdownButton<String>(
      isExpanded: true,
      dropdownColor: Colors.white,
      iconEnabledColor: Color(0xFF263238),
      value: selectedDietPlan,
      items: codes,
      onChanged: (value) {
        setState(
              () {
                selectedDietPlan = value.toString();
          },
        );
      },
    );
  }

  DropdownButton<String> packageDurationDropdown() {
    List<DropdownMenuItem<String>> codes = [];
    for (String packageDuration in packageDurationList) {
      codes.add(
        DropdownMenuItem(
          child: Text(
            packageDuration,
            textAlign: TextAlign.center,
            style: GoogleFonts.ptSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF263238),
            ),
          ),
          value: packageDuration,
        ),
      );
    }

    return DropdownButton<String>(
      isExpanded: true,
      dropdownColor: Colors.white,
      iconEnabledColor: Color(0xFF263238),
      value: selectedPackageDuration,
      items: codes,
      onChanged: (value) {
        setState(
              () {
            selectedPackageDuration = value.toString();
          },
        );
        IfElse();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diet Package Details',style: TextStyle(
            color: Color(0xffFFc400)
        ),),
        automaticallyImplyLeading: true,
        elevation: 2,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color(0xffFFc400)
        ),
      ),
      body: Form(
        key: _formKeyy,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:10.0,right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 42,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //package type
                              Text(
                                'Package Type',
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width * 0.72,
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
                                    child: packageTypeDropdown(),
                                  )),
                              SizedBox(height: 24,),

                              //package duration
                              Text(
                                'Package Duration',
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 12,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
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
                                            horizontal: 8.0),
                                        child: packageDurationDropdown(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                              SizedBox(height: 24,),

                              //package amount
                              Text(
                                'Package Amount',
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 12,),
                              Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    // border: Border.all(
                                    //   color: Colors.black,
                                    //   width: 2,
                                    // ),
                                    // borderRadius: BorderRadius.all(
                                    //   Radius.circular(8),
                                    // ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Container(
                                        child:  priceselected == null ?  Text('please select the package duration'):Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(priceselected,style: TextStyle(fontSize: 15),))),
                                  )),
                              SizedBox(
                                height: 24,
                              ),
                            ],
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 42.0,
                            vertical: 10,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (_formKeyy.currentState.validate()) {
                                Map<String, String> dietlDetail = {
                                  'Package Amount': priceselected.toString(),
                                  'Package Type': selectedDietPlan.toString(),
                                  'Package Duration': selectedPackageDuration
                                      .toString(),
                                  //   'Trainer\'s Name' : widget.name.toString(),
                                };
                                print(dietlDetail);
                                // if(selectedPrice == '1500' && selectedPackageDuration == '1 Month')
                                //   {
                                // Navigator.push((context),
                                //     MaterialPageRoute(builder: (context){
                                //       return RazorpayPayment3(
                                //           selectedPrice,selectedDietPlan,selectedPackageDuration
                                //       );
                                //     }));
                                // }else if (selectedPrice == '4000' && selectedPackageDuration == '3 Months')
                                // {
                                //   Navigator.push((context),
                                //       MaterialPageRoute(builder: (context){
                                //         return RazorpayPayment3(
                                //             selectedPrice,selectedDietPlan,selectedPackageDuration
                                //         );
                                //       }));
                                // }
                                // else if (selectedPrice == '7500' && (selectedPackageDuration == '6 Months'))
                                // {
                                //   Navigator.push((context),
                                //       MaterialPageRoute(builder: (context){
                                //         return RazorpayPayment3(
                                //             selectedPrice,selectedDietPlan,selectedPackageDuration
                                //         );
                                //       }));
                                // }
                                // else if (selectedPrice == '14000' && selectedPackageDuration == 'Yearly')
                                // {
                                //   Navigator.push((context),
                                //       MaterialPageRoute(builder: (context){
                                //         return RazorpayPayment3(
                                //             selectedPrice,selectedDietPlan,selectedPackageDuration
                                //         );
                                //       }));
                                // }
                                // else {
                                //   Fluttertoast.showToast(
                                //     msg: 'Please check you amount and package duration!',
                                //     toastLength: Toast.LENGTH_LONG,
                                //     gravity: ToastGravity.CENTER,
                                //     textColor: Colors.black,
                                //     backgroundColor: Color(0xffffc400),
                                //   );
                                // }
                                if (selectedPackageDuration =='Select your package duration') {
                                    Fluttertoast.showToast(
                                      msg: 'Please check your package duration!',
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      textColor: Colors.black,
                                      backgroundColor: Color(0xffffc400),
                                    );
                                  }
                                else {
                                  Navigator.push((context),
                                      MaterialPageRoute(builder: (context) {
                                        return RazorpayPayment3(
                                            priceselected, selectedDietPlan,
                                            selectedPackageDuration
                                        );
                                      }));
                                }
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFF263238),
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
                                'Next',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
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
            ],
          ),
        ),
      ) ,
    );
  }
  IfElse(){
    if(selectedPackageDuration == '1 Month'){
      setState(() {
        priceselected = '1800' ;
      });
    }
    else if(selectedPackageDuration == '3 Months'){
      setState(() {
        priceselected = '4300' ;
      });
    }
    else if(selectedPackageDuration == '6 Months'){
      setState(() {
        priceselected = '7800' ;
      });
    }
    else if(selectedPackageDuration == 'Yearly'){
      setState(() {
        priceselected = '14300' ;
      });
    }
  }
}
