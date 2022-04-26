import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider<DataInText>(
      create: (context) => DataInText(), child: MaterialApp(home: Start())));
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<DataInText>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Consumer<DataInText>(
            builder: (context, counter, child) =>
                Text("${counter.randomNumber}")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increaseNumber();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DataInText extends ChangeNotifier {
  int randomNumber = 0;
  increaseNumber() {
    randomNumber++;
    notifyListeners();
  }
}
