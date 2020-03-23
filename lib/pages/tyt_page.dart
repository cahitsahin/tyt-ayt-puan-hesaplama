import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puan_hesaplama/animations/fadeanimation.dart';
import 'package:puan_hesaplama/models/lessons.dart';
import 'package:puan_hesaplama/pages/ayt_page.dart';
import 'package:puan_hesaplama/services/appdrawer.dart';
import 'package:puan_hesaplama/services/divider.dart';
import 'package:puan_hesaplama/pages/tyt_page.dart';

class TytPage extends StatefulWidget {
  @override
  _TytPageState createState() => _TytPageState();
}

class _TytPageState extends State<TytPage> {
  List<Lesson> lessons;
  TextEditingController turTrue;
  TextEditingController turFalse;
  TextEditingController matTrue;
  TextEditingController matFalse;
  TextEditingController fenTrue;
  TextEditingController fenFalse;
  TextEditingController sosTrue;
  TextEditingController sosFalse;
  int grade;

  bool isPassBefore = false;

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    turTrue = TextEditingController();
    turFalse = TextEditingController();
    matTrue = TextEditingController();
    matFalse = TextEditingController();
    fenTrue = TextEditingController();
    fenFalse = TextEditingController();
    sosTrue = TextEditingController();
    sosFalse = TextEditingController();
    lessons = [];
    setState(() {
      lessons.add(Lesson("Türkçe", 40, 0, 0, turTrue, turFalse));
      lessons.add(Lesson("Sosyal", 20, 0, 0, sosTrue, sosFalse));
      lessons.add(Lesson("Matematik", 40, 0, 0, matTrue, matFalse));
      lessons.add(Lesson("Fen", 20, 0, 0, fenTrue, fenFalse));
    });
  }

  final certGrade = TextEditingController();

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
          Padding(
            padding:
                const EdgeInsets.only(left: 48, right: 16, top: 16, bottom: 0),
            child: FadeAnimation(1.4,TextField(
              controller: certGrade,
              keyboardType: TextInputType.number,
              onChanged: (input){
                if(int.parse(input)>100){
                  certGrade.text = "100";
                }
                grade = int.parse(certGrade.text);
              },
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  labelText: 'Diploma Notu',
                  prefixIcon: const Icon(
                    Icons.library_books,
                  ),
                  suffixStyle: const TextStyle(color: Colors.green)),
            )),
          ),
          FadeAnimation(1.4,Row(
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
          )),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: FadeAnimation(1.4,CustomDivider(
              dividerText: "TYT",
            )),
          ),
          Expanded(
            child: Form(
              key: formKey,
              child: ListView.builder(
                itemCount: lessons.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 24, left: 24),
                    child: FadeAnimation(1.4,Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8, top: 20),
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
                                      lessons[index].numOfQuestion.toString() +
                                      ")",
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.grey),
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
                              padding: EdgeInsets.only(bottom: 8, top: 20),
                              child: TextFormField(
                                onChanged: (input) {
                                  int max = lessons[index].numOfQuestion;
                                  if (lessons[index].falseControl.text != "") {
                                    debugPrint(
                                        lessons[index].falseControl.text);
                                    int falseQ = int.parse(
                                        lessons[index].falseControl.text);
                                    max = lessons[index].numOfQuestion - falseQ;
                                    debugPrint("$max");
                                  }

                                  if (int.parse(input) > max) {
                                    lessons[index].trueControl.text = "$max";
                                  }
                                },
                                controller: lessons[index].trueControl,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.teal)),
                                    labelText: 'Doğru',
                                    suffixStyle:
                                        TextStyle(color: Colors.green)),
                                onSaved: (input) {
                                  if (input != "") {
                                    lessons[index].trueAnswers = int.parse(
                                        lessons[index].trueControl.text);
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8, top: 20),
                            child: TextFormField(
                              onChanged: (input) {
                                int max = lessons[index].numOfQuestion;
                                if (lessons[index].trueControl.text != "") {
                                  int trueQ = int.parse(
                                      lessons[index].trueControl.text);
                                  max = lessons[index].numOfQuestion - trueQ;
                                }
                                if (int.parse(input) > max) {
                                  lessons[index].falseControl.text = "$max";
                                }
                              },
                              controller: lessons[index].falseControl,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 16),
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.teal)),
                                  labelText: 'Yanlış',
                                  suffixStyle: TextStyle(color: Colors.green)),
                              onSaved: (input) {
                                if (input != "") {
                                  lessons[index].falseAnswers = int.parse(
                                      lessons[index].falseControl.text);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 24, right: 16,bottom: 5,top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(

                      onPressed: () {
                        for (int i = 0; i < lessons.length; i++) {
                          lessons[i].trueControl.text = "";
                          lessons[i].falseControl.text = "";
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      elevation: 20,
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('Temizle!', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.pink[300])),
                            Icon(
                              Icons.delete,
                              color: Colors.pink[300],
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        formKey.currentState.save();
                        if(grade == null){
                          grade = 0;
                        }


                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AytPage(lessons,isPassBefore,grade),
                          ),
                        );
                        debugPrint("$grade");
                        debugPrint("$isPassBefore");
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('AYT', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,)),
                            Icon(
                              Icons.forward,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
