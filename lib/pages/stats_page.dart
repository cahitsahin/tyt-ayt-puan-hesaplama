import 'package:flutter/material.dart';
import 'package:puan_hesaplama/models/exam.dart';
import 'package:puan_hesaplama/services/appdrawer.dart';
import 'package:puan_hesaplama/services/database_helper.dart';
import 'package:puan_hesaplama/services/divider.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  DatabaseHelper databaseHelper;
  List<Exam> allExam;
  List<Color> allColor;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allColor = List<Color>();
    allColor.add(Colors.red[200]);
    allColor.add(Colors.orange[200]);
    allColor.add(Colors.blueAccent[100]);

    allExam = List<Exam>();
    databaseHelper = DatabaseHelper();
    databaseHelper.getExams().then((onValue) {
      for (Map map in onValue) {
        allExam.add(Exam.fromMap(map));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF4A4A58),
        title: Center(
            child: Text(
          "Sınav Sonuçlarım",
          style: TextStyle(fontWeight: FontWeight.w900),
        )),
      ),
      body: Container(
        height: height,
        child: PageView.builder(
          itemCount: allExam.length,
          controller: PageController(viewportFraction: 0.8),
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          itemBuilder: (context, index) {
            return Card(
                margin:
                    EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 36),
                color: allColor[index % 3],
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
                                    allExam[index].tyt.toStringAsFixed(2),
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
                                    (allExam[index].tyt + allExam[index].obp)
                                        .toStringAsFixed(2),
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
                                allExam[index].say.toStringAsFixed(2),
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
                                (allExam[index].say + allExam[index].obp)
                                    .toStringAsFixed(2),
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
                                allExam[index].soz.toStringAsFixed(2),
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
                                (allExam[index].soz + allExam[index].obp)
                                    .toStringAsFixed(2),
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
                                allExam[index].est.toStringAsFixed(2),
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
                                (allExam[index].est + allExam[index].obp)
                                    .toStringAsFixed(2),
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
                                allExam[index].dil.toStringAsFixed(2),
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
                                  (allExam[index].dil + allExam[index].obp)
                                      .toStringAsFixed(2),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Text(
                              allExam[index].name,
                              style:
                              TextStyle(color: Colors.white70, fontSize: 16,fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
