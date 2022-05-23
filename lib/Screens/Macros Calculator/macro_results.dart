import 'package:GymApp/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';

class MacroResults extends StatefulWidget {


  var calories ;

  // String newCalories = calories.text ;
  //
  // int newCalories2 = int.parse(newCalories) ;
  //int newCalories2 ;
  final List<String> dietTypeList = ['High Carbs (60:25:15)', 'Moderate Carbs (50:30:20)', 'Zone Diet(40:30:30)', 'Low Carbs (25:35:40)', 'Keto Diet (05:35:60)'];
  var dietType = 'High Carbs (60:25:15)';

  //double calories;
  MacroResults(this.calories,this.dietType);

  @override
  _MacroResultsState createState() => _MacroResultsState();
}

class _MacroResultsState extends State<MacroResults> {

  @override
  void initState() {
    String newCalories = widget.calories.text ;
    int newCalories2 = int.tryParse(newCalories) ;
 //   int newCaloriess =int.parse(widget.newCalories2.text) ;
  //  double newCalories = widget.newCalories2 as double ;
    print(widget.calories);
    print(widget.dietType);
    if(widget.dietType == 'High Carbs (60:25:15)'){
      setState(() {
        //calculate protein in cals
        if (newCalories2 != null) {
        double div = newCalories2 * .6;
        //protein in grams
        double div6 = div / 4;
        div1 = div6;

        //calculate carbs in cals
        double div2 = newCalories2 * .25;
        //calculate carbs in grams
        double div7 = div2 / 4;
        div3 = div7;

        //calculate fats in cals
        double div4 = newCalories2 * .15;
        //calculate carbs in grams
        double div8 = div4 / 9;
        div5 = div8;
      }
        else{
          Fluttertoast.showToast(
              msg: 'Please Enter Your Calories',
              backgroundColor: Color(0xffffc400),
              textColor: Colors.black,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR
          );
        }
      });
      // 1 cal = 4 gram for protein and carbs
      //1 cal = 9 grams for fats
    }
    else if (widget.dietType == 'Moderate Carbs (50:30:20)') {
      setState(() {
        //calculate protein in cals
        double div = newCalories2 * .50;
        //protein in grams
        double div6 = div / 4 ;
        div1 = div6 ;

        //calculate carbs in cals
        double div2 = newCalories2 * .30 ;
        //calculate carbs in grams
        double div7 = div2 / 4 ;
        div3 = div7 ;

        //calculate fats in cals
        double div4 = newCalories2 * .20 ;
        //calculate carbs in grams
        double div8 = div4 / 9 ;
        div5 = div8 ;
      });

    }
    else if (widget.dietType == 'Zone Diet(40:30:30)') {
      setState(() {
        //calculate protein in cals
        double div = newCalories2 * .50;
        //protein in grams
        double div6 = div / 4 ;
        div1 = div6 ;

        //calculate carbs in cals
        double div2 = newCalories2 * .30 ;
        //calculate carbs in grams
        double div7 = div2 / 4 ;
        div3 = div7 ;

        //calculate fats in cals
        double div4 = newCalories2 * .20 ;
        //calculate carbs in grams
        double div8 = div4 / 9 ;
        div5 = div8 ;
      });

    }
    else if (widget.dietType == 'Low Carbs (25:35:40)') {
      setState(() {
        //calculate protein in cals
        double div = newCalories2 * .25;
        //protein in grams
        double div6 = div / 4;
        div1 = div6 ;

        //calculate carbs in cals
        double div2 = newCalories2 * .35;
        //calculate carbs in grams
        double div7 = div2 / 4;
        div3 = div7 ;

        //calculate fats in cals
        double div4 = newCalories2 * .40;
        //calculate carbs in grams
        double div8 = div4 / 9;
        div5 = div8 ;

      } ) ;
    }
    else {
      setState(() {
        //calculate protein in cals
        double div = newCalories2 * .5;
        //protein in grams
        double div6 = div / 4;
        div1 = div6 ;

        //calculate carbs in cals
        double div2 = newCalories2 * .35;
        //calculate carbs in grams
        double div7 = div2 / 4;
        div3 = div7 ;

        //calculate fats in cals
        double div4 = newCalories2 * .60;
        //calculate carbs in grams
        double div8 = div4 / 9;
        div5 = div8 ;
      } ) ;
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // String newCalories = widget.calories as String ;
    // var proteinCal = (widget.dietType == 'High Carbs (60:25:15)') as int ;
    // var proteinCal2 = widget.dietType == 'Moderate Carbs (50:30:20)' ;
    // var proteinCal3 = widget.dietType == 'Zone Diet(40:30:30)' ;
    // var proteinCal4 = widget.dietType == 'Low Carbs (25:35:40)' ;
    // var proteinCal5 = widget.dietType == 'Keto Diet (05:35:60)' ;
    // var proteinResult ;
    // var carbsCal = widget.dietType == 'High Carbs (60:25:15)' ;
    // var carbsCal2 = widget.dietType == 'Moderate Carbs (50:30:20)' ;
    // var carbsCal3 = widget.dietType == 'Zone Diet(40:30:30)' ;
    // var carbsCal4 = widget.dietType == 'Low Carbs (25:35:40)' ;
    // var carbsCal5 = widget.dietType == 'Keto Diet (05:35:60)' ;
    //
    // var fatsCal = widget.dietType == 'High Carbs (60:25:15)' ;
    // var fatsCal2 = widget.dietType == 'Moderate Carbs (50:30:20)' ;
    // var fatsCal3 = widget.dietType == 'Zone Diet(40:30:30)' ;
    // var fatsCal4 = widget.dietType == 'Low Carbs (25:35:40)' ;
    // var fatsCal5 = widget.dietType == 'Keto Diet (05:35:60)' ;
    String newCalories = widget.calories.text ;
    int newCalories2 = int.parse(newCalories) ;

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: Text('Macro Calculator',style: TextStyle(color: Color(0xffffc400)),),
        iconTheme: IconThemeData(color: Color(0xffffc400)),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 30),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15)
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,10,0,0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "For ${newCalories2} calories :-" ,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(fontWeight: FontWeight.w900,color: Color(0xffffc400)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,10,0,0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "You should split your macros accordingly :-" ,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                      SizedBox(height: 20,),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,10,0,0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Protein :-" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(fontWeight: FontWeight.w900,color: Colors.black,fontSize: 20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5,top: 12),
                            child: Text('$div3 gms'),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,10,0,0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Carbs :-" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(fontWeight: FontWeight.w900,color: Colors.black,fontSize: 20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15,top: 12),
                            child: Text('$div1 gms'),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,10,0,0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Fats :-" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(fontWeight: FontWeight.w900,color: Colors.black,fontSize: 20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5,top: 12),
                            child: Text('$div5 gms'),
                          )
                        ],
                      ),

                      SizedBox(height: 30,),
                    ],
                  ),
                ),
              ),
            ),
          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonTheme(
                height: MediaQuery.of(context).size.height * 0.076,
                minWidth: MediaQuery.of(context).size.width * 0.35,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                    ),
                        primary: Color(0xffffc400),
                        textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18)
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text('OK',style: TextStyle(color: Colors.black),),
                    )),
              ),
              ButtonTheme(
                height: MediaQuery.of(context).size.height * 0.076,
                minWidth: MediaQuery.of(context).size.width * 0.35,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),side: BorderSide.none
                     ),
                        primary: Colors.black,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18)
                    ),
                    onPressed: () {
                      Share.share(
                          'Following a ${widget.dietType} Diet\nMy Macros for $newCalories2 calories are as follows:-\n Protein :- ${div3}, Carbs :- ${div1}, Fats :- $div5 .');
                    },
                    child: Center(
                      child: Text('Share',style: TextStyle(color: Color(0xffffc400)),),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}

