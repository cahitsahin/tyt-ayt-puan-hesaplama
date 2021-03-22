import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puan_hesaplama/animations/fadeanimation.dart';
import 'package:puan_hesaplama/models/lessons.dart';
import 'package:puan_hesaplama/pages/result_page.dart';
import 'package:puan_hesaplama/services/divider.dart';

class AytPage extends StatefulWidget {
  final List<Lesson> tytLesson;
  final bool isPassBefore;
  final int grade;

  AytPage(this.tytLesson, this.isPassBefore, this.grade);

  @override
  _TytPageState createState() => _TytPageState();
}

class _TytPageState extends State<AytPage> {
  List<Lesson> aytLessons;
  TextEditingController matTrue,
      matFalse,
      fizTrue,
      fizFalse,
      kimTrue,
      kimFalse,
      biyTrue,
      biyFalse,
      edeTrue,
      edeFalse,
      tar1True,
      tar1False,
      cog1True,
      cog1False,
      tar2True,
      tar2False,
      cog2True,
      cog2False,
      felTrue,
      felFalse,
      dinTrue,
      dinFalse,
      dilTrue,
      dilFalse;

  @override
  void initState() {
    super.initState();
    matTrue = TextEditingController();
    matFalse = TextEditingController();
    fizTrue = TextEditingController();
    fizFalse = TextEditingController();
    kimTrue = TextEditingController();
    kimFalse = TextEditingController();
    biyFalse = TextEditingController();
    biyTrue = TextEditingController();
    edeFalse = TextEditingController();
    edeTrue = TextEditingController();
    tar1False = TextEditingController();
    tar1True = TextEditingController();
    cog1False = TextEditingController();
    cog1True = TextEditingController();
    tar2False = TextEditingController();
    tar2True = TextEditingController();
    cog2False = TextEditingController();
    cog2True = TextEditingController();
    felTrue = TextEditingController();
    felFalse = TextEditingController();
    dinTrue = TextEditingController();
    dinFalse = TextEditingController();
    dilTrue = TextEditingController();
    dilFalse = TextEditingController();
    aytLessons = [];
    setState(() {
      aytLessons.add(Lesson("Matematik", 40, 0, 0, matTrue, matFalse));
      aytLessons.add(Lesson("Fizik", 14, 0, 0, fizTrue, fizFalse));
      aytLessons.add(Lesson("Kimya", 13, 0, 0, kimTrue, kimFalse));
      aytLessons.add(Lesson("Biyoloji", 13, 0, 0, biyTrue, biyFalse));
      aytLessons.add(Lesson("Edebiyat", 24, 0, 0, edeTrue, edeFalse));
      aytLessons.add(Lesson("Tarih 1", 10, 0, 0, tar1True, tar1False));
      aytLessons.add(Lesson("Coğrafya 1", 6, 0, 0, cog1True, cog1False));
      aytLessons.add(Lesson("Tarih 2", 13, 0, 0, tar2True, tar2False));
      aytLessons.add(Lesson("Coğrafya 2", 11, 0, 0, cog2True, cog2False));
      aytLessons.add(Lesson("Felsefe", 12, 0, 0, felTrue, felFalse));
      aytLessons.add(Lesson("Din", 6, 0, 0, dinTrue, dinFalse));
      aytLessons.add(Lesson("Dil", 80, 0, 0, dilTrue, dilFalse));
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    List<Lesson> tytLesson = widget.tytLesson;
    bool isPassBefore = widget.isPassBefore;
    int grade = widget.grade;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4A4A58),
        title: Text(
          "Ayt -Tyt Puan Hesaplama",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goCalculation();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CalculationPage(tytLesson, aytLessons, grade, isPassBefore),
            ),
          );
        },
        child: Icon(
          Icons.calculate_sharp,
          color: Color(0xFF4A4A58),
        ),
        backgroundColor: Colors.amber,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF4A4A58),
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                for (int i = 0; i < aytLessons.length; i++) {
                  aytLessons[i].trueControl.text = "";
                  aytLessons[i].falseControl.text = "";
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.delete_sweep,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: FadeAnimation(
        1.4,
        Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                height: screenHeight * 2,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 32, right: 16, top: 0),
                      child: CustomDivider(
                        dividerText: "AYT",
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: aytLessons.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 24, left: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(bottom: 8, top: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          aytLessons[index].name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 16.0),
                                        ),
                                        Text(
                                          " (" +
                                              aytLessons[index]
                                                  .numOfQuestion
                                                  .toString() +
                                              ")",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(bottom: 8, top: 20),
                                      child: TextField(
                                        onChanged: (input) {
                                          int max =
                                              aytLessons[index].numOfQuestion;
                                          if (aytLessons[index]
                                                  .falseControl
                                                  .text !=
                                              "") {
                                            debugPrint(aytLessons[index]
                                                .falseControl
                                                .text);
                                            int falseQ = int.parse(
                                                aytLessons[index]
                                                    .falseControl
                                                    .text);
                                            max = aytLessons[index]
                                                    .numOfQuestion -
                                                falseQ;
                                          }

                                          if (int.parse(input) > max) {
                                            aytLessons[index].trueControl.text =
                                                "$max";
                                          }
                                        },
                                        controller:
                                            aytLessons[index].trueControl,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.teal)),
                                            labelText: 'Doğru',
                                            suffixStyle:
                                                TextStyle(color: Colors.green)),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(bottom: 8, top: 20),
                                    child: TextField(
                                      onChanged: (input) {
                                        int max =
                                            aytLessons[index].numOfQuestion;
                                        if (aytLessons[index]
                                                .trueControl
                                                .text !=
                                            "") {
                                          int trueQ = int.parse(
                                              aytLessons[index]
                                                  .trueControl
                                                  .text);
                                          max =
                                              aytLessons[index].numOfQuestion -
                                                  trueQ;
                                        }
                                        if (int.parse(input) > max) {
                                          aytLessons[index].falseControl.text =
                                              "$max";
                                        }
                                      },
                                      controller:
                                          aytLessons[index].falseControl,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontSize: 16),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.teal)),
                                          labelText: 'Yanlış',
                                          suffixStyle:
                                              TextStyle(color: Colors.green)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
