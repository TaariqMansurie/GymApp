import 'package:GymApp/Screens/admin_home.dart';
import 'package:GymApp/Widgets/customBlackButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AfterTrainerFormSubmission2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Form Submitted',style: TextStyle(
              color: Color(0xffFFc400)
          ),),
          automaticallyImplyLeading: false,
          elevation: 2,
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
              color: Color(0xffFFc400)
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Image(
                      image: AssetImage(
                        'assets/gifs/g.png',
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Text(
                'Your input is recorded successfully !!',
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xFFFF5A5F),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Your solution has been uploaded successfully.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF263238),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'We\'ll reach out to you regarding your application status via whatsapp.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF263238),
                  ),
                ),
              ),
              CustomBlackButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                        return AdminHome();
                      }));
                //  Navigator.pop(context);
                },
                label: 'Continue',
              )
            ],
          ),
        ),
      ),
    );
  }
}
