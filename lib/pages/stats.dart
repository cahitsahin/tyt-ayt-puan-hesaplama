import 'package:flutter/material.dart';
import 'package:puan_hesaplama/services/appdrawer.dart';


class StatsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
          drawer: AppDrawer(),
          appBar: AppBar(
            backgroundColor: Color(0xFF4A4A58),
            title: Center(
                child: Text(
                  "Puanlarım",
                  style: TextStyle(fontWeight: FontWeight.w900),
                )),
          ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Puanlar",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}