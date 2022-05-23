import 'package:flutter/material.dart';

class BigImageWall extends StatefulWidget {

  var image_pic_url;

  BigImageWall(this.image_pic_url);

  @override
  _BigImageWallState createState() => _BigImageWallState();
}

class _BigImageWallState extends State<BigImageWall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Color(0xffffc400)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: InteractiveViewer(
                boundaryMargin: const EdgeInsets.all(double.infinity),
                minScale: 1.0,
                maxScale: 5.0,
                child: Image.network(
                  widget.image_pic_url
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
