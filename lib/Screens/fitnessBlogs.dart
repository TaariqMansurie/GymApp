import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FitnessBlogs extends StatefulWidget {
  const FitnessBlogs({Key key}) : super(key: key);

  @override
  _FitnessBlogsState createState() => _FitnessBlogsState();
}

class _FitnessBlogsState extends State<FitnessBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Blogs'),
        backgroundColor: Colors.deepPurple[600],
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Keep yourself updated with the latest',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
          Center(
            child: Text('fitness knowledge',
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
          ),
            SizedBox(height: 30,),
            Center(
              child: Text
                ('Today\'s Featured Blog',
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.normal
                  ),
                ),
              ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.deepPurple[50],
                border: Border.all(color: Colors.deepPurple[400])
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical : 5.0,horizontal :5.0),
              child: SingleChildScrollView(
                child: Column(
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
