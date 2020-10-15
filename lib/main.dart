import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
          primaryColor: Color(0xFFC41A3B),
          primaryColorLight: Color(0xFFFBE0E6),
          accentColor: Color(0xFF1B1F32)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Date n Time Picker';
  TimeOfDay _time;

  @override
  void initState() {
    super.initState();
    _time = TimeOfDay.now();
  }

  DateTime _date = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
        context: context,
        initialDate: _date, // current date
        firstDate: DateTime(1947), //first date
        lastDate: DateTime(2030), // last date
        textDirection:
            TextDirection.ltr, // header text or button direction ltr or rtl
        initialDatePickerMode: DatePickerMode.day, // day or year mode

        // button color change and picked color changed
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
              primaryColor: Color(0xFFC41A3B),
              accentColor: Color(0xFFC41A3B),
            ),
            child: child,
          );
        });

    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
        print(
          _date.toString(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(top: 15.0),
                ),
                new TextFormField(
                  cursorColor: Color(0xFFC41A3B),
                  readOnly: true,
                  onTap: () {
                    setState(() {
                      _selectDate(context);
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Tanggal mulai',
                    labelStyle: TextStyle(fontSize: 16.0),
                    hintText: (_date.toString()),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFC41A3B), width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 15.0),
                ),
                new ListTile(
                  title: Text('Time : ${_time.hour}:${_time.minute}'),
                  trailing: Icon(Icons.timer),
                  onTap: _pickTime,
                ),
              ],
            )),

        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     RaisedButton(
        //       onPressed: () {
        //         setState(() {
        //           _selectDate(context);
        //         });
        //       },
        //       color: Color(0xFFC41A3B),
        //       child: Text(
        //         'Data Picker',
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     ),
        //     Text(_date.toString()),
        //   ],
        // ),
      ),
    );
  }

  _pickTime() async {
    TimeOfDay time = await showTimePicker(
        context: context,
        initialTime: _time,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
              primaryColor: Color(0xFFC41A3B),
              accentColor: Color(0xFFC41A3B),
            ),
            child: child,
          );
        });

    if (time != null)
      setState(() {
        _time = time;
      });
  }
}
