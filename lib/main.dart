import 'dart:math';

import 'package:flutter/material.dart';

Null main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PertamaPage(),
    );
  }
}

class PertamaPage extends StatefulWidget {
  const PertamaPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PertamaPageState createState() => _PertamaPageState();
}

class _PertamaPageState extends State<PertamaPage> {
  DateTime? dateTimeNow=DateTime.now(), dateTimeTomorrow, pickedDate;
  // var year, month, day;
  TimeOfDay? pickedTime, selectedTime=TimeOfDay.now();

  Future<Null> getDate(BuildContext context) async {
    pickedDate = await showDatePicker(
      context: context,
      initialDate: dateTimeNow!,
      firstDate: DateTime(dateTimeNow!.year - 1),
      lastDate: DateTime(dateTimeNow!.year + 1));
    
    if (pickedDate != null && pickedDate != dateTimeNow) {
      setState(() {
        dateTimeNow = pickedDate;
      });
    }
  }

  Future<Null> getTime(BuildContext context) async {
    pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime!,
    );
    log(pickedTime.toString() as num);

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
        // ignore: prefer_interpolation_to_compose_strings
        log(("test"+pickedTime.toString()) as num);
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: () {getDate(context);},
            child: const Text("Test DatePicker"),
          ),
          MaterialButton(
            onPressed: () {getTime(context);},
            child: const Text("Test TimePicker"),
          ),
          // ignore: unnecessary_string_interpolations
          Text("${dateTimeNow.toString().substring(0, 10)}"),
          // ignore: unnecessary_string_interpolations
          Text("${selectedTime.toString().substring(10, 15)}")
        ],
      ),
    );
  }
}
