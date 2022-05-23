
import 'package:GymApp/Screens/Trainings/TrainingDetailsScreen.dart';
import 'package:GymApp/shared/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

//for silver
class RazorpayPaymentPlatinumFemale extends StatefulWidget {

  var selectedPackageType = 'Transformation Package';

  var selectedPackageDuration = '1 Month';

  var name = '' ;
  var selectedPrice ;

  RazorpayPaymentPlatinumFemale(this.selectedPrice,this.selectedPackageType,this.selectedPackageDuration,this.name);

  @override
  _RazorpayPaymentPlatinumFemaleState createState() => _RazorpayPaymentPlatinumFemaleState();
}

class _RazorpayPaymentPlatinumFemaleState extends State<RazorpayPaymentPlatinumFemale> {
  Razorpay razorpay ;
  TextEditingController paymentController = new TextEditingController();
  bool session = false ;
  var id = '';

  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<User>(context).uid;
    //DocumentReference reff = Firestore.instance.collection('users').document(uid);
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
      body: StreamBuilder<DocumentSnapshot>(
          stream: Firestore.instance
              .collection('users')
              .document(uid)
              .snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              print(snapshot.hasData);
              print(snapshot.data['userName']);
              String userName = snapshot.data['userName'];
              String email = snapshot.data['userEmail'];
              String profilePicUrl = snapshot.data['profile_pic_url'];
              String gender = snapshot.data['gender'];
              print({profilePicUrl+email+userName+gender});
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Package Amount',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(15.0),
                  //   child: TextField(
                  //     keyboardType: TextInputType.number,
                  //     controller: paymentController,
                  //     decoration: InputDecoration(
                  //       hintText: 'Enter the package amount to pay',
                  //       icon: Icon(FontAwesomeIcons.moneyBill,
                  //         color: Color(0xffffc400),
                  //         size: 25,
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //               color: Color(0xffffc400)
                  //           ),
                  //           borderRadius: BorderRadius.circular(10)
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //           color: Colors.black,
                  //           width: 2.0,
                  //         ),
                  //         borderRadius: BorderRadius.circular(10.0),
                  //       ),
                  //     ),
                  //     cursorColor: Color(0xffffc400),
                  //   ),
                  // ),
                  Center(
                    child: Text(
                      'Rs ${widget.selectedPrice}',
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w500,
                          fontSize: 14
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: ElevatedButton(
                        child: Text('Pay Now', style: TextStyle(
                            color: Color(0xffffc400)
                        ),),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            fixedSize: Size(150, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () {
                          // if (paymentController != null) {
                          //   openCheckout();
                          // } else {
                          //   Fluttertoast.showToast(
                          //     msg: 'Please enter a valid amount in order to proceed further !',
                          //     toastLength: Toast.LENGTH_LONG,
                          //     gravity: ToastGravity.CENTER,
                          //     textColor: Colors.black,
                          //     backgroundColor: Color(0xffffc400),
                          //   );
                          if (widget.selectedPrice != null) {
                            openCheckout();
                          }
                          else {
                            Fluttertoast.showToast(
                              msg: 'Please check you amount!',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              textColor: Colors.black,
                              backgroundColor: Color(0xffffc400),
                            );
                          }
                        }
                    ),
                  ),
                ],
              );
            }else{
              return Container();
            }
          }
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);

  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    //last mein otp bhi aayega number pe
    var optionMap = {
      // "key" : "rzp_test_lT3U3vNX9OEwHd", //generate test keys razorpay ke app(website se) se
      "key" : "rzp_live_bq0fJ45FTt9PUT",
      "amount" : num.parse(widget.selectedPrice) * 100,
      "name" : "Fitnezz Den",
      "description" : "Payment for packages",
      "receipt" : '',
      "order_id" : "",
      "timeout": '150',
      "currency" : "INR",
      "id": "",
      "prefill" : {
        //fireabase se hum name aur number le sakte hain unka yahape
        "User's Name": "",
        "Client'\s Name" : "",
        "contact" : "",
        "email" : "",
      },
      "external" : {
        "wallets" : ["paytm"]
      }
    };
    try{
      razorpay.open(optionMap);
    }catch(e){
      print(e.toString());
    }
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response) {
    String uid = Provider.of<User>(context,listen: false).uid;
    // var id = HelperFunctions.sharedPreferenceUserIDKey ;
    DocumentReference reff = Firestore.instance.collection('users').document(uid);
    print('payment Successful');
    print('User ID is $uid');
    Fluttertoast.showToast(msg: 'payment successful',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      textColor: Color(0xffffc400),
      backgroundColor: Colors.black,
    );
    setState(() {
      session = true ;
    });
    reff.setData({
      'payment_successful' : 'true',
      'payment_date' : DateTime.now(),
      'package_type': widget.selectedPackageType,
      'package_duration' : widget.selectedPackageDuration,
      'Trainer\'s Name' : widget.name,
      'payment_amount' : widget.selectedPrice.text.toString(),
    },merge: true);

    Navigator.push(
      context, MaterialPageRoute(builder : (context) => TrainingDetailsScreen()),
    );
    print('Response is $response') ;
  }


  void handlerErrorFailure(PaymentFailureResponse response){
    print('payment error failure');
    Fluttertoast.showToast(msg: 'payment error failure',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      textColor: Color(0xffffc400),
      backgroundColor: Colors.black,
    );
  }

  void handlerExternalWallet(ExternalWalletResponse response) {
    print('payment via external wallet');
    Fluttertoast.showToast(msg: 'payment via external wallet',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      textColor: Colors.black,
      backgroundColor: Colors.deepPurple[400],
    );
  }
}
