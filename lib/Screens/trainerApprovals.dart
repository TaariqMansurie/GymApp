import 'package:flutter/material.dart';

class TrainerApprovals extends StatefulWidget {
  const TrainerApprovals({Key key}) : super(key: key);

  @override
  _TrainerApprovalsState createState() => _TrainerApprovalsState();
}

class _TrainerApprovalsState extends State<TrainerApprovals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Approvals'),
        backgroundColor: Colors.deepPurple[500],
      ),
      body: Center(
        child: Text('Approvals')
      ),
    );
  }
}
