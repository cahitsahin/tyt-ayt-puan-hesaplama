import 'package:flutter/material.dart';
import 'package:puan_hesaplama/pages/ayt_page.dart';
import 'package:puan_hesaplama/pages/stats_page.dart';
import 'package:puan_hesaplama/pages/tyt_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: Container(
        color: Color(0xFF4A4A58),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            _createDrawerItem(
              icon: Icons.sort,
              text: 'Puan Hesapla',
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TytPage(),
                  ),
                );
              }
            ),
            _createDrawerItem(
              icon: Icons.star,
              text: 'Puanlarım',
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StatsPage(
                    ),
                  ),
                );
              }
            ),
            _createDrawerItem(
              icon: Icons.sentiment_very_satisfied,
              text: 'Oy Ver',
            ),
            _createDrawerItem(icon: Icons.get_app, text: 'Uygulamalarımız'),
          ],
        ),
      ),
    );
  }

  Widget _createHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 94,bottom: 12),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "Ayt-Tyt",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800),
            ),
            subtitle: Text(
              "Puan Hesaplama",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.pink[400],
              child: Icon(
                Icons.perm_identity,
                color: Colors.white,
                size: 35,
              ),
              radius: 40,
            ),
          ),
          Divider(
            height: 64,
            thickness: 0.5,
            color: Colors.white.withOpacity(0.3),
            indent: 32,
            endIndent: 32,
          )
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 35,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 24, color: Colors.grey[200]),
            )
          ],
        ),
      ),
    );
  }

}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const MenuItem({Key key, this.icon, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.pink,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 26, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
