import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:rongcloud_im_wrapper_plugin_example/engine/event_bus.dart';
import 'package:rongcloud_im_wrapper_plugin_example/toast/Toast.dart';

class ResultListView extends StatefulWidget {
  final List? arguments;
  const ResultListView({Key? key, this.arguments}) : super(key: key);

  @override
  _ResultListViewState createState() => _ResultListViewState();
}

class _ResultListViewState extends State<ResultListView> {
  List? arguments;
  @override
  void initState() {
    super.initState();
    arguments = widget.arguments;
    bus.on("rong_im_listener", _updateList);
  }

  @override
  void dispose() {
    super.dispose();
    bus.off("rong_im_listener", _updateList);
  }

  _updateList(arg) {
    Map result = arg as Map;
    String resultStr = '';
    for (var key in result.keys) {
      if (key == "listener") continue;
      resultStr += "\n" + key + ":" + result[key];
    }
    Map<String, String> showMap = {};
    showMap['title'] = result['listener'];
    showMap['resultStr'] = resultStr;
    arguments?.insert(0, showMap);
    setState(() {});
  }

  getTitle(index) {
    Map result = arguments![index];
    return (arguments!.length - index).toString() + ": " + result['title'];
  }

  getContent(Map result) {
    return result['resultStr'];
  }

  getSub(String title) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: GestureDetector(
        child: Container(
          alignment: const Alignment(-1, 0),
          child: Text(title),
        ),
        onLongPress: () {
          Clipboard.setData(ClipboardData(text: title));
          RCIWToast.showToast("复制成功~");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("接口调用结果"),
      ),
      key: UniqueKey(),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: widget.arguments?.length,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionTile(
              title: Text(getTitle(index)),
              children: [getSub(getContent(arguments?[index]))],
            );
          }),
    );
  }
}
