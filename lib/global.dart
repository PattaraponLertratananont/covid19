import 'package:covid19/function.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Global extends StatefulWidget {
  final String title;
  final List dataCovid;
  final List dataGlobal;

  const Global({Key key, this.title, this.dataCovid, this.dataGlobal}) : super(key: key);
  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'จำนวนผู้ติดเชื้อทั่วโลก',
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width / 23,
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          child: Card(
            color: cl_base1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Card(
                          color: cl_base2,
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            child: widget.dataGlobal.isEmpty || widget.dataCovid.isEmpty
                                ? Image.asset(
                                    'assets/yellowLoad.gif',
                                    width: MediaQuery.of(context).size.width / 8,
                                  )
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'ผู้ติดเชื้อ',
                                        style: TextStyle(
                                          color: cl_yellow,
                                          fontSize: MediaQuery.of(context).size.width / 30,
                                        ),
                                      ),
                                      Text(
                                        widget.dataCovid[0]['cases'] >
                                                widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]['cases']
                                            ? numFormat.format(widget.dataCovid[0]['cases']).toString()
                                            : numFormat.format(
                                                widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]['cases']),
                                        style: TextStyle(
                                          color: cl_yellow,
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context).size.width / 12,
                                        ),
                                      ),
                                      Container(
                                        child: Card(
                                          color: cl_yellow,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                left: MediaQuery.of(context).size.width * 0.01,
                                                right: MediaQuery.of(context).size.width * 0.03,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.arrow_drop_up,
                                                    color: Colors.black,
                                                  ),
                                                  Text(
                                                    widget.dataCovid[0]['cases'] >
                                                            widget.dataGlobal[0]
                                                                [DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]['cases']
                                                        ? numFormat
                                                            .format((widget.dataCovid[0]['cases'] -
                                                                widget.dataGlobal[0]
                                                                    [DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]['cases']))
                                                            .toString()
                                                        : numFormat
                                                            .format((widget.dataGlobal[0]
                                                                    [DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]['cases'] -
                                                                widget.dataCovid[0]['cases']))
                                                            .toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: MediaQuery.of(context).size.width / 30,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: cl_base2,
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            child: widget.dataGlobal.isEmpty || widget.dataCovid.isEmpty
                                ? Image.asset(
                                    'assets/greenLoad.gif',
                                    width: MediaQuery.of(context).size.width / 8,
                                  )
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'รักษาหาย',
                                        style: TextStyle(
                                          color: cl_green,
                                          fontSize: MediaQuery.of(context).size.width / 30,
                                        ),
                                      ),
                                      Text(
                                        widget.dataCovid[0]['recovered'] >
                                                widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]
                                                    ['recovered']
                                            ? numFormat.format(widget.dataCovid[0]['recovered']).toString()
                                            : numFormat.format(widget.dataGlobal[0]
                                                [DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]['recovered']),
                                        style: TextStyle(
                                          color: cl_green,
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context).size.width / 12,
                                        ),
                                      ),
                                      Container(
                                        child: Card(
                                          color: cl_green,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                left: MediaQuery.of(context).size.width * 0.01,
                                                right: MediaQuery.of(context).size.width * 0.03,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.arrow_drop_up,
                                                    color: Colors.black,
                                                  ),
                                                  Text(
                                                    widget.dataCovid[0]['recovered'] >
                                                            widget.dataGlobal[0]
                                                                [DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]['recovered']
                                                        ? numFormat
                                                            .format((widget.dataCovid[0]['recovered'] -
                                                                widget.dataGlobal[0]
                                                                        [DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]
                                                                    ['recovered']))
                                                            .toString()
                                                        : numFormat
                                                            .format((widget.dataGlobal[0]
                                                                        [DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]
                                                                    ['recovered'] -
                                                                widget.dataCovid[0]['recovered']))
                                                            .toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: MediaQuery.of(context).size.width / 30,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Card(
                          color: cl_base2,
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            child: widget.dataGlobal.isEmpty || widget.dataCovid.isEmpty
                                ? Image.asset(
                                    'assets/blueLoad.gif',
                                    width: MediaQuery.of(context).size.width / 8,
                                  )
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'รักษาตัว',
                                        style: TextStyle(
                                          color: cl_blue,
                                          fontSize: MediaQuery.of(context).size.width / 30,
                                        ),
                                      ),
                                      Text(
                                        (widget.dataCovid[0]['cases'] - widget.dataCovid[0]['deaths'] - widget.dataCovid[0]['recovered']) >
                                                ((widget.dataCovid[0]['cases']) -
                                                    (widget.dataCovid[0]['deaths']) -
                                                    (widget.dataCovid[0]['recovered']) -
                                                    ((widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]
                                                            ['cases']) -
                                                        (widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]
                                                            ['deaths']) -
                                                        (widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]
                                                            ['recovered'])))
                                            ? numFormat
                                                .format(
                                                    (widget.dataCovid[0]['cases'] - widget.dataCovid[0]['deaths'] - widget.dataCovid[0]['recovered']))
                                                .toString()
                                            : numFormat
                                                .format(((widget.dataCovid[0]['cases']) -
                                                    (widget.dataCovid[0]['deaths']) -
                                                    (widget.dataCovid[0]['recovered']) -
                                                    ((widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]
                                                            ['cases']) -
                                                        (widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]
                                                            ['deaths']) -
                                                        (widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]
                                                            ['recovered']))))
                                                .toString(),
                                        style: TextStyle(
                                          color: cl_blue,
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context).size.width / 12,
                                        ),
                                      ),
                                      Container(
                                        child: Card(
                                          color: cl_blue,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                left: MediaQuery.of(context).size.width * 0.01,
                                                right: MediaQuery.of(context).size.width * 0.03,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.arrow_drop_up,
                                                    color: Colors.black,
                                                  ),
                                                  Text(
                                                    (widget.dataCovid[0]['cases'] - widget.dataCovid[0]['deaths'] - widget.dataCovid[0]['recovered']) >
                                                            (
                                                                ((widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]['cases']) -
                                                                    (widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]
                                                                        ['deaths']) -
                                                                    (widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]
                                                                        ['recovered'])))
                                                        ? numFormat
                                                            .format((((widget.dataCovid[0]['cases']) - (widget.dataCovid[0]['deaths']) - (widget.dataCovid[0]['recovered'])) -
                                                                ((widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]
                                                                        ['cases']) -
                                                                    (widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]
                                                                        ['deaths']) -
                                                                    (widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]
                                                                        ['recovered']))))
                                                            .toString()
                                                        : numFormat.format((((widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]['cases']) - (widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]['deaths']) - (widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]['recovered']))) - ((widget.dataCovid[0]['cases']) - (widget.dataCovid[0]['deaths']) - (widget.dataCovid[0]['recovered']))).toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: MediaQuery.of(context).size.width / 30,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: cl_base2,
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            child: widget.dataGlobal.isEmpty || widget.dataCovid.isEmpty
                                ? Image.asset(
                                    'assets/redLoad.gif',
                                    width: MediaQuery.of(context).size.width / 8,
                                  )
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'เสียชีวิต',
                                        style: TextStyle(
                                          color: cl_red,
                                          fontSize: MediaQuery.of(context).size.width / 30,
                                        ),
                                      ),
                                      Text(
                                        widget.dataCovid[0]['deaths'] >
                                                widget.dataGlobal[0][DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]['deaths']
                                            ? numFormat.format(widget.dataCovid[0]['deaths']).toString()
                                            : numFormat.format(widget.dataGlobal[0]
                                                [DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]['deaths']),
                                        style: TextStyle(
                                          color: cl_red,
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context).size.width / 12,
                                        ),
                                      ),
                                      Container(
                                        child: Card(
                                          color: cl_red,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                left: MediaQuery.of(context).size.width * 0.01,
                                                right: MediaQuery.of(context).size.width * 0.03,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.arrow_drop_up,
                                                    color: Colors.black,
                                                  ),
                                                  Text(
                                                    widget.dataCovid[0]['deaths'] >
                                                            widget.dataGlobal[0]
                                                                [DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]['deaths']
                                                        ? numFormat
                                                            .format((widget.dataCovid[0]['deaths'] -
                                                                widget.dataGlobal[0]
                                                                        [DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]
                                                                    ['deaths']))
                                                            .toString()
                                                        : numFormat
                                                            .format((widget.dataGlobal[0]
                                                                        [DateFormat('yyyy-M-d').format(DateTime.now().add(Duration(days: -1)))]
                                                                    ['deaths'] -
                                                                widget.dataCovid[0]['deaths']))
                                                            .toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: MediaQuery.of(context).size.width / 30,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
