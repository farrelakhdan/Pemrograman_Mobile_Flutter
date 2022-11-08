import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  final inputController = TextEditingController();
  String _newValue = "Kelvin";
  double _result = 0;
  var listItem = ["Kelvin", "Reamur"];
  List<String> listViewItem = <String>[];

  //rumus
  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin")
        _result = _inputUser + 273;
      else
        _result = (4 / 5) * _inputUser;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                controller: inputController,
                decoration: InputDecoration(
                  hintText: "Masukkan Suhu Dalam Celcius",
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
                    return "Hanya memasukkan angka";
                  } else {
                    return null;
                  }
                },
              ),
              Container(
                child: Column(
                  children: [
                    DropdownButton<String>(
                      items: listItem.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _newValue,
                      onChanged: (changeValue) {
                        setState(() {
                          _newValue = changeValue!;
                        });
                      },
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        const Text("Suhu Dalam Reamor"),
                        Text(
                          '$_result',
                          style: TextStyle(fontSize: 40),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                height: 30,
                margin: EdgeInsets.all(10),
                color: Colors.blue,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: perhitunganSuhu,
                      child: const Text(
                        "Konversi Suhu",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {
  const Result({
    required Key key,
    required this.result,
  }) : super(key: key);

  final double result;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hasil",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            result.toStringAsFixed(1),
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
    // );
  }
}
