import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PageHomeConvertisseur());
  }
}

class PageHomeConvertisseur extends StatefulWidget {
  PageHomeConvertisseurState createState() => PageHomeConvertisseurState();
}

class PageHomeConvertisseurState extends State<PageHomeConvertisseur> {
  TextEditingController task = TextEditingController();
  List<String> listTask = [];

  void addtask() {
    setState(() {
      listTask.add(task.text);
    });
  }

  void deletefrom(int x) {
    setState(() {
      listTask.removeAt(x);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("toDo-List"), backgroundColor: Colors.green),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: TextField(
                controller: task,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter a task",
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listTask.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(listTask[i]),
                    onLongPress: () => deletefrom(i),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addtask,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
