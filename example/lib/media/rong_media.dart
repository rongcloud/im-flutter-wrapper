import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rongcloud_im_wrapper_plugin_example/toast/Toast.dart';
import 'package:rongcloud_im_wrapper_plugin_example/toast/bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';

class RCIWMediaUlits {
  static AudioRecorder audioRecorder = AudioRecorder();
  //选择本地文件，成功返回文件信息
  static Future<List<File>?> pickFiles(
      {List<String>? allowedExtensions}) async {
    PermissionStatus status;
    if (Platform.isAndroid) {
      status = await Permission.storage.request();
    } else if (Platform.isIOS) {
      status = await Permission.photos.request();
    } else {
      return null;
    }

    if (status.isGranted) {
      FilePickerResult? result;
      if (allowedExtensions != null) {
        result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowMultiple: false,
            allowedExtensions: allowedExtensions);
      } else {
        result = await FilePicker.platform.pickFiles(allowMultiple: false);
      }

      List<File>? files = result?.paths.map((path) => File(path!)).toList();
      return files;
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
      return null;
    }
  }

  static showVideoPicker(BuildContext context, Function(String path) callback) {
    List<Widget> widgets = [
      ListTile(
        title: const Center(
          child: Text(
            "视频",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        onTap: () async {
          Navigator.pop(context);
          _onImageButtonPressed(ImageSource.gallery, (XFile? file) async {
            callback.call(file?.path ?? '');
          }, context: context, isVideo: true);
        },
      ),
      ListTile(
        title: const Center(
          child: Text(
            "拍视频",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        onTap: () async {
          Navigator.pop(context);
          _onImageButtonPressed(ImageSource.camera, (XFile? file) async {
            callback.call(file?.path ?? '');
          }, context: context, isVideo: true);
        },
      ),
    ];

    RCIWBottomSheet.showSheet(widgets, context);
  }

  static showImagePicker(BuildContext context, Function(XFile? file) callback) {
    List<Widget> widgets = [
      ListTile(
        title: const Center(
          child: Text(
            "拍照",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        onTap: () async {
          Navigator.pop(context);

          _onImageButtonPressed(ImageSource.camera, (XFile? file) async {
            callback.call(file);
          }, context: context);
        },
      ),
      ListTile(
        title: const Center(
          child: Text(
            "相册",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        onTap: () async {
          Navigator.pop(context);

          _onImageButtonPressed(ImageSource.gallery, (XFile? file) async {
            callback.call(file);
          }, context: context);
        },
      ),
    ];

    RCIWBottomSheet.showSheet(widgets, context);
  }

  static Future<bool> checkPermission() async {
    bool hasPermission = await audioRecorder.hasPermission();
    return hasPermission;
  }

//开始录音
  static void startRecordAudio() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path +
        "/" +
        DateTime.now().millisecondsSinceEpoch.toString() +
        ".aac";
    // Start recording
    await audioRecorder.start(
      const RecordConfig(
        encoder: AudioEncoder.aacLc,
        sampleRate: 44100,
        bitRate: 128000,
        numChannels: 1,
      ),
      path: tempPath, // required

      // encoder: AudioEncoder.AAC, // by default
    );
  }

//录音结束，通过 finished 返回本地路径和语音时长，注：Android 必须要加 file:// 头
  static void stopRecordAudio(
      Function(String? path, int? duration) finished) async {
    String? audioPath = await audioRecorder.stop();

    AudioPlayer player = AudioPlayer();
    Duration? durationA = await player.setFilePath(audioPath!);

    int duration = durationA!.inSeconds;

    if (duration > 0) {
      String? path = audioPath;
      if (path == null) {
        finished(null, 0);
      }
      if (TargetPlatform.android == defaultTargetPlatform) {
        path = "file://" + path;
      }
      finished(path, duration);
    } else {
      RCIWToast.showToast("说话时间太短");
    }
  }
}

final ImagePicker _picker = ImagePicker();
Future<void> _onImageButtonPressed(
  ImageSource source,
  Function callback, {
  BuildContext? context,
  bool isMultiImage = false,
  bool isVideo = false,
}) async {
  bool agree = false;
  if (kIsWeb) {
    agree = true;
  } else if (Platform.isIOS || Platform.isAndroid) {
    PermissionStatus status = await Permission.camera.request();
    agree = status.isGranted;
    if (status.isPermanentlyDenied) {
      openAppSettings();
      return;
    }
  }
  if (agree) {
    // Either the permission was already granted before or the user just granted it.
    if (isVideo) {
      final XFile? file = await _picker.pickVideo(
          source: source, maxDuration: const Duration(seconds: 10));
      callback(file);
    } else {
      try {
        final pickedFile = await _picker.pickImage(
          source: source,
        );
        callback(pickedFile);
      } catch (e) {}
    }
  }
}
