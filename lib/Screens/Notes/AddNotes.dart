import 'package:GymApp/shared/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNotes extends StatefulWidget {
  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
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
  //CollectionReference ref = Firestore.instance.collection('users').document(uid).collection('notes');

  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<User>(context).uid;
    CollectionReference ref = Firestore.instance
        .collection('users')
        .document(uid)
        .collection('notes');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Color(0xffffc400)
        ),
        actions: [
          //Text('Confidence: ${(confidence * 100.0).toStringAsFixed(1)}%'),
          TextButton.icon(
              onPressed: () {
                ref.add({
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
              },
              icon: Icon(Icons.save_alt,color: Color(0xffffc400),),
              label: Text('Save',style: TextStyle(
                color: Color(0xffffc400)
              ),))
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
                decoration: InputDecoration(hintText: 'Title',border: InputBorder.none,enabledBorder: InputBorder.none),
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
                    defaultColumnWidth: FixedColumnWidth(150.0),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1),
                    children: [
                      TableRow(
                          children: [
                        Column(children:[Text('Exercise\n Name', style: TextStyle(fontSize: 20.0),)]),
                        Column(children:[Text('Sets', style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('Reps', style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('Weight ', style: TextStyle(fontSize: 20.0))])
                      ]),
                      TableRow( children: [
                        Center(child: Column(children:[TextField(controller: content,maxLines: 1,textAlign: TextAlign.center,)])),
                        Center(child: Column(children:[TextField(controller: content1,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)])),
                        Center(child: Column(children:[TextField(controller: content2,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)])),
                        Center(child: Column(children:[TextField(controller: content3,keyboardType: TextInputType.numberWithOptions(decimal: true),textAlign: TextAlign.center)])),

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
            ),])
      )
                 );
    //           ),
    //         ),
    //         // RaisedButton(
    //         //   onPressed: () {
    //         //     Navigator.push(
    //         //         context, MaterialPageRoute(builder: (_) => SpeechScreen()));
    //         //   },
    //         //   child: Text("Voice Screen"),
    //         //   color: Colors.lightBlueAccent,
    //         // )
    //       ],
    //     ),
    //   ),
    // );
  }
}

// class SpeechScreen extends StatefulWidget {
//   @override
//   _SpeechScreenState createState() => _SpeechScreenState();
// }
//
// class _SpeechScreenState extends State<SpeechScreen> {
//   final Map<String, HighlightedWord> _highlights = {
//     'flutter': HighlightedWord(
//       onTap: () => print('flutter'),
//       textStyle: const TextStyle(
//         color: Colors.blue,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'voice': HighlightedWord(
//       onTap: () => print('voice'),
//       textStyle: const TextStyle(
//         color: Colors.green,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'subscribe': HighlightedWord(
//       onTap: () => print('subscribe'),
//       textStyle: const TextStyle(
//         color: Colors.red,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'like': HighlightedWord(
//       onTap: () => print('like'),
//       textStyle: const TextStyle(
//         color: Colors.blueAccent,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'comment': HighlightedWord(
//       onTap: () => print('comment'),
//       textStyle: const TextStyle(
//         color: Colors.green,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   };
//
//   TextEditingController title = TextEditingController();
//
//   TextEditingController content = TextEditingController();
//
//   stt.SpeechToText _speech;
//   bool _isListening = false;
//   String _text = 'Press the button and start speaking';
//   double _confidence = 1.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _speech = stt.SpeechToText();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String uid = Provider.of<Userr>(context).uid;
//     CollectionReference ref = Firestore.instance
//         .collection('users')
//         .document(uid)
//         .collection('notes');
//     return Scaffold(
//       appBar: AppBar(
//           title:
//               Text('Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
//           actions: [
//             FlatButton.icon(
//                 onPressed: () {
//                   ref.add({
//                     'title': title.text,
//                     'content': content.text
//                   }).whenComplete(() => Navigator.pop(context));
//                 },
//                 icon: Icon(Icons.save_alt),
//                 label: Text('Save'))
//           ]),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: AvatarGlow(
//         animate: _isListening,
//         glowColor: Theme.of(context).primaryColor,
//         endRadius: 75.0,
//         duration: const Duration(milliseconds: 2000),
//         repeatPauseDuration: const Duration(milliseconds: 100),
//         repeat: true,
//         child: FloatingActionButton(
//           onPressed: _listen,
//           child: Icon(_isListening ? Icons.mic : Icons.mic_none),
//         ),
//       ),
//       body: SingleChildScrollView(
//         reverse: true,
//         child: Container(
//           padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
//           child: TextHighlight(
//             text: _text,
//             words: _highlights,
//             textStyle: const TextStyle(
//               fontSize: 32.0,
//               color: Colors.black,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//       ), //Jo bhi voh as an audio le rhaa hain usko bas content ke andar save karna hainn
//     );
//   }
//
//   void _listen() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize(
//         onStatus: (val) => print('onStatus: $val'),
//         onError: (val) => print('onError: $val'),
//       );
//       if (available) {
//         setState(() => _isListening = true);
//         _speech.listen(
//           onResult: (val) => setState(() {
//             _text = val.recognizedWords;
//             if (val.hasConfidenceRating && val.confidence > 0) {
//               _confidence = val.confidence;
//               print(val.recognizedWords);
//               content.text = val.recognizedWords;
//             }
//           }),
//         );
//       }
//     } else {
//       setState(() => _isListening = false);
//       _speech.stop();
//     }
//   }
// }

