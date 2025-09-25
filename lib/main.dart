import 'package:flutter/material.dart';
import 'package:fluttertp/Provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => ProviderTest(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PageHomeConvertisseur());
  }
}

class PageHomeConvertisseur extends StatelessWidget {
  TextEditingController task = TextEditingController();
  final p = ProviderTest();
  /* List<String> listTask = [];

  void addtask() {
    setState(() {
      listTask.add(task.text);
    });
  }

  void deletefrom(int x) {
    setState(() {
      listTask.removeAt(x);
    });
  } */

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
                itemCount: context.watch<ProviderTest>().getList.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(context.watch<ProviderTest>().getList[i]),
                    onLongPress: () =>
                        context.read<ProviderTest>().deletefrom(i),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ProviderTest>().addtask(task.text),
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
