import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:puan_hesaplama/animations/fadeanimation.dart';
import 'package:puan_hesaplama/models/lessons.dart';
import 'package:puan_hesaplama/models/exam.dart';
import 'package:puan_hesaplama/pages/stats_page.dart';
import 'package:puan_hesaplama/services/appdrawer.dart';
import 'package:puan_hesaplama/services/database_helper.dart';
import 'package:puan_hesaplama/services/divider.dart';

class CalculationPage extends StatefulWidget {
  final List<Lesson> tytLesson;
  final List<Lesson> aytLesson;
  final bool isPassBefore;
  final int grade;

  CalculationPage(this.tytLesson, this.aytLesson, this.grade,
      this.isPassBefore);

  @override
  _CalculationPageState createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  DatabaseHelper databaseHelper;
  TextEditingController examName = TextEditingController();

  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF4A4A58),
        title: Center(
            child: Text(
              "Ayt -Tyt Puan Hesaplama",
              style: TextStyle(fontWeight: FontWeight.w900),
            )),
      ),
      body: Column(
        children: <Widget>[
          FadeAnimation(
            1.4,
            Card(
              margin:
              EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 36),
              color: Colors.pink[200],
              elevation: 20,
              child: FutureBuilder(
                future: calculateAytTyt(),
                builder: (context, result) {
                  if (result.hasData) {
                    return Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 8, top: 8),
                          child: CustomDivider(
                            dividerText: "TYT Paunları",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Ham Puan",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                          child: Text(
                                            result.data[1].toStringAsFixed(2),
                                            style: TextStyle(color: Colors.white),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Yerleşme Puanı",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                          child: Text(
                                            (result.data[1]+result.data[0]).toStringAsFixed(2),
                                            style: TextStyle(color: Colors.white),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 8, top: 8),
                          child: CustomDivider(
                            dividerText: "Ayt Paunları",
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              flex: 6,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 6,
                              child: Text(
                                "  Ham Puan",
                                style: TextStyle(color: Colors.black, fontSize: 12),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              flex: 6,
                              child: Text(
                                "Yerleşme Puanı",
                                style: TextStyle(color: Colors.black, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Expanded(
                                flex: 5,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Sayısal",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                      child: Text(
                                        result.data[2].toStringAsFixed(2),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                      child: Text(
                                        (result.data[2]+result.data[0]).toStringAsFixed(2),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Expanded(
                                flex: 5,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Sözel",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                      child: Text(
                                        result.data[3].toStringAsFixed(2),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                      child: Text(
                                        (result.data[3]+result.data[0]).toStringAsFixed(2),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Expanded(
                                flex: 5,
                                child: Text(
                                  "Eşit Ağırlık  ",
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                      child: Text(
                                        result.data[4].toStringAsFixed(2),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                      child: Text(
                                        (result.data[4]+result.data[0]).toStringAsFixed(2),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 8, right: 16, bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Expanded(
                                flex: 5,
                                child: Text(
                                  "Dil ",
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                      child: Text(
                                        result.data[5].toStringAsFixed(2),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                      child: Text(
                                        (result.data[5]+result.data[0]).toStringAsFixed(2),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }else if (result.hasError) {
                    return Center(
                      child: Text(result.error.toString()),
                    );
                  }
                  else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },

              ),
            ),),
          FadeAnimation(
            1.4,
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: ()  async {
                  var all = await calculateAytTyt();
                  String date = DateFormat.MMMMd().add_jm().format(new DateTime.now());
                  Exam exam=Exam(date,all[0],all[1],all[2],all[3],all[4],all[5]);
                  databaseHelper.addExam(exam);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StatsPage(),
                    ),
                  );
                  },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 50,
                  width: 120,
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Kaydet',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          )),
                      Icon(
                        Icons.save,
                        size: 25,
                      ),
                    ],
                  ),
                ),
                color: Colors.pink[300],
                textColor: Colors.white,
                elevation: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
  _add(Exam exam){
    databaseHelper.addExam(exam);
  }

  _print() async {
    var allS = await databaseHelper.getExams();
    debugPrint(allS.toString());
  }



  Future<List<double>> calculateAytTyt() async{
    List<Lesson> tytLesson = widget.tytLesson;
    List<Lesson> aytLesson = widget.aytLesson;
    int grade = widget.grade;
    bool isPassBefore = widget.isPassBefore;

    int trueQ = 0;
    int falseQ = 0;
    double average = 0;
    List<double> tytAverage = List<double>();
    List<double> tytPoints = List<double>();
    List<double> aytAverage = List<double>();
    List<double> aytPoints = List<double>();
    double points;
    double tytPoint =0;
    double tytAytPoint=0;
    double sayPoint = 0;
    double sozPoint = 0;
    double estPoint = 0;
    double dilPoint = 0;

    //tyt, ayt-tyt
    for (int i = 0; i < 4; i++) {
      trueQ = tytLesson[i].trueAnswers;
      falseQ = tytLesson[i].falseAnswers;
      if (falseQ != 0) {
        average = trueQ - (falseQ / 4);
      } else average = trueQ.toDouble();
      tytAverage.add(average);
    }

    points = tytAverage[0] * 1.32;
    tytPoints.add(points);
    points = tytAverage[1] * 1.32;
    tytPoints.add(points);
    points  = tytAverage[2] * 1.36;
    tytPoints.add(points);
    points  = tytAverage[3] * 1.36;
    tytPoints.add(points);
    points = tytAverage[0] * 3.3;
    tytPoints.add(points);
    points = tytAverage[1] * 3.4;
    tytPoints.add(points);
    points  = tytAverage[2] * 3.3;
    tytPoints.add(points);
    points  = tytAverage[3] * 3.4;
    tytPoints.add(points);

    for(int i=0;i<4;i++){
      tytAytPoint = tytAytPoint +tytPoints[i];
    }

    for(int i=4;i<8;i++){
      tytPoint = tytPoint +tytPoints[i];
    }

    tytPoint = tytPoint +100;

    double obp = (grade*6) / 10 ;

    if(isPassBefore){
      obp = obp/2;
    }

    //ayt puanları
    for (int i = 0; i < aytLesson.length; i++) {
      trueQ = aytLesson[i].trueAnswers;
      falseQ = aytLesson[i].falseAnswers;

      if (falseQ != 0) {
        average = trueQ - (falseQ / 4);
      } else average = trueQ.toDouble();
      aytAverage.add(average);
    }

    //sayısal
    points = aytAverage[0] * 3;
    aytPoints.add(points);
    points = aytAverage[1] * 2.85;
    aytPoints.add(points);
    points  = aytAverage[2] * 3.07;
    aytPoints.add(points);
    points  = aytAverage[3] * 3.07;
    aytPoints.add(points);

    //sozel
    points = aytAverage[4] * 3;
    aytPoints.add(points);
    points = aytAverage[5] * 2.7;
    aytPoints.add(points);
    points  = aytAverage[6] * 3.3;
    aytPoints.add(points);
    points  = aytAverage[7] * 2.7;
    aytPoints.add(points);
    points  = aytAverage[8] * 2.7;
    aytPoints.add(points);
    points  = aytAverage[9] * 3;
    aytPoints.add(points);
    points  = aytAverage[10] * 3.3;
    aytPoints.add(points);

    //eşit ağırlık
    points = aytAverage[0] * 3;
    aytPoints.add(points);
    points = aytAverage[4] * 3;
    aytPoints.add(points);
    points  = aytAverage[5] * 2.8;
    aytPoints.add(points);
    points  = aytAverage[6] * 3.33;
    aytPoints.add(points);
//    points  = aytAverage[8] * 2.91;
//    aytPoints.add(points);
//    points  = aytAverage[9] * 3;
//    aytPoints.add(points);
//    points  = aytAverage[10] * 3.3;
//    aytPoints.add(points);
     points = aytAverage[11] * 3;
     aytPoints.add(points);

    for(int i=0;i<4;i++){
      sayPoint = sayPoint +aytPoints[i];
    }
    sayPoint = tytAytPoint+sayPoint+100;

    for(int i=4;i<11;i++){
      sozPoint = sozPoint +aytPoints[i];
    }
    sozPoint = tytAytPoint+sozPoint+100;


    for(int i=11;i<15;i++){
      estPoint = estPoint +aytPoints[i];
    }
    estPoint = tytAytPoint+estPoint+100;


    dilPoint = tytAytPoint+aytPoints[15]+100;

    if(sayPoint>500){
      sayPoint = 500.0;
    }
    if(sozPoint>500){
      sozPoint = 500.0;
    }
    if(estPoint>500){
      estPoint = 500.0;
    }
    if(dilPoint>500){
      dilPoint = 500.0;
    }


    List<double> allPoints = List<double>();
    allPoints.add(obp);
    allPoints.add(tytPoint);
    allPoints.add(sayPoint);
    allPoints.add(sozPoint);
    allPoints.add(estPoint);
    allPoints.add(dilPoint);

    return allPoints;
  }
}
