import 'package:GymApp/Screens/Notes/notes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditNote extends StatefulWidget {

  DocumentSnapshot docToEdit;
  EditNote({this.docToEdit});

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController content1 = TextEditingController();
  TextEditingController content2 = TextEditingController();
  TextEditingController content3 = TextEditingController();
  TextEditingController content4 = TextEditingController();
  TextEditingController content5 = TextEditingController();
  TextEditingController content6 = TextEditingController();
  TextEditingController content7 = TextEditingController();
  TextEditingController content8 = TextEditingController();
  TextEditingController content9 = TextEditingController();
  TextEditingController content10 = TextEditingController();
  TextEditingController content11 = TextEditingController();
  TextEditingController content12 = TextEditingController();
  TextEditingController content13 = TextEditingController();
  TextEditingController content14 = TextEditingController();
  TextEditingController content15 = TextEditingController();
  TextEditingController content16 = TextEditingController();
  TextEditingController content17 = TextEditingController();
  TextEditingController content18 = TextEditingController();
  TextEditingController content19 = TextEditingController();
  TextEditingController content20 = TextEditingController();
  TextEditingController content21 = TextEditingController();
  TextEditingController content22 = TextEditingController();
  TextEditingController content23 = TextEditingController();
  TextEditingController content24 = TextEditingController();
  TextEditingController content25 = TextEditingController();
  TextEditingController content26 = TextEditingController();
  TextEditingController content27 = TextEditingController();
  TextEditingController content28 = TextEditingController();
  TextEditingController content29 = TextEditingController();
  TextEditingController content30 = TextEditingController();
  TextEditingController content31 = TextEditingController();
  TextEditingController content32 = TextEditingController();
  TextEditingController content33 = TextEditingController();
  TextEditingController content34 = TextEditingController();
  TextEditingController content35 = TextEditingController();
  TextEditingController content36 = TextEditingController();
  TextEditingController content37 = TextEditingController();
  TextEditingController content38 = TextEditingController();
  TextEditingController content39 = TextEditingController();
  TextEditingController content40 = TextEditingController();
  TextEditingController content41 = TextEditingController();
  TextEditingController content42 = TextEditingController();
  TextEditingController content43 = TextEditingController();
  TextEditingController content44 = TextEditingController();
  TextEditingController content45 = TextEditingController();
  TextEditingController content46 = TextEditingController();
  TextEditingController content47 = TextEditingController();

  DateTime date;

  CollectionReference ref = Firestore.instance.collection('notes');

  @override
  void initState() {
    title = TextEditingController(text: widget.docToEdit.data['title']);
    content = TextEditingController(text: widget.docToEdit.data['content']);
    content1 = TextEditingController(text: widget.docToEdit.data['content1']);
    content2 = TextEditingController(text: widget.docToEdit.data['content2']);
    content3 = TextEditingController(text: widget.docToEdit.data['content3']);
    content4 = TextEditingController(text: widget.docToEdit.data['content4']);
    content5 = TextEditingController(text: widget.docToEdit.data['content5']);
    content6 = TextEditingController(text: widget.docToEdit.data['content6']);
    content7 = TextEditingController(text: widget.docToEdit.data['content7']);
    content8 = TextEditingController(text: widget.docToEdit.data['content8']);
    content9 = TextEditingController(text: widget.docToEdit.data['content9']);
    content10 = TextEditingController(text: widget.docToEdit.data['content10']);
    content11 = TextEditingController(text: widget.docToEdit.data['content11']);
    content12 = TextEditingController(text: widget.docToEdit.data['content12']);
    content13 = TextEditingController(text: widget.docToEdit.data['content13']);
    content14 = TextEditingController(text: widget.docToEdit.data['content14']);
    content15 = TextEditingController(text: widget.docToEdit.data['content15']);
    content16 = TextEditingController(text: widget.docToEdit.data['content16']);
    content17 = TextEditingController(text: widget.docToEdit.data['content17']);
    content18 = TextEditingController(text: widget.docToEdit.data['content18']);
    content19 = TextEditingController(text: widget.docToEdit.data['content19']);
    content20 = TextEditingController(text: widget.docToEdit.data['content20']);
    content21 = TextEditingController(text: widget.docToEdit.data['content21']);
    content22 = TextEditingController(text: widget.docToEdit.data['content22']);
    content23 = TextEditingController(text: widget.docToEdit.data['content23']);
    content24 = TextEditingController(text: widget.docToEdit.data['content24']);
    content25 = TextEditingController(text: widget.docToEdit.data['content25']);
    content26 = TextEditingController(text: widget.docToEdit.data['content26']);
    content27 = TextEditingController(text: widget.docToEdit.data['content27']);
    content28 = TextEditingController(text: widget.docToEdit.data['content28']);
    content29 = TextEditingController(text: widget.docToEdit.data['content29']);
    content30 = TextEditingController(text: widget.docToEdit.data['content30']);
    content31 = TextEditingController(text: widget.docToEdit.data['content31']);
    content32 = TextEditingController(text: widget.docToEdit.data['content32']);
    content33 = TextEditingController(text: widget.docToEdit.data['content33']);
    content34 = TextEditingController(text: widget.docToEdit.data['content34']);
    content35 = TextEditingController(text: widget.docToEdit.data['content35']);
    content36 = TextEditingController(text: widget.docToEdit.data['content36']);
    content37 = TextEditingController(text: widget.docToEdit.data['content37']);
    content38 = TextEditingController(text: widget.docToEdit.data['content38']);
    content39 = TextEditingController(text: widget.docToEdit.data['content39']);
    content40 = TextEditingController(text: widget.docToEdit.data['content40']);
    content41 = TextEditingController(text: widget.docToEdit.data['content41']);
    content42 = TextEditingController(text: widget.docToEdit.data['content42']);
    content43 = TextEditingController(text: widget.docToEdit.data['content43']);
    content44 = TextEditingController(text: widget.docToEdit.data['content44']);
    content45 = TextEditingController(text: widget.docToEdit.data['content45']);
    content46 = TextEditingController(text: widget.docToEdit.data['content46']);
    content47 = TextEditingController(text: widget.docToEdit.data['content47']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Color(0xffffc400)
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.docToEdit.reference.updateData({
                'title': title.text,
                'content': content.text,
                'content1': content1.text,
                'content2': content2.text,
                'content3': content3.text,
                'content4': content4.text,
                'content5': content5.text,
                'content6': content6.text,
                'content7': content7.text,
                'content8': content8.text,
                'content9': content9.text,
                'content10': content10.text,
                'content11': content11.text,
                'content12': content12.text,
                'content13': content13.text,
                'content14': content14.text,
                'content15': content15.text,
                'content16': content16.text,
                'content17': content17.text,
                'content18': content18.text,
                'content19': content19.text,
                'content20': content20.text,
                'content21': content21.text,
                'content22': content22.text,
                'content23': content23.text,
                'content24': content24.text,
                'content25': content25.text,
                'content26': content26.text,
                'content27': content27.text,
                'content28': content28.text,
                'content29': content29.text,
                'content30': content30.text,
                'content31': content31.text,
                'content32': content32.text,
                'content33': content33.text,
                'content34': content34.text,
                'content35': content35.text,
                'content36': content36.text,
                'content37': content37.text,
                'content38': content38.text,
                'content39': content39.text,
                'content40': content40.text,
                'content41': content41.text,
                'content42': content42.text,
                'content43': content43.text,
                'content44': content44.text,
                'content45': content45.text,
                'content46': content46.text,
                'content47': content47.text,
              }).whenComplete(() => Navigator.pop(context));
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Notes()));
            },
            icon: Icon(Icons.save_alt,color: Color(0xffffc400),),
            label: Text('Save',style: TextStyle(
              color: Color(0xffffc400)
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              widget.docToEdit.reference
                  .delete()
                  .whenComplete(() => Navigator.pop(context));
            },
            icon: Icon(Icons.delete_forever,color: Color(0xffffc400)),
            label: Text('Delete',style: TextStyle(
              color: Color(0xffffc400)
                 ),
              ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: TextField(
                controller: title,
                maxLines: 3,
                decoration: InputDecoration(hintText: 'Title'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                // child: TextField(
                //   controller: content,
                //   maxLines: 50,
                //   decoration: InputDecoration(hintText: 'Log Your Sets here'),
                // ),
                child :SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Table(
                    textDirection: TextDirection.ltr,
                    defaultColumnWidth: FixedColumnWidth(100.0),
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1),
                    children: [
                      TableRow(children: [
                        Column(children:[Text('Exercise\n Name', style: TextStyle(fontSize: 20.0),)]),
                        Column(children:[Text('Sets', style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('Reps', style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('Weight ', style: TextStyle(fontSize: 20.0))])
                      ]),
                      TableRow( children: [
                        Column(children:[TextField(controller: content,maxLines: 1,textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content1,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content2,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content3,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),

                      ]),
                      TableRow( children: [
                        Column(children:[TextField(controller: content4,maxLines: 1,textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content5,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content6,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content7,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),

                      ]),
                      TableRow( children: [
                        Column(children:[TextField(controller: content8,maxLines: 1,textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content9,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content10,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content11,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                      ]),
                      TableRow( children: [
                        Column(children:[TextField(controller: content12,maxLines: 1,textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content13,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content14,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content15,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),

                      ]),
                      TableRow( children: [
                        Column(children:[TextField(controller: content16,maxLines: 1,textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content17,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content18,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content19,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                      ]),
                      TableRow( children: [
                        Column(children:[TextField(controller: content20,maxLines: 1,textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content21,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content22,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content23,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                      ]),
                      TableRow( children: [
                        Column(children:[TextField(controller: content24,maxLines: 1,textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content25,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content26,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content27,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                      ]),
                      TableRow( children: [
                        Column(children:[TextField(controller: content28,maxLines: 1,textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content29,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content30,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content31,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                      ]),
                      TableRow( children: [
                        Column(children:[TextField(controller: content32,maxLines: 1,textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content33,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content34,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content35,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                      ]),
                      TableRow( children: [
                        Column(children:[TextField(controller: content36,maxLines: 1,textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content37,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content38,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content39,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                      ]),
                      TableRow( children: [
                        Column(children:[TextField(controller: content40,maxLines: 1,textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content41,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content42,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content43,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                      ]),
                      TableRow( children: [
                        Column(children:[TextField(controller: content44,maxLines: 1,textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content45,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content46,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                        Column(children:[TextField(controller: content47,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)]),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
