import 'package:flutter/material.dart';

class SilverPackagee extends StatelessWidget {
  const SilverPackagee({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: Text(
            'Silver Package'
        ),backgroundColor: Colors.deepPurple[500],
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.exit_to_app),
          //   color: Colors.black,
          //   tooltip: 'Logout',
          //   onPressed: () async {
          //     await _auth.signOut();
          //   },
          // ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(

          ),
        )
      ),
    );
  }
}