//            Align(
//              alignment: Alignment.bottomCenter,
//              child: Padding(
//                padding:
//                    EdgeInsets.only(left: 24, right: 16, bottom: 5, top: 5),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: <Widget>[
//                    Expanded(
//                      child: RaisedButton(
//                        onPressed: () {
//                          for (int i = 0; i < aytLessons.length; i++) {
//                            aytLessons[i].trueControl.text = "";
//                            aytLessons[i].falseControl.text = "";
//                          }
//                        },
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(20)),
//                        elevation: 20,
//                        child: Container(
//                          height: 50,
//                          padding: EdgeInsets.only(bottom: 5),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                            children: <Widget>[
//                              Text('Temizle!',
//                                  style: TextStyle(
//                                      fontSize: 20,
//                                      fontWeight: FontWeight.w700,
//                                      color: Colors.pink[300])),
//                              Icon(
//                                Icons.delete,
//                                color: Colors.pink[300],
//                                size: 25,
//                              ),
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//                    SizedBox(
//                      width: 20,
//                    ),
//                    Expanded(
//                      child: RaisedButton(
//                        onPressed: () {
//                          for(int i=0;i<aytLessons.length;i++){
//                            if (aytLessons[i]
//                                .trueControl
//                                .text != "") {
//                              aytLessons[i].trueAnswers =
//                                  int.parse(aytLessons[i]
//                                      .trueControl
//                                      .text);
//                            }
//                            if (aytLessons[i]
//                                .falseControl
//                                .text != "") {
//                              aytLessons[i].falseAnswers =
//                                  int.parse(aytLessons[i]
//                                      .falseControl
//                                      .text);
//                            }
//                          }
//
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                              builder: (context) => CalculationPage(
//                                  tytLesson, aytLessons, grade, isPassBefore),
//                            ),
//                          );
//                        },
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(20)),
//                        child: Container(
//                          height: 50,
//                          padding: EdgeInsets.only(bottom: 5),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                            children: <Widget>[
//                              Text('Hesapla',
//                                  style: TextStyle(
//                                    fontSize: 20,
//                                    fontWeight: FontWeight.w700,
//                                  )),
//                              Icon(
//                                Icons.cached,
//                                size: 25,
//                              ),
//                            ],
//                          ),
//                        ),
//                        color: Colors.pink[300],
//                        textColor: Colors.white,
//                        elevation: 20,
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
          ],
        ),
      ),
    );
  }

  void goCalculation() {
    for (int i = 0; i < aytLessons.length; i++) {
      if (aytLessons[i].trueControl.text != "") {
        aytLessons[i].trueAnswers = int.parse(aytLessons[i].trueControl.text);
      }
      if (aytLessons[i].falseControl.text != "") {
        aytLessons[i].falseAnswers = int.parse(aytLessons[i].falseControl.text);
      }
    }
  }
}
