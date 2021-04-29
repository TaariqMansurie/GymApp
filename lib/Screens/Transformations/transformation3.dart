import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SuperTransformation3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   appBar: new AppBar(
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
                Text('BEst ST till date in 9 months'),
                Text('ST1'),
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
}

