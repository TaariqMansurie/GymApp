import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ClientTestimonials extends StatefulWidget {
  const ClientTestimonials({Key key}) : super(key: key);

  @override
  _ClientTestimonialsState createState() => _ClientTestimonialsState();
}

class _ClientTestimonialsState extends State<ClientTestimonials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
              color: Color(0xffffc400)
          ),
          title: Text('Client Testimonials',
            style: TextStyle(
              color: Color(0xffffc400)),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                     children: <Widget>[
                       SizedBox(height: 30,),
                       Row(
                         mainAxisSize: MainAxisSize.max,
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Card(
                             child: InkWell(
                               onTap: () => launch('https://drive.google.com/file/d/133FIGUvRwMFU_tDw2shaJiZUrY5mDTGz/view?usp=sharing'),
                               child: Container(
                                 height: 150,
                                 width: 150,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("assets/videos/1.png"),
                                     fit: BoxFit.fill,
                                     alignment: Alignment.topCenter,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                           Card(
                             child: InkWell(
                               onTap: () => launch('https://drive.google.com/file/d/12yvILuFAOBiv0ciRm7hxhXbOgEN5keQ1/view?usp=sharing'),
                               child: Container(
                                 height: 150,
                                 width: 150,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("assets/videos/2.png"),
                                     fit: BoxFit.fill,
                                     alignment: Alignment.topCenter,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(height: 10,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Center(
                             child: Text(
                               '      Rais Shaikh',
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                             ),
                           ),
                           Center(
                             child: Text(
                               '        Varsha Chowdhary',textAlign: TextAlign.right,
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                             ),
                           ),
                         ],
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Center(
                             child: Text(
                               'MLA Bhiwandi',
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                             ),
                           ),
                           Center(
                             child: Text(
                               'Dancer/\nbusiness woman',
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                             ),
                           ),
                         ],
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Center(
                             child: Text(
                               '1',
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                             ),
                           ),
                           Center(
                             child: Text(
                               '2',
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                             ),
                           ),
                         ],
                       ),

                       SizedBox(height: 30,),
                       Row(
                         mainAxisSize: MainAxisSize.max,
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Card(
                             child: InkWell(
                               onTap: () => launch('https://drive.google.com/file/d/124nzCjzOg9apeicywTNpVIbxp0JZBgV7/view?usp=sharing'),
                               child: Container(
                                 height: 150,
                                 width: 150,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("assets/videos/3.png"),
                                     fit: BoxFit.fill,
                                     alignment: Alignment.topCenter,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                           Card(
                             child: InkWell(
                               onTap: () => launch('https://drive.google.com/file/d/13O6NuRZWWAboY8jeoZqLdoDH47ryA3ro/view?usp=sharing'),
                               child: Container(
                                 height: 150,
                                 width: 150,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("assets/videos/4.png"),
                                     fit: BoxFit.fill,
                                     alignment: Alignment.topCenter,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(height: 10,),
                       Padding(
                         padding: const EdgeInsets.only(left: 5,right: 5),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Center(
                               child: Text(
                                 '   Saral Agarwal',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                             Center(
                               child: Text(
                                 '  Aarti Sharma',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 5,right: 5),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Center(
                               child: Text(
                                 '   Executive director\n     Morgan Stanley. ',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                             Center(
                               child: Text(
                                 '    Former miss \n      india/model. ',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Text(
                             '3',
                             style: TextStyle(
                               fontWeight: FontWeight.normal,
                               color: Colors.black,
                               fontSize: 20,
                             ),
                           ),
                           Text(
                             '4',
                             style: TextStyle(
                               fontWeight: FontWeight.normal,
                               color: Colors.black,
                               fontSize: 20,
                             ),
                           ),
                         ],
                       ),

                       SizedBox(height: 30,),
                       Row(
                         mainAxisSize: MainAxisSize.max,
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Card(
                             child: InkWell(
                               onTap: () => launch('https://drive.google.com/file/d/12nWxQM3kOArzetGyiM1E_ZeRrroc7a8p/view?usp=sharing'),
                               child: Container(
                                 height: 150,
                                 width: 150,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("assets/videos/5.png"),
                                     fit: BoxFit.fill,
                                     alignment: Alignment.topCenter,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                           Card(
                             child: InkWell(
                               onTap: () => launch('https://drive.google.com/file/d/1313Rx0f0zZknpnlnBbBKV-G99bUUZkP0/view?usp=sharing'),
                               child: Container(
                                 height: 150,
                                 width: 150,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("assets/videos/6.png"),
                                     fit: BoxFit.fill,
                                     alignment: Alignment.topCenter,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(height: 10,),
                       Padding(
                         padding: const EdgeInsets.only(left: 5,right: 5),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Center(
                               child: Text(
                                 ' Gaurav Nanda',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                             Center(
                               child: Text(
                                 'Shomu mitra',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 5,right: 5),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Center(
                               child: Text(
                                 '           Actor',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                             Center(
                               child: Text(
                                 '          Actor/ event \n             organiser. ',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Center(
                             child: Text(
                               '5',
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                             ),
                           ),
                           Center(
                             child: Text(
                               '6',
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                             ),
                           ),
                         ],
                       ),

                       SizedBox(height: 30,),
                       Row(
                         mainAxisSize: MainAxisSize.max,
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Card(
                             child: InkWell(
                               onTap: () => launch('https://drive.google.com/file/d/137rjYyjcri4Jt1-EEfAlRQvmr3pU0d_4/view?usp=sharing'),
                               child: Container(
                                 height: 150,
                                 width: 150,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("assets/videos/7.png"),
                                     fit: BoxFit.fill,
                                     alignment: Alignment.topCenter,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                           Card(
                             child: InkWell(
                               onTap: () => launch('https://drive.google.com/file/d/13Y3rRjqaQcZWnwXgr5-QoRVwOxv70zl3/view?usp=sharing'),
                               child: Container(
                                 height: 150,
                                 width: 150,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("assets/videos/8.png"),
                                     fit: BoxFit.fill,
                                     alignment: Alignment.topCenter,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(height: 10,),
                       Padding(
                         padding: const EdgeInsets.only(left: 5,right: 5),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Center(
                               child: Text(
                                 '   Sherrin varghese',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                             Center(
                               child: Text(
                                 'Captain Sujit Churi',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 5,right: 5),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Center(
                               child: Text(
                                 '       Actor/ Singer',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                             Center(
                               child: Wrap(
                                 children: [Text(
                                   '           Head - fleet \n            personnel \n          department.\n    Eastern shipping\n               company. ',
                                   style: TextStyle(
                                     fontWeight: FontWeight.normal,
                                     color: Colors.black,
                                     fontSize: 20,
                                   ),
                                 ),]
                               ),
                             ),
                           ],
                         ),
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Center(
                             child: Text(
                               '7',
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                             ),
                           ),
                           Center(
                             child: Text(
                               '8',
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                             ),
                           ),
                         ],
                       ),

                       SizedBox(height: 30,),
                       Row(
                         mainAxisSize: MainAxisSize.max,
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Card(
                             child: InkWell(
                               onTap: () => launch('https://drive.google.com/file/d/12IRZVh9cCpnJf4xWOaS2Th3i6CMz2hQX/view?usp=sharing'),
                               child: Container(
                                 height: 150,
                                 width: 150,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("assets/videos/9.png"),
                                     fit: BoxFit.fill,
                                     alignment: Alignment.topCenter,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                           Card(
                             child: InkWell(
                               onTap: () => launch('https://drive.google.com/file/d/137XYm_23xLPOHdy5nj754spadMhN9WnP/view?usp=sharing'),
                               child: Container(
                                 height: 150,
                                 width: 150,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("assets/videos/10.png"),
                                     fit: BoxFit.fill,
                                     alignment: Alignment.topCenter,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(height: 10,),
                       Padding(
                         padding: const EdgeInsets.only(left: 5,right: 5),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Center(
                               child: Text(
                                 'Harshh Singh',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                             Center(
                               child: Text(
                                 'Manav',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 5,right: 5),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Center(
                               child: Text(
                                 '           Actor',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                             Center(
                               child: Text(
                                 '          Fitness Manager',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Center(
                             child: Text(
                               '9',
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                             ),
                           ),
                           Center(
                             child: Text(
                               '10',
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                             ),
                           ),
                         ],
                       ),

                       SizedBox(height: 30,),
                       Row(
                         mainAxisSize: MainAxisSize.max,
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Card(
                             child: InkWell(
                               onTap: () => launch('https://drive.google.com/file/d/12ZVjLUqhNf9a_OwqIObbtPiBs1eOgt3Q/view?usp=sharing'),
                               child: Container(
                                 height: 150,
                                 width: 150,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("assets/videos/11.png"),
                                     fit: BoxFit.fill,
                                     alignment: Alignment.topCenter,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                           Card(
                             child: InkWell(
                               onTap: () => launch('https://drive.google.com/file/d/13VvWztfdmnOjUe7xnCsqIY1n1klpjnwx/view?usp=sharing'),
                               child: Container(
                                 height: 150,
                                 width: 150,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("assets/videos/12.png"),
                                     fit: BoxFit.fill,
                                     alignment: Alignment.topCenter,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(height: 10,),
                       Padding(
                         padding: const EdgeInsets.only(left: 5,right: 5),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Center(
                               child: Text(
                                 '    Tanvir khan',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                             Center(
                               child: Text(
                                 'Ishtiyaque  kazi',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 5,right: 5),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Center(
                               child: Text(
                                 '   Business man\n     Real estate. ',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                             Center(
                               child: Text(
                                 'Civil engineer',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Center(
                             child: Text(
                               '11',
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                             ),
                           ),
                           Center(
                             child: Text(
                               '12',
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                             ),
                           ),
                         ],
                       ),

                       SizedBox(height: 30,),
                       Row(
                         mainAxisSize: MainAxisSize.max,
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Card(
                             child: InkWell(
                               onTap: () => launch('https://drive.google.com/file/d/12tCVuRlY9bKQ3xQzbv2VkrN97LQj27p5/view?usp=sharing'),
                               child: Container(
                                 height: 150,
                                 width: 150,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("assets/videos/13.png"),
                                     fit: BoxFit.fill,
                                     alignment: Alignment.topCenter,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                           Card(
                             child: InkWell(
                               onTap: () => launch('https://drive.google.com/file/d/12iklHc99MWSE_W1-3NXpjQmJ-NkrkMPB/view?usp=sharing'),
                               child: Container(
                                 height: 150,
                                 width: 150,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("assets/videos/14.png"),
                                     fit: BoxFit.fill,
                                     alignment: Alignment.topCenter,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(height: 10,),
                       Padding(
                         padding: const EdgeInsets.only(left: 5,right: 5),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Center(
                               child: Text(
                                 'Mustafa Sakarwala',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                             Center(
                               child: Text(
                                 'Ram Jangid',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 5,right: 5),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Center(
                               child: Text(
                                 '     Teacher\nSakarwala \n   classes',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                             Center(
                               child: Text(
                                 'Model',
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black,
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Center(
                             child: Text(
                               '13',
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                             ),
                           ),
                           Center(
                             child: Text(
                               '14',
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                             ),
                           ),
                         ],
                       ),
                       ],
                     ),
          ),
                 ),
              );
            }
          }
