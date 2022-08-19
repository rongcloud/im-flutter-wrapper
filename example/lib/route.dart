import 'package:flutter/material.dart';
import 'package:rongcloud_im_wrapper_plugin_example/home/app.dart';
import 'package:rongcloud_im_wrapper_plugin_example/home/result_list_view.dart';

final routes = {
  '/': (context) => MyApp(),
  '/ResultListView': (context, {arguments}) =>
      ResultListView(arguments: arguments),
};

var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name!];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
