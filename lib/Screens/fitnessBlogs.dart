import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FitnessBlogs extends StatefulWidget {
  const FitnessBlogs({Key key}) : super(key: key);

  @override
  _FitnessBlogsState createState() => _FitnessBlogsState();
}

class _FitnessBlogsState extends State<FitnessBlogs> {
  ScrollController _controller ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Blogs',style: TextStyle(
          color: Color(0xffffc400)
        ),),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Color(0xffffc400)
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
                  .collection('blogs')
                  .document('mqLhM5i0uPwBDOSaMtkf')
                  .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    String title = snapshot.data['Title'];
                    String firstPara = snapshot.data['First Para'];
                    String secondPara = snapshot.data['Second Para'];
                    String thirdPara = snapshot.data['Third Para'];
                    String fourthPara = snapshot.data['Fourth Para'];
                    String firstPic = snapshot.data['First Picture'];
                    String secondPic = snapshot.data['Second Picture'];
                    print(fourthPara);
          return Container(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: Text('Keep yourself updated with the latest fitness knowledge',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Center(
                  child: Text
                    ('This week\'s Featured Blog is',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.only(left:10.0,right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight:Radius.circular(30),
                            // topRight: Radius.circular(30),
                        ),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)
                    ),
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical : 5.0,horizontal :5.0),
                    child: Scrollbar(
                      controller: _controller,
                      interactive: true,
                      thickness: 5,
                      showTrackOnHover: true,
                      isAlwaysShown: true,
                      radius: Radius.circular(20),
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: <Widget>[
                            Text(title,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(fontWeight: FontWeight.w900),
                            ),
                            SizedBox(height: 10,),
                            Text(firstPara,
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18
                              ),
                            ),
                            SizedBox(height: 10,),

                            Container(
                              height: 150,
                              width: 200,
                              color: Colors.white,
                              child: Image.network(firstPic),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              secondPara,
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18
                              ),),
                            SizedBox(height: 10,),

                            Container(
                              height: 150,
                              width: 200,
                              color: Colors.white,
                              child: Image.network(secondPic),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              thirdPara,
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18
                              ),),
                            SizedBox(height: 10,),
                            Text(
                              fourthPara,
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18
                              ),),
                            SizedBox(height: 30,),
                          //  Center(child: Image.asset('assets/meditation_bg.png')),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
                  }else {
                    return Container();
                  }
        }
      ),
    );
  }
}
