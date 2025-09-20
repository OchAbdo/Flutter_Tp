import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PageHomeC());
  }
}

class PageHomeC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageHomeCState();
}

class PageHomeCState extends State<PageHomeC> {
  TextEditingController mont = TextEditingController();
  double resultat = 0;
  String selectbtnR = "";

  void convertir() {
    setState(() {
      double montant = double.tryParse(mont.text) ?? 0;
      if (selectbtnR == "etd") {
        resultat = montant * 3.4; // Exemple de taux de conversion
      } else {
        resultat = montant / 3.4; // Exemple de taux de conversion
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tp1_App"),
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Padding(
              padding: EdgeInsetsGeometry.all(3),
              child: TextField(
                controller: mont,
                decoration: InputDecoration(labelText: "Montant"),
              ),
            ),
            SizedBox(height: 20),
            RadioListTile(
              title: Text("Dinar => Euro"),
              value: "dte",
              groupValue: selectbtnR,
              onChanged: (value) {
                setState(() {
                  selectbtnR = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text("Euro => Dinar"),
              value: "etd",
              groupValue: selectbtnR,
              onChanged: (value) {
                setState(() {
                  selectbtnR = value.toString();
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              "Le résultat est ${resultat.toStringAsFixed(3)}  dinars !",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertir,
              child: Text("CONVERTIR"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
