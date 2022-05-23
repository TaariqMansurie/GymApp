import 'package:GymApp/Screens/Packages/packageDetails3.dart';
import 'package:GymApp/Screens/Packages/packageDetailsFemale.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SuperTransformation22 extends StatefulWidget {
  var name ;
  var achievement ;
  var certification ;
  var specialization ;
  var exp ;
  var profilepic ;
  var doc ;
  var price1 ;
  var price2 ;
  var price3 ;
  SuperTransformation22(this.name,this.achievement,this.certification,this.specialization,this.exp,this.profilepic,this.doc,this.price1,this.price2,this.price3);

  @override
  _SuperTransformation22State createState() => _SuperTransformation22State();
}

class _SuperTransformation22State extends State<SuperTransformation22> {
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
                      background: widget.profilepic.isEmpty ? Center(child: CircularProgressIndicator()) : InteractiveViewer(
                          boundaryMargin: const EdgeInsets.all(double.infinity),
                          minScale: 1.0,
                          maxScale: 5.0,
                          child: Image.network(widget.profilepic,fit: BoxFit.fitHeight))
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
                    widget.certification != null ? Padding(
                      padding: const EdgeInsets.only(left: 10,top: 5),
                      child: Text(widget.certification),
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
                    widget.doc != null ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(widget.doc),
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
                    widget.specialization != null ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(widget.specialization),
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
                    widget.exp != null ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(widget.exp),
                    ): Center(child:CircularProgressIndicator()) ,

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
                    widget.achievement != null ? Padding(
                      padding: const EdgeInsets.only(left: 10,top: 5),
                      child: Text(widget.achievement),
                    ): Center(child:CircularProgressIndicator()) ,

                    Padding(
                      padding: const EdgeInsets.only(left: 5,top: 10),
                      child: Text(
                        "Pricing" ,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "1 Month :- Rs ${widget.price1}" ,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "3 Months :- Rs ${widget.price2}" ,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "6 Months :- Rs ${widget.price3}" ,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),

                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 30, height: 20),
                      child: ElevatedButton(
                        child: Text('Book Now'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Color(0xffffc400),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(60.0),
                          ),),
                        onPressed: (){ Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => PackageDetails3(widget.name,widget.price1,widget.price2,widget.price3)),
                        );},),
                    ),
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
