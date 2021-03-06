import 'package:covid19/function.dart';
import 'package:covid19/global.dart';
import 'package:covid19/modal.dart';
import 'package:covid19/ranking.dart';
import 'package:covid19/thailand.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      title: 'Covid-19 Realtime',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Covid-19 Real Time'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = new TextEditingController();

  String typeFetch;
  String typeHeadFetch;
  List dataCovid = [];
  List rankCovid = [];
  List thailandCovid = [];
  List thailandTimeline = [];
  List countryCovid = [];
  List resultSearch = [];
  List dataGlobal = [];
  List dataTimeAll = [];

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    typeFetch = 'cases';
    typeHeadFetch = 'ติดเชื้อ';
    fetchData(typeFetch);
  }

  fetchData(String type) {
    dataCovid.clear();
    rankCovid.clear();
    thailandCovid.clear();
    thailandTimeline.clear();
    countryCovid.clear();
    resultSearch.clear();
    dataGlobal.clear();
    dataTimeAll.clear();

    getAll().then(
      (value) => setState(() {
        dataCovid = value;
      }),
    );
    getSort(type).then(
      (value) => setState(() {
        rankCovid = value;
        getCountryCovid();
      }),
    );
    getStat().then(
      (value) => setState(() {
        thailandCovid = value;
      }),
    );
    getTimeline().then(
      (value) => setState(() {
        thailandTimeline = value;
      }),
    );

    getGlobal().then(
      (value) => setState(() {
        dataGlobal = value;
      }),
    );

    getTimelineAll().then(
      (value) => setState(() {
        dataTimeAll = value;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cl_base1,
        appBar: AppBar(
          backgroundColor: cl_base1,
          leading: Icon(Icons.search),
          title: TextField(
            onChanged: (value) {
              value.length > 1 ? null : setState(() {});
            },
            controller: searchController,
            onEditingComplete: () {
              if (searchController.text.isNotEmpty) {
                resultSearch.clear();
                search(searchController.text.toLowerCase());
                FocusScope.of(context).unfocus();
              }
            },
            decoration: InputDecoration(
              hintText: 'ชื่อประเทศ (ภาษาอังกฤษ)',
              hintStyle: TextStyle(
                color: cl_text1,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: cl_base2,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: cl_base2,
                ),
              ),
            ),
            style: TextStyle(
              color: Colors.white,
            ),
            cursorColor: Colors.white,
          ),
          actions: <Widget>[
            searchController.text.isEmpty
                ? IconButton(
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      setState(() {
                        fetchData(typeFetch);
                      });
                    },
                  )
                : IconButton(
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(Icons.check),
                    onPressed: () {
                      resultSearch.clear();
                      search(searchController.text.toLowerCase());
                      FocusScope.of(context).unfocus();
                    },
                  )
          ],
          centerTitle: true,
          elevation: 4,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.03,
                bottom: MediaQuery.of(context).size.width * 0.03,
                left: MediaQuery.of(context).size.width * 0.015,
                right: MediaQuery.of(context).size.width * 0.015,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 50),
                    child: InkWell(
                      onDoubleTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              child: AlertDialog(
                                backgroundColor: cl_base1,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                content: Container(
                                  height: MediaQuery.of(context).size.height * 0.1,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'ข้อมูลอ้างอิงจาก\n\nhttps://coronastatistics.live',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context).size.width / 21,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.width / 16,
                        ),
                      ),
                    ),
                  ),
                  Global(
                    title: widget.title,
                    dataCovid: dataCovid,
                    dataGlobal: dataGlobal,
                  ),
                  Thailand(
                    thailandCovid: thailandCovid,
                    thailandTimeline: thailandTimeline,
                  ),
                  // Ranking(
                  //   dataCovid: dataCovid,
                  //   dataTimeAll: dataTimeAll,
                  //   rankCovid: rankCovid,
                  // ),
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
                        InkWell(
                          child: Row(
                            children: [
                              Text(
                                'อันดับประเทศ' + typeHeadFetch + 'สูงสุด',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width / 23,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              )
                            ],
                          ),
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {
                            showModalBottomSheet(
                                enableDrag: false,
                                context: context,
                                backgroundColor: cl_base2,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height * 0.36,
                                    child: Column(
                                      children: [
                                        Container(
                                          color: cl_base1,
                                          child: ListTile(
                                            title: Text(
                                              'เลือกประเภทของการแสดงอันดับ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context).size.width / 23,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: ListTile(
                                            title: Text(
                                              'ผู้ติดเชื้อ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context).size.width / 23,
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                typeFetch = 'cases';
                                                typeHeadFetch = 'ติดเชื้อ';
                                                fetchData(typeFetch);
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ),
                                        Container(
                                          child: ListTile(
                                            title: Text(
                                              'รักษาตัว',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context).size.width / 23,
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                typeFetch = 'active';
                                                typeHeadFetch = 'รักษาตัว';
                                                fetchData(typeFetch);
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ),
                                        Container(
                                          child: ListTile(
                                            title: Text(
                                              'รักษาหาย',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context).size.width / 23,
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                typeFetch = 'recovered';
                                                typeHeadFetch = 'รักษาหาย';
                                                fetchData(typeFetch);
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ),
                                        Container(
                                          color: cl_base2,
                                          child: ListTile(
                                            title: Text(
                                              'เสียชีวิต',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context).size.width / 23,
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                typeFetch = 'deaths';
                                                typeHeadFetch = 'เสียชีวิต';
                                                fetchData(typeFetch);
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                        InkWell(
                          child: Text(
                            'เพิ่มเติม',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width / 27,
                            ),
                          ),
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            dataCovid.isNotEmpty && rankCovid.isNotEmpty && dataTimeAll.isNotEmpty
                                ? showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        child: AlertDialog(
                                            backgroundColor: cl_base1,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                            title: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                'อันดับประเทศ' + typeHeadFetch + 'สูงสุด',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: MediaQuery.of(context).size.width / 23,
                                                ),
                                              ),
                                            ),
                                            content: Container(
                                              height: MediaQuery.of(context).size.height * 0.6,
                                              width: MediaQuery.of(context).size.width,
                                              child: ListView.builder(
                                                itemCount: rankCovid[0].length,
                                                itemBuilder: (BuildContext context, int i) {
                                                  return Container(
                                                    child: Card(
                                                      color: cl_base2,
                                                      child: ListTile(
                                                        leading: Text(
                                                          (i + 1).toString(),
                                                          style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 23),
                                                        ),
                                                        title: Text(
                                                          rankCovid.isEmpty ? 'ประเทศ' : rankCovid[0][i]['country'].toString(),
                                                          style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 23),
                                                        ),
                                                        trailing: Text(
                                                          rankCovid.isEmpty ? '0' : numFormat.format(rankCovid[0][i]['cases']).toString(),
                                                          style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 23),
                                                        ),
                                                        onTap: () {
                                                          // Navigator.of(context).pop();
                                                          showDetail(context, rankCovid[0][i], dataTimeAll);
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )),
                                      );
                                    })
                                : print('wait');
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Card(
                            color: cl_base2,
                            child: ListTile(
                              title: Text(
                                rankCovid.isEmpty ? 'ประเทศ' : rankCovid[0][0]['country'].toString(),
                                style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 20),
                              ),
                              trailing: Text(
                                rankCovid.isEmpty ? '0' : numFormat.format(rankCovid[0][0]['cases']).toString(),
                                style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 20),
                              ),
                              onTap: () {
                                rankCovid.isEmpty ? print('wait') : showDetail(context, rankCovid[0][0], dataTimeAll);
                              },
                            ),
                          ),
                        ),
                        Container(
                          child: Card(
                            color: cl_base2,
                            child: ListTile(
                              title: Text(
                                rankCovid.isEmpty ? 'ประเทศ' : rankCovid[0][1]['country'].toString(),
                                style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 20),
                              ),
                              trailing: Text(
                                rankCovid.isEmpty ? '0' : numFormat.format(rankCovid[0][1]['cases']).toString(),
                                style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 20),
                              ),
                              onTap: () {
                                rankCovid.isEmpty ? print('wait') : showDetail(context, rankCovid[0][1], dataTimeAll);
                              },
                            ),
                          ),
                        ),
                        Container(
                          child: Card(
                            color: cl_base2,
                            child: ListTile(
                              title: Text(
                                rankCovid.isEmpty ? 'ประเทศ' : rankCovid[0][2]['country'].toString(),
                                style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 20),
                              ),
                              trailing: Text(
                                rankCovid.isEmpty ? '0' : numFormat.format(rankCovid[0][2]['cases']).toString(),
                                style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 20),
                              ),
                              onTap: () {
                                rankCovid.isEmpty ? print('wait') : showDetail(context, rankCovid[0][2], dataTimeAll);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getCountryCovid() {
    rankCovid[0].forEach((element) {
      countryCovid.add(element);
    });
  }

  search(String kw) {
    countryCovid.forEach((country) {
      if (country['country'].toString().toLowerCase().contains(kw)) {
        resultSearch.add(country);
        // print(country);
      }
    });
    if (resultSearch.isEmpty) {
      setState(() {
        resultSearch.clear();
        searchController.clear();
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: AlertDialog(
              backgroundColor: cl_base1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                alignment: Alignment.center,
                child: Text(
                  'ไม่พบชื่อประเทศ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 21,
                  ),
                ),
              ),
            ),
          );
        },
      );
    } else {
      setState(() {
        searchController.clear();
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: AlertDialog(
              backgroundColor: cl_base1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              title: Container(
                alignment: Alignment.center,
                child: Text(
                  'รายการค้นหา',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 23,
                  ),
                ),
              ),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: resultSearch.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      child: Card(
                        color: cl_base2,
                        child: ListTile(
                          title: Text(
                            resultSearch[i]['country'].toString(),
                            style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 23),
                          ),
                          trailing: Text(
                            numFormat.format(resultSearch[i]['cases']).toString(),
                            style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 23),
                          ),
                          onTap: () {
                            // Navigator.of(context).pop();
                            showDetail(context, resultSearch[i], dataTimeAll);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
