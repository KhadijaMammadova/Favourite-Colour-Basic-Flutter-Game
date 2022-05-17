import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'KHADIJA\'S SILLY LITTLE GAME'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Map<String, Color> colors = {
    'purple': Colors.purple,
    'blue': Colors.blue,
    'yellow': Colors.yellow,
    'pink': Colors.pink,
    'teal': Colors.teal,
    'orange': Colors.orange,
  };

  Color? selectedColor;

  /*@override
  void initState() {
    _getStoredColor();
    super.initState();
  }

  void _getStoredColor() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? colorName = preferences.getString('color');
    setState(() {
      selectedColor = colors[colorName];
    });
  }*/

  void _setColor(String colorName, Color color) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('color', colorName);
    setState(() {
      selectedColor = color;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: selectedColor ?? Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var entry in colors.entries)
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.topRight,
                  primary: entry.value,
                  minimumSize: Size(300, 60),
                ),
                  child: Text('(ツ)'),
                  onPressed: () => _setColor(entry.key, entry.value),
                ),
              ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
