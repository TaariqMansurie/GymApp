import 'package:GymApp/Screens/Payment/razorpay_payment_gold.dart';
import 'package:GymApp/Screens/Payment/razorpay_payment_silver.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

//for gold male
class PackageDetails3 extends StatefulWidget {
  var name = '' ;
  var price1 ;
  var price2 ;
  var price3 ;
  PackageDetails3(this.name,this.price1,this.price2,this.price3);

  @override
  _PackageDetails3State createState() => _PackageDetails3State();
}

class _PackageDetails3State extends State<PackageDetails3> {

  final GlobalKey<FormState> _formKeyy = GlobalKey<FormState>();


  var selectedPackageType = 'Transformation Package';
  var selectedPackageDuration = 'Select your package duration';

  final List<String> packageTypeList = ['Transformation Package', 'Fatloss Package', 'Muscle Gain Package'];
  final List<String> packageDurationList = ['Select your package duration','1 Month', '3 Months', '6 Months'];

  var selectedPrice ;
  final List<String> packagePricing = ['8300','22300','42300'];

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
      value: selectedPackageType,
      items: codes,
      onChanged: (value) {
        setState(
              () {
            selectedPackageType = value.toString();
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

  // DropdownButton<String> packagePriceDropdown() {
  //   List<DropdownMenuItem<String>> codes = [];
  //   for (String packagePricing in packagePricing) {
  //     codes.add(
  //       DropdownMenuItem(
  //         child: Text(
  //           packagePricing,
  //           textAlign: TextAlign.center,
  //           style: GoogleFonts.ptSans(
  //             fontWeight: FontWeight.w400,
  //             fontSize: 16,
  //             color: Color(0xFF263238),
  //           ),
  //         ),
  //         value: packagePricing,
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
  //               selectedPrice = value.toString();
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Package Details',style: TextStyle(
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
              Container(
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
                                width: MediaQuery.of(context).size.width * 0.735,
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

                            SizedBox(
                              height: 24,
                            ),

                            //package duration
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Package Duration',
                                    style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
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
                                      child:  selectedPrice == null ?  Text('please select the package duration'):Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(selectedPrice,style: TextStyle(fontSize: 15),))),
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
                              Map<String, String> packagelDetail = {
                                'Package Amount': selectedPrice.toString(),
                                'Package Type': selectedPackageType.toString(),
                                'Package Duration' : selectedPackageDuration.toString(),
                                'Trainer\'s Name' : widget.name.toString(),
                              };
                              print(packagelDetail);
                              if(selectedPrice == '8300' && selectedPackageDuration == '1 Month')
                              {
                                Navigator.push((context),
                                    MaterialPageRoute(builder: (context){
                                      return RazorpayPaymentGold(
                                          selectedPrice,selectedPackageType,selectedPackageDuration,widget.name
                                      );
                                    }));
                              }else if (selectedPrice == '22300' && selectedPackageDuration == '3 Months')
                              {
                                Navigator.push((context),
                                    MaterialPageRoute(builder: (context){
                                      return RazorpayPaymentGold(
                                          selectedPrice,selectedPackageType,selectedPackageDuration,widget.name
                                      );
                                    }));
                              }
                              else if (selectedPrice == '42300' && (selectedPackageDuration == '6 Months'))
                              {
                                Navigator.push((context),
                                    MaterialPageRoute(builder: (context){
                                      return RazorpayPaymentGold(
                                          selectedPrice,selectedPackageType,selectedPackageDuration,widget.name
                                      );
                                    }));
                              }
                              else {
                                Fluttertoast.showToast(
                                  msg: 'Please check you amount and package duration!',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  textColor: Colors.black,
                                  backgroundColor: Color(0xffffc400),
                                );
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
              //     Center(child: Image.asset('assets/meditation_bg.png')),
            ],
          ),
        ),
      ) ,
    );
  }
  IfElse(){
    if(selectedPackageDuration == '1 Month'){
      setState(() {
        selectedPrice = '8300' ;
      });
    }
    else if(selectedPackageDuration == '3 Months'){
      setState(() {
        selectedPrice = '22300' ;
      });
    }
    else if(selectedPackageDuration == '6 Months'){
      setState(() {
        selectedPrice = '42300' ;
      });
    }
  }
}
