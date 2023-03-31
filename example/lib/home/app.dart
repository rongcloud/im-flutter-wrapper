import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rongcloud_im_wrapper_plugin_example/im_interface/options.dart'
    if (dart.library.html) 'package:rongcloud_im_wrapper_plugin_example/im_interface/options_web.dart';
import 'package:rongcloud_im_wrapper_plugin_example/route.dart';

import '../auto/bottom_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showContent = false;
  @override
  void initState() {
    super.initState();

    // 修复 Android release 包启动后 界面数据异常问题
    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      showContent = true;
      setState(() {});
    });
  }

  _buildExpansionSubWidget(String title) {
    List<Widget> widgets = _buildSubWidget(title);
    Widget w = Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
      width: window.physicalSize.width,
      child: Wrap(
        children: widgets,
        spacing: 10,
        runSpacing: 10,
      ),
      color: Colors.grey[200],
    );
    return [w];
  }

  _buildItem(Map title) {
    return OutlinedButton(
      onPressed: getFun(title),
      child: Text(title["title"]),
    );
  }

  showListDialog(Map map) async {
    List params = List.from(map['params'] ?? {});
    Map result = {};
    String action = map["action"].toString();
    String method = getMethodName(action);
    if (cbList.contains(method)) {
      params.add(cbParam);
    }
    showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: [
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: params.length,
                  itemBuilder: (BuildContext context, int index) {
                    var param = params[index];
                    // 文本框
                    if (param['type'] == "String" ||
                        param['type'] == "number") {
                      return SizedBox(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 5, top: 5),
                            child: Text(
                              param["lable"],
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ),
                          TextField(
                            keyboardType: param['type'] == "String"
                                ? TextInputType.text
                                : TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 10),
                              hintText: param["hint"],
                            ),
                            onChanged: (str) {
                              result[param['key']] = str;
                            },
                          )
                        ],
                      ));
                    }
                    return const Text("data");
                  }),
            ),
            Container(
              color: Colors.grey[200],
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("取消"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          result['context'] = _scaffoldKey.currentContext;
                          if (params.length > 0) {
                            map['action'].call(result);
                          } else {
                            map['action'];
                          }
                        },
                        child: const Text("确定"),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);
        return Dialog(child: child);
      },
    );
  }

  getFun(Map title) {
    String action = title["action"].toString();
    String method = getMethodName(action);
    if (title["params"] != null || cbList.contains(method)) {
      return () {
        showListDialog(title);
      };
    } else {
      return title["action"];
    }
  }

  getMethodName(String text) {
    try {
      if (kIsWeb && text.contains('function')) {
        var sub = text.substring(text.indexOf('function'));
        var result = sub.substring(0, sub.indexOf('('));
        return result.split(' ')[1];
      }
      return text.split('\'')[1];
    } catch (e) {
      print("getMethodName text: $text, error:$e");
    }
  }

  List<Widget> _buildSubWidget(String title) {
    List<Widget> widgets = [];
    List? subtitleList = subList[title];
    subtitleList?.forEach((element) {
      widgets.add(_buildItem(element));
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Flutter IM Test Demo'),
        ),
        body: Center(
          child: showContent
              ? Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: titleList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ExpansionTile(
                                title: Text(titleList[index]),
                                children:
                                    _buildExpansionSubWidget(titleList[index]),
                              );
                            })),
                    Container(
                      height: 60,
                      width: window.physicalSize.width,
                      color: Colors.blue[100],
                      child: const BottomView(),
                    )
                  ],
                )
              : null,
        ),
      ),
    );
  }
}
