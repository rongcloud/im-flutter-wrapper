import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecordView extends StatefulWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onCanceled;
  final VoidCallback? onFinished;

  const RecordView({Key? key, this.onPressed, this.onCanceled, this.onFinished})
      : super(key: key);

  @override
  State<RecordView> createState() => _RecordViewState();
}

class _RecordViewState extends State<RecordView> {
  bool showCancle = false;
  String textLable = "长按录音";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: showCancle ? Colors.red[400]!.withAlpha(200) : null,
        shape: BoxShape.circle,
      ),
      width: 200,
      height: 200,
      child: Center(
        child: GestureDetector(
          onLongPress: () {
            textLable = "松开发送";
            widget.onPressed!();
          },
          onLongPressMoveUpdate: (LongPressMoveUpdateDetails e) {
            //用户手指滑动时，更新偏移，重新构建
            if (e.localPosition.dx < 0 ||
                e.localPosition.dx > 120 ||
                e.localPosition.dy < 0 ||
                e.localPosition.dy > 120) {
              showCancle = true;
              textLable = "松开取消";
            } else {
              showCancle = false;
              textLable = "松开发送";
            }
            setState(() {
              // print(e.localPosition.dx.toString() + " and " + e.localPosition.dy.toString());
            });
          },
          onLongPressUp: () {
            if (!showCancle) {
              widget.onFinished!();
            } else {
              widget.onCanceled!();
            }
          },
          child: Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                textLable,
                style: const TextStyle(
                    fontSize: 15, decoration: TextDecoration.none),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
