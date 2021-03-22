import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puan_hesaplama/animations/fadeanimation.dart';
import 'package:puan_hesaplama/models/lessons.dart';
import 'package:puan_hesaplama/pages/ayt_page.dart';
import 'package:puan_hesaplama/services/appdrawer.dart';
import 'package:puan_hesaplama/services/divider.dart';

class TytPage extends StatefulWidget {
  @override
  _TytPageState createState() => _TytPageState();
}

class _TytPageState extends State<TytPage> {
  List<Lesson> lessons;
  TextEditingController certGrade = TextEditingController();
  TextEditingController turTrue = TextEditingController();
  TextEditingController turFalse = TextEditingController();
  TextEditingController matTrue = TextEditingController();
  TextEditingController matFalse = TextEditingController();
  TextEditingController fenTrue = TextEditingController();
  TextEditingController fenFalse = TextEditingController();
  TextEditingController sosTrue = TextEditingController();
  TextEditingController sosFalse = TextEditingController();
  int grade;
  bool isPassBefore = false;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    lessons = [];
    lessons.add(Lesson("Türkçe", 40, 0, 0, turTrue, turFalse));
    lessons.add(Lesson("Sosyal", 20, 0, 0, sosTrue, sosFalse));
    lessons.add(Lesson("Matematik", 40, 0, 0, matTrue, matFalse));
    lessons.add(Lesson("Fen", 20, 0, 0, fenTrue, fenFalse));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: goAyt,
        child: Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFF4A4A58),
        ),
        backgroundColor: Colors.amber,

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      appBar: AppBar(
        backgroundColor: Color(0xFF4A4A58),
        title: Text(
          "Ayt -Tyt Puan Hesaplama",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF4A4A58),
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                for (int i = 0; i < lessons.length; i++) {
                  lessons[i].trueControl.text = "";
                  lessons[i].falseControl.text = "";
                }
                certGrade.text = "";
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor:Colors.white,
                    child: Icon(Icons.delete_sweep,color: Colors.black,),
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
                height: screenHeight * 5 / 6,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 48, right: 16, top: 16, bottom: 0),
                      child: TextField(
                        controller: certGrade,
                        keyboardType: TextInputType.number,
                        onChanged: (input) {
                          if (int.parse(input) > 100) {
                            certGrade.text = "100";
                          }
                          grade = int.parse(certGrade.text);
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)),
                            labelText: 'Diploma Notu',
                            prefixIcon: const Icon(
                              Icons.library_books,
                            ),
                            suffixStyle: const TextStyle(color: Colors.green)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text("Daha önce üniversiteye yerleştim"),
                        Checkbox(
                          onChanged: (value) {
                            setState(() {
                              isPassBefore = value;
                            });
                          },
                          value: isPassBefore,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: CustomDivider(
                        dividerText: "TYT",
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: lessons.length,
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
                                          lessons[index].name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 16.0),
                                        ),
                                        Text(
                                          " (" +
                                              lessons[index]
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
                                              lessons[index].numOfQuestion;
                                          if (lessons[index]
                                              .falseControl
                                              .text !=
                                              "") {
                                            debugPrint(lessons[index]
                                                .falseControl
                                                .text);
                                            int falseQ = int.parse(
                                                lessons[index]
                                                    .falseControl
                                                    .text);
                                            max = lessons[index].numOfQuestion -
                                                falseQ;
                                          }
                                          if (int.parse(input) > max) {
                                            lessons[index].trueControl.text =
                                            "$max";
                                          }
                                        },
                                        controller: lessons[index].trueControl,
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
                                        int max = lessons[index].numOfQuestion;
                                        if (lessons[index].trueControl.text !=
                                            "") {
                                          int trueQ = int.parse(
                                              lessons[index].trueControl.text);
                                          max = lessons[index].numOfQuestion -
                                              trueQ;
                                        }
                                        if (int.parse(input) > max) {
                                          lessons[index].falseControl.text =
                                              max.toString();
                                        }
                                      },
                                      controller: lessons[index].falseControl,
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
//                          for (int i = 0; i < lessons.length; i++) {
//                            lessons[i].trueControl.text = "";
//                            lessons[i].falseControl.text = "";
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
//                                    fontSize: 20,
//                                    fontWeight: FontWeight.w700,
//                                  )),
//                              Icon(
//                                Icons.delete,
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
//
//                        },
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(20)),
//                        child: Container(
//                          height: 50,
//                          padding: EdgeInsets.only(bottom: 5),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                            children: <Widget>[
//                              Text('AYT',
//                                  style: TextStyle(
//                                    fontSize: 20,
//                                    fontWeight: FontWeight.w700,
//                                  )),
//                              Icon(
//                                Icons.forward,
//                                size: 25,
//                              ),
//                            ],
//                          ),
//                        ),
//                        color: Color(0xFF4A4A58),
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

  void goAyt(){
    if (grade == null) {
      grade = 0;
    }
    for (int i = 0; i < lessons.length; i++) {
      if (lessons[i].trueControl.text != "") {
        lessons[i].trueAnswers =
            int.parse(lessons[i].trueControl.text);
      }
      if (lessons[i].falseControl.text != "") {
        lessons[i].falseAnswers =
            int.parse(lessons[i].falseControl.text);
      }
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AytPage(lessons, isPassBefore, grade),
      ),
    );

  }

}
