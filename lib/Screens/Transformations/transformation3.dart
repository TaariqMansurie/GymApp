import 'package:GymApp/Screens/Packages/packageDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//trainer's profile approve karne ke liye screen
class SuperTransformation3 extends StatefulWidget {
  var nameOG ;
  var achievementOG ;
  var certificationOG ;
  var specializationOG ;
  var expOG ;
  var profilepicOG ;
  var docOG ;
  SuperTransformation3(this.nameOG,this.achievementOG,this.certificationOG,this.specializationOG,this.expOG,this.profilepicOG,this.docOG);

  @override
  _SuperTransformation3State createState() => _SuperTransformation3State();
}

class _SuperTransformation3State extends State<SuperTransformation3> {

  CollectionReference ref = Firestore.instance
      .collection('approvedMT');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text('Trainer\'s Profile'),
                  backgroundColor: Colors.blueGrey,
                  expandedHeight: 350.0,
                  flexibleSpace: FlexibleSpaceBar(
                      background: widget.profilepicOG.isEmpty ? Center(child: CircularProgressIndicator()) : InteractiveViewer(
                          boundaryMargin: const EdgeInsets.all(double.infinity),
                          minScale: 1.0,
                          maxScale: 5.0,
                          child: Image.network(widget.profilepicOG,fit: BoxFit.fitHeight))
                  ),
                ),
                SliverFixedExtentList(
                  itemExtent: 50.00,
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.only(left: 5,top: 10),
                      child: Text(
                        "Certifications" ,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    widget.certificationOG != null ? Padding(
                      padding: const EdgeInsets.only(left: 10,top: 5),
                      child: Text(widget.certificationOG),
                    ): Center(child:CircularProgressIndicator()) ,

                    Padding(
                      padding: const EdgeInsets.only(left: 5,top: 5),
                      child: Text(
                        "Date Of Certifications" ,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    widget.docOG != null ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(widget.docOG),
                    ): Center(child:CircularProgressIndicator()) ,

                    Padding(
                      padding: const EdgeInsets.only(left: 5,top: 5),
                      child: Text(
                        "Specialized In" ,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    widget.specializationOG != null ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(widget.specializationOG),
                    ): Center(child:CircularProgressIndicator()),

                    Padding(
                      padding: const EdgeInsets.only(left: 5,top: 5),
                      child: Text(
                        "Experience" ,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    widget.expOG != null ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(widget.expOG),
                    ): Center(child:CircularProgressIndicator()) ,

                    Padding(
                      padding: const EdgeInsets.only(left: 5,top: 5),
                      child: Text(
                        "Specialized In" ,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    widget.specializationOG != null ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(widget.specializationOG),
                    ): Center(child:CircularProgressIndicator()),

                    Padding(
                      padding: const EdgeInsets.only(left: 5,top: 10),
                      child: Text(
                        "Achievements" ,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    widget.achievementOG != null ? Padding(
                      padding: const EdgeInsets.only(left: 10,top: 5),
                      child: Text(widget.achievementOG),
                    ): Center(child:CircularProgressIndicator()) ,

                    // ConstrainedBox(
                    //   constraints: BoxConstraints.tightFor(width: 30, height: 20),
                    //   child: ElevatedButton(
                    //     child: Text('Book Now'),
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Colors.black,
                    //       onPrimary: Color(0xffffc400),
                    //       shape: new RoundedRectangleBorder(
                    //         borderRadius: new BorderRadius.circular(60.0),
                    //       ),),
                    //     onPressed: (){ Navigator.push(
                    //       context, MaterialPageRoute(
                    //         builder: (context) => PackageDetails(widget.nameOG)),
                    //     );},),
                    // ),
                    SizedBox(height: 15.0,),

                  ]),
                )
              ],
            );
          }
      ),
    );
  }
}

