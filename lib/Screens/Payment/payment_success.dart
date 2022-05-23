import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PaymentSuccessful extends StatefulWidget {

  var userName ;
  var email ;
  var gender ;
  var profilePic ;
  var trainerSelected;
  var packageDuration ;
  var packageType ;
 // var packageDate ;
  var paymentSuccess ;
  var paymentAmount ;
  PaymentSuccessful(this.userName,this.email,this.gender,this.profilePic,this.trainerSelected,this.packageDuration,this.packageType,this.paymentSuccess,this.paymentAmount);

  @override
  _PaymentSuccessfulState createState() => _PaymentSuccessfulState();
}

class _PaymentSuccessfulState extends State<PaymentSuccessful> {

  CollectionReference ref = Firestore.instance
      .collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text('User\'s Profile'),
                  backgroundColor: Colors.blueGrey,
                  expandedHeight: 250.0,
                  // flexibleSpace: FlexibleSpaceBar(
                  //     background: widget.profilePic.isEmpty ? Center(child: CircularProgressIndicator()) : InteractiveViewer(
                  //         boundaryMargin: const EdgeInsets.all(double.infinity),
                  //         minScale: 1.0,
                  //         maxScale: 5.0,
                  //         child: Image.network(widget.profilePic,fit: BoxFit.contain))
                  // ),automaticallyImplyLeading: true,
                ),
                SliverFixedExtentList(
                  itemExtent: 50.00,
                  delegate: SliverChildListDelegate([

                    //user name
                    Padding(
                      padding: const EdgeInsets.only(left: 5,top: 10),
                      child: Text(
                        "User Name" ,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    widget.userName != null ? Padding(
                      padding: const EdgeInsets.only(left: 10,top: 5),
                      child: Text(widget.userName),
                    ): Center(child:CircularProgressIndicator()),

                    //user email
                    Padding(
                      padding: const EdgeInsets.only(left: 5,top: 10),
                      child: Text(
                        "Email" ,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    widget.email != null ? Padding(
                      padding: const EdgeInsets.only(left: 10,top: 5),
                      child: Text(widget.email),
                    ): Center(child:CircularProgressIndicator()) ,

                    //gender
                    Padding(
                      padding: const EdgeInsets.only(left: 5,top: 5),
                      child: Text(
                        "Gender" ,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    widget.gender != null ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(widget.gender),
                    ): Center(child:CircularProgressIndicator()) ,

                    //trainer selected
                    Padding(
                      padding: const EdgeInsets.only(left: 5,top: 5),
                      child: Text(
                        "Trainer Selected" ,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    widget.trainerSelected != null ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(widget.trainerSelected),
                    ): Center(child:CircularProgressIndicator()),

                    //package duration
                    Padding(
                      padding: const EdgeInsets.only(left: 5,top: 5),
                      child: Text(
                        "Package Duration" ,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    widget.packageDuration != null ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(widget.packageDuration),
                    ): Center(child:CircularProgressIndicator()) ,

                    //package type
                    Padding(
                      padding: const EdgeInsets.only(left: 5,top: 5),
                      child: Text(
                        "Package Type" ,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    widget.packageType != null ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(widget.packageType),
                    ): Center(child:CircularProgressIndicator()) ,

                    //package date
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 5,top: 5),
                    //   child: Text(
                    //     "Payment Date" ,
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .subtitle1
                    //         .copyWith(fontWeight: FontWeight.w900),
                    //   ),
                    // ),
                    // widget.packageDate != null ? Padding(
                    //   padding: const EdgeInsets.only(left: 10),
                    //   child: Text(widget.packageDate),
                    // ): Center(child:CircularProgressIndicator()) ,

                    //payment amount
                    Padding(
                      padding: const EdgeInsets.only(left: 5,top: 5),
                      child: Text(
                        "Payment Amount" ,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    widget.paymentAmount != null ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(widget.paymentAmount),
                    ): Center(child:CircularProgressIndicator()) ,

                    //payment success
                    Padding(
                      padding: const EdgeInsets.only(left: 5,top: 5),
                      child: Text(
                        "Payment Success" ,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    widget.paymentSuccess != null ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(widget.paymentSuccess),
                    ): Center(child:CircularProgressIndicator()) ,

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
