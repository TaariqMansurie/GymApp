import 'package:flutter/material.dart';

class AdminControl extends StatefulWidget {
  const AdminControl({Key key}) : super(key: key);

  @override
  _AdminControlState createState() => _AdminControlState();
}

class _AdminControlState extends State<AdminControl> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Approvals'),
                Tab(text: 'Client Sessions',),
                Tab(text: 'THIRD'),
              ],
            ),
            title: Text('Admin Control'),
            automaticallyImplyLeading: true,
            backgroundColor: Colors.deepPurple[400],
          ),
          body: TabBarView(
            children: [
              TrainersApprovals(),
              ClientSessions(),
              ThirdScreen()
            ],
          ),
        ),
      ),
    );
  }
}

class TrainersApprovals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
                child:
                Text('Trainers Approvals Screen',
                  style: TextStyle(fontSize: 21),)
            )
        )
    );
  }
}

class ClientSessions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
                child:
                Text('Client Sessions Screen',
                  style: TextStyle(fontSize: 21),)
            )
        )
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
                child:
                Text('Third Activity Screen',
                  style: TextStyle(fontSize: 21),)
            )
        )
    );
  }
}
