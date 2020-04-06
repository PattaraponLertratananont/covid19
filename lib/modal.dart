import 'package:covid19/function.dart';
import 'package:flutter/material.dart';

showDetail(BuildContext context, cv, tl) {
  List covid = [];
  List timeline = [];
  covid.add(cv);
  timeline.add(tl);
  String country = covid[0]['country'];
  List data = [];

  timeline[0][0].forEach((tl) {
    if (tl['country'] == country) {
      data.add(tl['timeline'].last);
    }
  });

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: cl_base1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          covid[0]['country'].toString(),
          style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 20),
        ),
        content: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Card(
                    color: cl_base2,
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.32,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'ผู้ติดเชื้อ',
                            style: TextStyle(
                              color: cl_yellow,
                              fontSize: MediaQuery.of(context).size.width / 35,
                            ),
                          ),
                          data.isEmpty
                              ? Text(
                                  numFormat.format(covid.first['cases']).toString(),
                                  style: TextStyle(
                                    color: cl_yellow,
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width / 18,
                                  ),
                                )
                              : Text(
                                  covid.first['cases'] > data[0]['cases']
                                      ? numFormat.format(covid.first['cases']).toString()
                                      : numFormat.format(data[0]['cases']).toString(),
                                  style: TextStyle(
                                    color: cl_yellow,
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width / 18,
                                  ),
                                ),
                          data.isEmpty
                              ? Container()
                              : Container(
                                  child: Card(
                                    color: cl_yellow,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    child: Container(
                                        margin: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width * 0.01,
                                          right: MediaQuery.of(context).size.width * 0.03,
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Icon(
                                              Icons.arrow_drop_up,
                                              size: MediaQuery.of(context).size.width * 0.05,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              covid.first['cases'] > data[0]['cases']
                                                  ? numFormat.format(covid.first['cases'] - data[0]['cases'])
                                                  : numFormat.format(data[0]['cases'] - covid.first['cases']),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: MediaQuery.of(context).size.width / 40,
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
                  Card(
                    color: cl_base2,
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.32,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'รักษาตัว',
                            style: TextStyle(
                              color: cl_blue,
                              fontSize: MediaQuery.of(context).size.width / 35,
                            ),
                          ),
                          data.isEmpty
                              ? Text(
                                  numFormat.format(covid.first['active']).toString(),
                                  style: TextStyle(
                                    color: cl_blue,
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width / 18,
                                  ),
                                )
                              : Text(
                                  covid.first['cases'] > (data[0]['cases'] - data[0]['recovered'] - data[0]['deaths'])
                                      ? numFormat.format(covid.first['active']).toString()
                                      : numFormat.format(data[0]['cases'] - data[0]['recovered'] - data[0]['deaths']).toString(),
                                  style: TextStyle(
                                    color: cl_blue,
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width / 18,
                                  ),
                                ),
                          data.isEmpty
                              ? Container()
                              : Container(
                                  child: Card(
                                    color: cl_blue,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    child: Container(
                                        margin: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width * 0.01,
                                          right: MediaQuery.of(context).size.width * 0.03,
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Icon(
                                              Icons.arrow_drop_up,
                                              size: MediaQuery.of(context).size.width * 0.05,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              covid.first['active'] > (data[0]['cases'] - data[0]['recovered'] - data[0]['deaths'])
                                                  ? numFormat
                                                      .format(covid.first['active'] - (data[0]['cases'] - data[0]['recovered'] - data[0]['deaths']))
                                                  : numFormat
                                                      .format((data[0]['cases'] - data[0]['recovered'] - data[0]['deaths']) - covid.first['active']),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: MediaQuery.of(context).size.width / 40,
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
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Card(
                    color: cl_base2,
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.32,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'รักษาหาย',
                            style: TextStyle(
                              color: cl_green,
                              fontSize: MediaQuery.of(context).size.width / 35,
                            ),
                          ),
                          data.isEmpty
                              ? Text(
                                  numFormat.format(covid.first['recovered']).toString(),
                                  style: TextStyle(
                                    color: cl_green,
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width / 18,
                                  ),
                                )
                              : Text(
                                  covid.first['recovered'] > data[0]['recovered']
                                      ? numFormat.format(covid.first['recovered']).toString()
                                      : numFormat.format(data[0]['recovered']).toString(),
                                  style: TextStyle(
                                    color: cl_green,
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width / 18,
                                  ),
                                ),
                          data.isEmpty
                              ? Container()
                              : Container(
                                  child: Card(
                                    color: cl_green,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    child: Container(
                                        margin: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width * 0.01,
                                          right: MediaQuery.of(context).size.width * 0.03,
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Icon(
                                              Icons.arrow_drop_up,
                                              size: MediaQuery.of(context).size.width * 0.05,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              covid.first['recovered'] > data[0]['recovered']
                                                  ? numFormat.format(covid.first['recovered'] - data[0]['recovered'])
                                                  : numFormat.format(data[0]['recovered'] - covid.first['recovered']),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: MediaQuery.of(context).size.width / 40,
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
                  Card(
                    color: cl_base2,
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.32,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'เสียชีวิต',
                            style: TextStyle(
                              color: cl_red,
                              fontSize: MediaQuery.of(context).size.width / 35,
                            ),
                          ),
                          data.isEmpty
                              ? Text(
                                  numFormat.format(covid.first['deaths']).toString(),
                                  style: TextStyle(
                                    color: cl_red,
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width / 18,
                                  ),
                                )
                              : Text(
                                  covid.first['deaths'] > data[0]['deaths']
                                      ? numFormat.format(covid.first['deaths']).toString()
                                      : numFormat.format(data[0]['deaths']).toString(),
                                  style: TextStyle(
                                    color: cl_red,
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width / 18,
                                  ),
                                ),
                          data.isEmpty
                              ? Container()
                              : Container(
                                  child: Card(
                                    color: cl_red,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    child: Container(
                                        margin: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width * 0.01,
                                          right: MediaQuery.of(context).size.width * 0.03,
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Icon(
                                              Icons.arrow_drop_up,
                                              size: MediaQuery.of(context).size.width * 0.05,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              covid.first['deaths'] > data[0]['deaths']
                                                  ? numFormat.format(covid.first['deaths'] - data[0]['deaths'])
                                                  : numFormat.format(data[0]['deaths'] - covid.first['deaths']),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: MediaQuery.of(context).size.width / 40,
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
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
