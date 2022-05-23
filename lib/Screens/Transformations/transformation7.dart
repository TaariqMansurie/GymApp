import 'package:GymApp/Screens/Packages/packageDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//for male trainers
class SuperTransformation7 extends StatefulWidget {

  var name ;
  var achievement ;
  var certification ;
  var specialization ;
  var exp ;
  var profilepic ;
  var doc ;

  SuperTransformation7(this.name,this.achievement,this.certification,this.specialization,this.exp,this.profilepic,this.doc);

  @override
  _SuperTransformation7State createState() => _SuperTransformation7State();
}

class _SuperTransformation7State extends State<SuperTransformation7> {

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
                    //         builder: (context) => PackageDetails(widget.name)),
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

  Widget buildImageCard() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Ink.image(
          image: NetworkImage(
            'https://i.natgeofe.com/n/3861de2a-04e6-45fd-aec8-02e7809f9d4e/02-cat-training-NationalGeographic_1484324.jpg',
          ),
          colorFilter: ColorFilters.greyscale,
          child: InkWell(
            onTap: () {},
          ),
          height: 240,
          fit: BoxFit.cover,
        ),
        Text(
          'Card With Splash',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ],
    ),
  );

  Widget buildQuoteCard() => Card(
    child: Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'If life were predictable it would cease to be life, and be without flavor.',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 12),
          Text(
            'Eleanor Roosevelt',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );

  Widget buildRoundedCard() => Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rounded card',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'This card is rounded',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    ),
  );

  Widget buildColoredCard() => Card(
    shadowColor: Colors.red,
    elevation: 8,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.redAccent, Colors.red],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Colored card',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'This card is rounded and has a gradient',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );

  Widget buildImageInteractionCard() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        Stack(
          children: [
            Ink.image(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80',
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Text(
                'Cats rule the world!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(16).copyWith(bottom: 0),
          child: Text(
            'The cat is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
            TextButton(
              child: Text('Buy Cat'),
              onPressed: () {},
            ),
            TextButton(
              child: Text('Buy Cat Food'),
              onPressed: () {},
            )
          ],
        )
      ],
    ),
  );
}

class ColorFilters {
  static final greyscale = ColorFilter.matrix(<double>[
    /// greyscale filter
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0, 0, 0, 1, 0
  ]);
}
