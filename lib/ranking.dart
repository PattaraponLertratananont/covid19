import 'package:covid19/function.dart';
import 'package:covid19/modal.dart';
import 'package:flutter/material.dart';

class Ranking extends StatefulWidget {
  final List dataCovid;
  final List rankCovid;
  final List dataTimeAll;

  const Ranking({Key key, this.dataCovid, this.rankCovid, this.dataTimeAll}) : super(key: key);
  @override
  _RankingState createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
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
              InkWell(
                child: Text(
                  'อันดับประเทศติดเชื้อสูงสุด',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 23,
                  ),
                ),
                onTap: () {},
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
                // splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  widget.dataCovid.isNotEmpty && widget.rankCovid.isNotEmpty && widget.dataTimeAll.isNotEmpty
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
                                      'อันดับประเทศติดเชื้อสูงสุด',
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
                                      itemCount: widget.rankCovid[0].length,
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
                                                widget.rankCovid.isEmpty ? 'ประเทศ' : widget.rankCovid[0][i]['country'].toString(),
                                                style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 23),
                                              ),
                                              trailing: Text(
                                                widget.rankCovid.isEmpty ? '0' : numFormat.format(widget.rankCovid[0][i]['cases']).toString(),
                                                style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 23),
                                              ),
                                              onTap: () {
                                                // Navigator.of(context).pop();
                                                showDetail(context, widget.rankCovid[0][i], widget.dataTimeAll);
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
                      widget.rankCovid.isEmpty ? 'ประเทศ' : widget.rankCovid[0][0]['country'].toString(),
                      style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 20),
                    ),
                    trailing: Text(
                      widget.rankCovid.isEmpty ? '0' : numFormat.format(widget.rankCovid[0][0]['cases']).toString(),
                      style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 20),
                    ),
                    onTap: () {
                      widget.rankCovid.isEmpty ? print('wait') : showDetail(context, widget.rankCovid[0][0], widget.dataTimeAll);
                    },
                  ),
                ),
              ),
              Container(
                child: Card(
                  color: cl_base2,
                  child: ListTile(
                    title: Text(
                      widget.rankCovid.isEmpty ? 'ประเทศ' : widget.rankCovid[0][1]['country'].toString(),
                      style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 20),
                    ),
                    trailing: Text(
                      widget.rankCovid.isEmpty ? '0' : numFormat.format(widget.rankCovid[0][1]['cases']).toString(),
                      style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 20),
                    ),
                    onTap: () {
                      widget.rankCovid.isEmpty ? print('wait') : showDetail(context, widget.rankCovid[0][1], widget.dataTimeAll);
                    },
                  ),
                ),
              ),
              Container(
                child: Card(
                  color: cl_base2,
                  child: ListTile(
                    title: Text(
                      widget.rankCovid.isEmpty ? 'ประเทศ' : widget.rankCovid[0][2]['country'].toString(),
                      style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 20),
                    ),
                    trailing: Text(
                      widget.rankCovid.isEmpty ? '0' : numFormat.format(widget.rankCovid[0][2]['cases']).toString(),
                      style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 20),
                    ),
                    onTap: () {
                      widget.rankCovid.isEmpty ? print('wait') : showDetail(context, widget.rankCovid[0][2], widget.dataTimeAll);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