//   SpeechRecognition _speechRecognition;
//   bool _isAvailable = false;
//   bool _isListening = false;
//
//   String resultText = "";
//
//   @override
//   void initState() {
//     super.initState();
//     initSpeechRecognizer();
//   }
//
//   void initSpeechRecognizer() {
//     _speechRecognition = SpeechRecognition();
//
//     _speechRecognition.setAvailabilityHandler(
//           (bool result) => setState(() => _isAvailable = result),
//     );
//
//     _speechRecognition.setRecognitionStartedHandler(
//           () => setState(() => _isListening = true),
//     );
//
//     _speechRecognition.setRecognitionResultHandler(
//           (String speech) => setState(() => resultText = speech),
//     );
//
//     _speechRecognition.setRecognitionCompleteHandler(
//           () => setState(() => _isListening = false),
//     );
//
//     _speechRecognition.activate().then(
//           (result) => setState(() => _isAvailable = result),
//     );
//   }
//   // final Map<String, HighlightedWord> _highlights = {
//   //   'flutter': HighlightedWord(
//   //     onTap: () => print('flutter'),
//   //     textStyle: const TextStyle(
//   //       color: Colors.blue,
//   //       fontWeight: FontWeight.bold,
//   //     ),
//   //   ),
//   //   'voice': HighlightedWord(
//   //     onTap: () => print('voice'),
//   //     textStyle: const TextStyle(
//   //       color: Colors.green,
//   //       fontWeight: FontWeight.bold,
//   //     ),
//   //   ),
//   //   'subscribe': HighlightedWord(
//   //     onTap: () => print('subscribe'),
//   //     textStyle: const TextStyle(
//   //       color: Colors.red,
//   //       fontWeight: FontWeight.bold,
//   //     ),
//   //   ),
//   //   'like': HighlightedWord(
//   //     onTap: () => print('like'),
//   //     textStyle: const TextStyle(
//   //       color: Colors.blueAccent,
//   //       fontWeight: FontWeight.bold,
//   //     ),
//   //   ),
//   //   'comment': HighlightedWord(
//   //     onTap: () => print('comment'),
//   //     textStyle: const TextStyle(
//   //       color: Colors.green,
//   //       fontWeight: FontWeight.bold,
//   //     ),
//   //   ),
//   // };
//
//   // stt.SpeechToText speech ;
//   // bool isListening = false ;
//   // String text = 'Press the button and start speaking';
//   // double confidence = 1.0 ;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 FloatingActionButton(
//                   child: Icon(Icons.cancel),
//                   mini: true,
//                   backgroundColor: Colors.deepOrange,
//                   onPressed: () {
//                     if (_isListening)
//                       _speechRecognition.cancel().then(
//                             (result) => setState(() {
//                           _isListening = result;
//                           resultText = "";
//                         }),
//                       );
//                   },
//                 ),
//                 FloatingActionButton(
//                   child: Icon(Icons.mic),
//                   onPressed: () {
//                     if (_isAvailable && !_isListening)
//                       _speechRecognition
//                           .listen(locale: "en_US")
//                           .then((result) => print('$result'));
//                   },
//                   backgroundColor: Colors.pink,
//                 ),
//                 FloatingActionButton(
//                   child: Icon(Icons.stop),
//                   mini: true,
//                   backgroundColor: Colors.deepPurple,
//                   onPressed: () {
//                     if (_isListening)
//                       _speechRecognition.stop().then(
//                             (result) => setState(() => _isListening = result),
//                       );
//                   },
//                 ),
//               ],
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.8,
//               decoration: BoxDecoration(
//                 color: Colors.cyanAccent[100],
//                 borderRadius: BorderRadius.circular(6.0),
//               ),
//               padding: EdgeInsets.symmetric(
//                 vertical: 8.0,
//                 horizontal: 12.0,
//               ),
//               child: Text(
//                 resultText,
//                 style: TextStyle(fontSize: 24.0),
//               ),
//             )
//           ],
//         ),
//       ),
//
//     );
//   }
// }
//
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: AvatarGlow(
//         animate: isListening,
//         glowColor: Theme.of(context).primaryColor,
//         endRadius: 75.0,
//         duration: const Duration(milliseconds: 2000),
//         repeatPauseDuration: const Duration(milliseconds: 100),
//         repeat: true,
//         child: FloatingActionButton(
//           onPressed: _listen,
//           child: Icon(isListening ? Icons.mic : Icons.mic_none),
//         ),
//       ),
//       body: SingleChildScrollView(
//         reverse: true,
//         child: Container(
//           padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
//           child: TextHighlight(
//             text: text,
//             words: _highlights,
//             textStyle: const TextStyle(
//               fontSize: 32.0,
//               color: Colors.black,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   void _listen() async {
//     if (!isListening) {
//       bool available = await speech.initialize(
//         onStatus: (val) => print('onStatus: $val'),
//         onError: (val) => print('onError: $val'),
//       );
//       if (available) {
//         setState(() => isListening = true);
//         speech.listen(
//           onResult: (val) => setState(() {
//             text = val.recognizedWords;
//             if (val.hasConfidenceRating && val.confidence > 0) {
//               confidence = val.confidence;
//             }
//           }),
//         );
//       }
//     } else {
//       setState(() => isListening = false);
//       speech.stop();
//     }
//   }
// }
