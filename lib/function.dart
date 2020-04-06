import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

final numFormat = new NumberFormat('#,###', 'en_US');
final dateFormat = new DateFormat('dd-MM-yyyy');

Color cl_blue = Color.fromARGB(255, 37, 153, 193);
Color cl_red = Color.fromARGB(255, 255, 92, 91);
Color cl_yellow = Color.fromARGB(255, 211, 174, 79);
Color cl_green = Color.fromARGB(255, 25, 170, 98);
Color cl_text1 = Color.fromARGB(255, 120, 128, 132);
Color cl_base1 = Color.fromARGB(255, 40, 46, 56);
Color cl_base2 = Color.fromARGB(255, 50, 58, 70);

Future<List> getAll() async {
  List dataCovid = new List();
  await http.get(
    'http://api.coronastatistics.live/all',
    headers: {
      "Content-Type": "application/json;chaset=utf-8",
    },
  ).then((res) {
    var data = json.decode(res.body);
    dataCovid.add(data);
    // print(dataCovid);
  }).catchError((err) {
    print('error getAll');
  });
  return dataCovid;
}

Future<List> getStat() async {
  List dataCovid = [];
  await http.get(
    'http://api.coronastatistics.live/countries/Thailand',
    headers: {
      "Content-Type": "application/json;chaset=utf-8",
    },
  ).then((res) {
    var data = json.decode(res.body);
    dataCovid.add(data);
    // print(data);
  }).catchError((err) {
    print('error getStat');
  });
  return dataCovid;
}

Future<List> getSort(String sort) async {
  List dataCovid = [];
  await http.get(
    'http://api.coronastatistics.live/countries?sort=$sort',
    headers: {
      "Content-Type": "application/json;chaset=utf-8",
    },
  ).then((res) {
    var data = json.decode(res.body);
    dataCovid.add(data);
    // print(data);
  }).catchError((err) {
    print('error getSort');
  });
  return dataCovid;
}

Future<List> getTimeline() async {
  List dataCovid = [];
  await http.get(
    'http://api.coronastatistics.live/timeline/Thailand',
    headers: {
      "Content-Type": "application/json;chaset=utf-8",
    },
  ).then((res) {
    var data = json.decode(res.body);
    dataCovid.add(data);
    // print(data);
  }).catchError((err) {
    print('error getTimeline');
  });
  return dataCovid;
}

Future<List> getTimelineAll() async {
  List dataCovid = [];
  await http.get(
    'http://api.coronastatistics.live/timeline',
    headers: {
      "Content-Type": "application/json;chaset=utf-8",
    },
  ).then((res) {
    var data = json.decode(res.body);
    dataCovid.add(data);
    // print(data);
  }).catchError((err) {
    print('error getTimelineAll');
  });
  return dataCovid;
}

Future<List> getGlobal() async {
  List dataCovid = new List();
  await http.get(
    'http://api.coronastatistics.live/timeline/global',
    headers: {
      "Content-Type": "application/json;chaset=utf-8",
    },
  ).then((res) {
    var data = json.decode(res.body);
    dataCovid.add(data);
    // print(dataCovid);
  }).catchError((err) {
    print('error getGlobal');
  });
  return dataCovid;
}
