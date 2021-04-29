import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SuperTransformation1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   title: Text(
      //       'Welcome to Fit Mumbai'
      //   ),
      //   backgroundColor: Colors.deepPurple[500] ,
      //   leading: IconButton(
      //     icon: Icon(FontAwesomeIcons.gripLines),
      //     onPressed: () {},
      //     color: Colors.black,
      //     tooltip: 'Menu',
      //   ),
      // ),
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Super Transformation 1'),
              backgroundColor: Colors.deepPurple[400],
              expandedHeight: 350.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('apple.png'),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 200.00,
              delegate: SliverChildListDelegate([
                Text('ST1'),
                Text('BEst ST till date in 5 months'),
                buildImageCard(),
                SizedBox(height: 15.0,),
                Text('ST1'),
                Text('ST1'),
                Text('ST1'),
                Text('ST1'),
                Text('ST1'),
                Text('ST1'),
                Text('ST1'),
              ]),
            )
          ],
        ),
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
      borderRadius: BorderRadius.circular(24),
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
            FlatButton(
              child: Text('Buy Cat'),
              onPressed: () {},
            ),
            FlatButton(
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
