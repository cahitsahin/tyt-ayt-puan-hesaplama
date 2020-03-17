import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puan_hesaplama/animations/fadeanimation.dart';
import 'package:puan_hesaplama/models/lessons.dart';
import 'package:puan_hesaplama/services/appdrawer.dart';
import 'package:puan_hesaplama/services/divider.dart';

class CalculationPage extends StatefulWidget {
  final List<Lesson> tytLesson;
  final List<Lesson> aytLesson;
  final bool isPassBefore;
  final int grade;

  CalculationPage(
      this.tytLesson, this.aytLesson, this.grade, this.isPassBefore);

  @override
  _CalculationPageState createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  String text = "250.12";
  double tytHam;
  double tytYer;
  double sayHam;
  double sayYer;
  double sozHam;
  double sozYer;
  double estHam;
  double estYer;
  double aytTyt;

  double OBP;

  @override
  Widget build(BuildContext context) {
    List<Lesson> tytLesson = widget.tytLesson;
    List<Lesson> aytLesson = widget.aytLesson;
    bool isPassBefore = widget.isPassBefore;
    int grade = widget.grade;
    OBP = calculateOBP(grade,isPassBefore);
    tytHam = calculateAverage(tytLesson)+100;
    tytYer = tytHam+OBP;
    aytTyt = calculateAytTyt(tytLesson);
    sayHam= calculateSay(aytLesson)+aytTyt+132.2;
    sayYer = sayHam+OBP;
    sozHam= calculateSoz(aytLesson)+aytTyt+132;
    sozYer = sozHam+OBP;
    estHam= calculateEst(aytLesson)+aytTyt+132;
    estYer = estHam+OBP;

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
                child: Column(
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
                                    tytHam.toString(),
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
                                    tytYer.toString(),
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
                                sayHam.toString(),
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
                                sayYer.toString(),
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
                                sozHam.toString(),
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
                                sozYer.toString(),
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
                                estHam.toString(),
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
                                estYer.toString(),
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
                                text,
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
                                text,
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          FadeAnimation(
            1.4,
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () {},
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

   double calculateAverage(List<Lesson> tytLesson) {
    int trueQ = 0;
    int falseQ = 0;
    double average = 0;
    List<double> tytAverage = List<double>();
    List<double> tytPoints = List<double>();
    double points;
    double finalPoint =0;

    for (int i = 0; i < tytLesson.length; i++) {
      trueQ = tytLesson[i].trueAnswers;
      falseQ = tytLesson[i].falseAnswers;

      if (falseQ != 0) {
        average = trueQ - (falseQ / 4);
      } else average = trueQ.toDouble();
      tytAverage.add(average);
    }

    points = tytAverage[0] * 3.3;
    tytPoints.add(points);
    points = tytAverage[1] * 3.4;
    tytPoints.add(points);
    points  = tytAverage[2] * 3.3;
    tytPoints.add(points);
    points  = tytAverage[3] * 3.4;
    tytPoints.add(points);

    for(int i=0;i<4;i++){
      finalPoint = finalPoint +tytPoints[i];
    }

    return finalPoint;
  }

  double calculateOBP(int grade, bool isPassBefore) {
    double obp = (grade*6) / 10 ;

    if(isPassBefore){
      obp = obp/2;
    }

    return obp;
  }

  double calculateSay(List<Lesson> aytLesson) {

    int trueQ = 0;
    int falseQ = 0;
    double average = 0;
    double points;
    double finalPoint =0;
    List<double> aytAverage = List<double>();
    List<double> aytPoints = List<double>();

    for (int i = 0; i < 4; i++) {
      trueQ = aytLesson[i].trueAnswers;
      falseQ = aytLesson[i].falseAnswers;

      if (falseQ != 0) {
        average = trueQ - (falseQ / 4);
      } else average = trueQ.toDouble();
      aytAverage.add(average);
    }

    points = aytAverage[0] * 3;
    aytPoints.add(points);
    points = aytAverage[1] * 2.85;
    aytPoints.add(points);
    points  = aytAverage[2] * 3.07;
    aytPoints.add(points);
    points  = aytAverage[3] * 3.07;
    aytPoints.add(points);

    for(int i=0;i<4;i++){
      finalPoint = finalPoint +aytPoints[i];
    }


    return finalPoint;

  }

  calculateSoz(List<Lesson> aytLesson) {
    int trueQ = 0;
    int falseQ = 0;
    double average = 0;
    double points;
    double finalPoint =0;
    List<double> aytAverage = List<double>();
    List<double> aytPoints = List<double>();


    for (int i = 0; i < aytLesson.length; i++) {
      trueQ = aytLesson[i].trueAnswers;
      falseQ = aytLesson[i].falseAnswers;

      if (falseQ != 0) {
        average = trueQ - (falseQ / 4);
      } else average = trueQ.toDouble();
      aytAverage.add(average);
    }

    points = aytAverage[4] * 3;
    aytPoints.add(points);
    points = aytAverage[5] * 2.8;
    aytPoints.add(points);
    points  = aytAverage[6] * 3.33;
    aytPoints.add(points);
    points  = aytAverage[7] * 2.91;
    aytPoints.add(points);
    points  = aytAverage[8] * 2.91;
    aytPoints.add(points);
    points  = aytAverage[9] * 3;
    aytPoints.add(points);
    points  = aytAverage[10] * 3.3;
    aytPoints.add(points);

    for(int i=0;i<4;i++){
      finalPoint = finalPoint +aytPoints[i];
    }


    return finalPoint;
  }

  calculateEst(List<Lesson> aytLesson) {

    int trueQ = 0;
    int falseQ = 0;
    double average = 0;
    double points;
    double finalPoint =0;
    List<double> aytAverage = List<double>();
    List<double> aytPoints = List<double>();


    for (int i = 0; i < aytLesson.length; i++) {
      trueQ = aytLesson[i].trueAnswers;
      falseQ = aytLesson[i].falseAnswers;

      if (falseQ != 0) {
        average = trueQ - (falseQ / 4);
      } else average = trueQ.toDouble();
      aytAverage.add(average);
    }

    points = aytAverage[0] * 3;
    aytPoints.add(points);
    points = aytAverage[4] * 3;
    aytPoints.add(points);
    points  = aytAverage[5] * 2.8;
    aytPoints.add(points);
    points  = aytAverage[6] * 3.33;
    aytPoints.add(points);
    points  = aytAverage[8] * 2.91;
    aytPoints.add(points);
    points  = aytAverage[9] * 3;
    aytPoints.add(points);
    points  = aytAverage[10] * 3.3;
    aytPoints.add(points);

    for(int i=0;i<4;i++){
      finalPoint = finalPoint +aytPoints[i];
    }


    return finalPoint;
  }

  double calculateAytTyt(List<Lesson> tytLesson) {

    int trueQ = 0;
    int falseQ = 0;
    double average = 0;
    List<double> tytAverage = List<double>();
    List<double> tytPoints = List<double>();
    double points;
    double finalPoint =0;

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

    for(int i=0;i<4;i++){
      finalPoint = finalPoint +tytPoints[i];
    }

    return finalPoint;

  }
}
