import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayPayment extends StatefulWidget {
  const RazorpayPayment({Key key}) : super(key: key);

  @override
  _RazorpayPaymentState createState() => _RazorpayPaymentState();
}

class _RazorpayPaymentState extends State<RazorpayPayment> {
  Razorpay razorpay ;
  TextEditingController paymentController = new TextEditingController();

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
      "key" : "rzp_test_lT3U3vNX9OEwHd", //generate test keys razorpay ke app(website se) se
      "amount" : num.parse(paymentController.text)*100,
      "name" : "Fitnezz Den",
      "description" : "Payment for packages",
      "order_id" : "",
      "currency" : "INR",
      "id": "",
      "prefill" : {
        //fireabase se hum name aur number le sakte hain unka yahape
        "client'\s name" : "",
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

  void handlerPaymentSuccess() {
    print('payment Successful');
    Fluttertoast.showToast(msg: 'payment successful',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      textColor: Colors.black,
      backgroundColor: Colors.deepPurple[400],
    );
  }


  void handlerErrorFailure() {
    print('payment error failure');
    Fluttertoast.showToast(msg: 'payment error failure',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      textColor: Colors.black,
      backgroundColor: Colors.deepPurple[400],
    );
  }


  void handlerExternalWallet() {
    print('payment via external wallet');
    Fluttertoast.showToast(msg: 'payment via external wallet',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      textColor: Colors.black,
      backgroundColor: Colors.deepPurple[400],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payments'),
        backgroundColor: Colors.deepPurple[400],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: paymentController,
              decoration: InputDecoration(
                hintText: 'Enter the package amount to pay',
                icon: Icon(FontAwesomeIcons.moneyBill,
                           color: Colors.deepPurple[100],
                           size: 25,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple[400]
                  ),
                    borderRadius: BorderRadius.circular(10)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple[800],
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              cursorColor: Colors.deepPurple[400],
            ),
          ),
          SizedBox(height: 20,),
          RaisedButton(
            child: Text('Pay Now',style: TextStyle(
              color: Colors.white
            ),),
            color: Colors.deepPurple[400],
            onPressed: (){
              if(paymentController != null){
              openCheckout();
                }else{
              Fluttertoast.showToast(msg: 'Please enter a valid amount in order to proceed further !',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  textColor: Colors.black,
                  backgroundColor: Colors.deepPurple[400],
                );
              }
            }
          ),
        ],
      ),
    );
  }
}
