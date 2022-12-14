import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rongcloud_im_wrapper_plugin_example/engine/event_bus.dart';

class BottomView extends StatefulWidget {
  const BottomView({Key? key}) : super(key: key);

  @override
  _BottomViewState createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  Map<String, String> showMap = {};
  List resultList = [];
  @override
  void initState() {
    super.initState();
    bus.on("rong_im_listener", (arg) {
      Map result = arg as Map;
      String resultStr = '';
      for (var key in result.keys) {
        if (key == "listener") continue;
        resultStr += "\n" + key + ":" + result[key];
      }
      Map<String, String> map = {};
      map['title'] = result['listener'];
      map['resultStr'] = resultStr;
      showMap = map;
      _updateTitle(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: getBottomView(context),
    );
  }

  String getBottomText() {
    if (resultList.isNotEmpty) {
      return resultList.length.toString() + ":" + (showMap['title'] ?? "");
    }
    return "";
  }

  Widget getBottomView(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            getBottomText(),
            style: TextStyle(color: Colors.green[400]),
          ),
        ),
        SizedBox(
          width: 50,
          child: TextButton(
              onPressed: () {
                if (resultList.isEmpty) return;
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: Text(showMap['resultStr'] ?? ""),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text("??????"),
                            onPressed: () =>
                                Navigator.of(context).pop(), //???????????????
                          ),
                        ],
                      );
                    });
              },
              child: const Text("??????")),
        ),
        SizedBox(
          width: 60,
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/ResultListView",
                    arguments: List.from(resultList.reversed));
              },
              child: const Text("??????>>")),
        ),
      ],
    );
  }

  String formatJson(jsonObject) {
    if (jsonObject == null) {
      return "";
    }
    const JsonEncoder encoder = JsonEncoder.withIndent('    ');
    return encoder.convert(jsonObject);
  }

  _updateTitle(Map result) {
    resultList.add(result);
    setState(() {});
  }
}
