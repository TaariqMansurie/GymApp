import 'package:GymApp/Screens/home.dart';
import 'package:GymApp/Screens/userhome.dart';
import 'package:GymApp/Widgets/customBlackButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AfterTrainerFormSubmission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Image(
                      image: AssetImage(
                        'assets/Chef.gif',
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Stack(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            image:
                            AssetImage('assets/Hide.png'),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {},
                        ),
                      )
                    ],
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
                  'We\'ll reach out to you regarding your application status via mail.',
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
                        return UserHome();
                      }));
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
