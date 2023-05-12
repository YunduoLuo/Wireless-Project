import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_1800/pages/user/loginView.dart';
import 'package:flutter_1800/tools/AppUtil.dart';
import 'package:flutter_1800/tools/config.dart';
import 'package:flutter_1800/tools/storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rate/rate.dart';

class FilmDetail extends StatefulWidget {
  final Map? detail;
  FilmDetail(this.detail, {Key? key}) : super(key: key);

  @override
  _FilmDetailState createState() => _FilmDetailState();
}

class _FilmDetailState extends State<FilmDetail>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List list = [];

  @override
  void initState() {
    super.initState();
    query();
  }

  void query() async {
    setState(() {});
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
    // // if failed,use refreshFailed()
  }

  void _onLoading() async {
    // monitor network fetch
    // await Future.delayed(Duration(milliseconds: 1000));
    // // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length+1).toString());
    // if(mounted)
    // setState(() {

    // });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xff333333),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.white,
          toolbarOpacity: 1,
          leading: Container(),
          leadingWidth: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light
              .copyWith(statusBarColor: Colors.transparent),
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  AppUtil.back();
                },
                child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0x44000000),
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  widget.detail!["image"],
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 1.3,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    bottom: 10,
                    left: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.detail!["name"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Rate(
                              iconSize: 20,
                              color: Colors.yellow,
                              allowHalf: true,
                              allowClear: true,
                              initialValue: widget.detail!["score"] / 2,
                              readOnly: false,
                              onChange: (value) => print(value),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        // Row(
                        //   children: [
                        //     Text(
                        //       widget.detail!["moivetype"],
                        //       style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 13,
                        //           fontWeight: FontWeight.bold),
                        //     ),
                        //     SizedBox(width: 10),
                        //     Text(
                        //       widget.detail!["name"],
                        //       style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 13,
                        //           fontWeight: FontWeight.bold),
                        //     ),
                        //   ],
                        // )
                      ],
                    ))
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.detail!["moivetype"].toString(),
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  widget.detail!["remark"] != null
                      ? Text(
                          widget.detail!["remark"],
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        )
                      : Container(),
                ],
              ),
            )
          ],
        ));
  }
}
