import 'package:covid19/function.dart';
import 'package:flutter/material.dart';

class Thailand extends StatefulWidget {
  final List thailandTimeline;
  final List thailandCovid;

  const Thailand({Key key, this.thailandTimeline, this.thailandCovid}) : super(key: key);
  @override
  _ThailandState createState() => _ThailandState();
}

class _ThailandState extends State<Thailand> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.03,
            bottom: MediaQuery.of(context).size.width * 0.03,
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'จำนวนผู้ติดเชื้อในประเทศไทย',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width / 23,
                ),
              ),
              Text(
                widget.thailandTimeline.isEmpty
                    ? 'วัน-เดือน-ปี'
                    : dateFormat
                        .format(
                          DateTime(
                            int.parse(widget.thailandTimeline[0]['data']['timeline'].last['date'].toString().split('-')[0]) + 543,
                            int.parse(widget.thailandTimeline[0]['data']['timeline'].last['date'].toString().split('-')[1]),
                            int.parse(widget.thailandTimeline[0]['data']['timeline'].last['date'].toString().split('-')[2]) + 1,
                          ),
                        )
                        .toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width / 27,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.015,
            right: MediaQuery.of(context).size.width * 0.015,
          ),
          alignment: Alignment.topLeft,
          height: MediaQuery.of(context).size.height / 4.0,
          child: Column(
            children: <Widget>[
              Container(
                child: Card(
                  color: cl_base2,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width - 10,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: widget.thailandCovid.isEmpty || widget.thailandTimeline.isEmpty
                        ? Image.asset(
                            'assets/yellowLoad.gif',
                            width: MediaQuery.of(context).size.width / 10,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
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
                                    widget.thailandCovid[0]['cases'] > widget.thailandTimeline[0]['data']['timeline'].last['cases']
                                        ? numFormat.format(widget.thailandCovid[0]['cases']).toString()
                                        : numFormat.format(widget.thailandTimeline[0]['data']['timeline'].last['cases']).toString(),
                                    style: TextStyle(
                                      color: cl_yellow,
                                      fontWeight: FontWeight.w700,
                                      fontSize: MediaQuery.of(context).size.width / 10,
                                    ),
                                  ),
                                ],
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
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Icon(
                                            Icons.arrow_drop_up,
                                            size: MediaQuery.of(context).size.width * 0.08,
                                            color: Colors.black,
                                          ),
                                          Text(
                                            'เพิ่มขึ้น ' +
                                                (widget.thailandCovid[0]['cases'] > widget.thailandTimeline[0]['data']['timeline'].last['cases']
                                                    ? numFormat
                                                        .format((widget.thailandCovid[0]['cases'] -
                                                            widget.thailandTimeline[0]['data']['timeline'].last['cases']))
                                                        .toString()
                                                    : numFormat
                                                        .format((widget.thailandTimeline[0]['data']['timeline'].last['cases']) -
                                                            widget.thailandCovid[0]['cases'])
                                                        .toString()),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: MediaQuery.of(context).size.width / 26,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Card(
                    color: cl_base2,
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.30 - MediaQuery.of(context).size.width * 0.01,
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: widget.thailandCovid.isEmpty || widget.thailandTimeline.isEmpty
                          ? Image.asset(
                              'assets/blueLoad.gif',
                              width: MediaQuery.of(context).size.width / 10,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'รักษาตัว',
                                  style: TextStyle(
                                    color: cl_blue,
                                    fontSize: MediaQuery.of(context).size.width / 33,
                                  ),
                                ),
                                Text(
                                  widget.thailandCovid[0]['active'] >
                                          (widget.thailandTimeline[0]['data']['timeline'].last['cases'] -
                                              widget.thailandTimeline[0]['data']['timeline'].last['recovered'] -
                                              widget.thailandTimeline[0]['data']['timeline'].last['deaths'])
                                      ? numFormat.format(widget.thailandCovid[0]['active']).toString()
                                      : numFormat.format(widget.thailandTimeline[0]['data']['timeline'].last['recovered']).toString(),
                                  style: TextStyle(
                                    color: cl_blue,
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width / 13,
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
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Icon(
                                              Icons.arrow_drop_up,
                                              size: MediaQuery.of(context).size.width * 0.05,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              widget.thailandCovid[0]['active'] >
                                                      (widget.thailandTimeline[0]['data']['timeline'].last['cases'] -
                                                          widget.thailandTimeline[0]['data']['timeline'].last['recovered'] -
                                                          widget.thailandTimeline[0]['data']['timeline'].last['deaths'])
                                                  ? numFormat
                                                      .format((widget.thailandCovid[0]['active'] -
                                                          (widget.thailandTimeline[0]['data']['timeline'].last['cases'] -
                                                              widget.thailandTimeline[0]['data']['timeline'].last['recovered'] -
                                                              widget.thailandTimeline[0]['data']['timeline'].last['deaths'])))
                                                      .toString()
                                                  : numFormat
                                                      .format(((widget.thailandTimeline[0]['data']['timeline'].last['cases'] -
                                                              widget.thailandTimeline[0]['data']['timeline'].last['recovered'] -
                                                              widget.thailandTimeline[0]['data']['timeline'].last['deaths']) -
                                                          widget.thailandCovid[0]['active']))
                                                      .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: MediaQuery.of(context).size.width / 38,
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
                      width: MediaQuery.of(context).size.width * 0.30 - MediaQuery.of(context).size.width * 0.01,
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: widget.thailandCovid.isEmpty || widget.thailandTimeline.isEmpty
                          ? Image.asset(
                              'assets/greenLoad.gif',
                              width: MediaQuery.of(context).size.width / 10,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'รักษาหาย',
                                  style: TextStyle(
                                    color: cl_green,
                                    fontSize: MediaQuery.of(context).size.width / 33,
                                  ),
                                ),
                                Text(
                                  widget.thailandCovid[0]['recovered'] > widget.thailandTimeline[0]['data']['timeline'].last['recovered']
                                      ? numFormat.format(widget.thailandCovid[0]['recovered']).toString()
                                      : numFormat.format(widget.thailandTimeline[0]['data']['timeline'].last['recovered']).toString(),
                                  style: TextStyle(
                                    color: cl_green,
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width / 13,
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
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Icon(
                                              Icons.arrow_drop_up,
                                              size: MediaQuery.of(context).size.width * 0.05,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              widget.thailandCovid[0]['recovered'] > widget.thailandTimeline[0]['data']['timeline'].last['recovered']
                                                  ? numFormat
                                                      .format((widget.thailandCovid[0]['recovered'] -
                                                          widget.thailandTimeline[0]['data']['timeline'].last['recovered']))
                                                      .toString()
                                                  : numFormat
                                                      .format((widget.thailandTimeline[0]['data']['timeline'].last['recovered']) -
                                                          widget.thailandCovid[0]['recovered'])
                                                      .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: MediaQuery.of(context).size.width / 38,
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
                      width: MediaQuery.of(context).size.width * 0.30 - MediaQuery.of(context).size.width * 0.01,
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: widget.thailandCovid.isEmpty || widget.thailandTimeline.isEmpty
                          ? Image.asset(
                              'assets/redLoad.gif',
                              width: MediaQuery.of(context).size.width / 10,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'เสียชีวิต',
                                  style: TextStyle(
                                    color: cl_red,
                                    fontSize: MediaQuery.of(context).size.width / 33,
                                  ),
                                ),
                                Text(
                                  widget.thailandCovid[0]['deaths'] > widget.thailandTimeline[0]['data']['timeline'].last['deaths']
                                      ? numFormat.format(widget.thailandCovid[0]['deaths']).toString()
                                      : numFormat.format(widget.thailandTimeline[0]['data']['timeline'].last['deaths']).toString(),
                                  style: TextStyle(
                                    color: cl_red,
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width / 13,
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
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Icon(
                                              Icons.arrow_drop_up,
                                              size: MediaQuery.of(context).size.width * 0.05,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              widget.thailandCovid[0]['deaths'] > widget.thailandTimeline[0]['data']['timeline'].last['deaths']
                                                  ? numFormat
                                                      .format((widget.thailandCovid[0]['deaths'] -
                                                          widget.thailandTimeline[0]['data']['timeline'].last['deaths']))
                                                      .toString()
                                                  : numFormat
                                                      .format((widget.thailandTimeline[0]['data']['timeline'].last['deaths']) -
                                                          widget.thailandCovid[0]['deaths'])
                                                      .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: MediaQuery.of(context).size.width / 38,
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
      ],
    );
  }
}
