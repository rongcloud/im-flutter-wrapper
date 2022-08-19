package cn.rongcloud.im.wrapper.flutter;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;

public class RCIMWrapperPlugin implements FlutterPlugin {
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    RCIMWrapperEngine.getInstance()
        .init(
            flutterPluginBinding.getApplicationContext(),
            flutterPluginBinding.getBinaryMessenger(),
            flutterPluginBinding.getFlutterAssets());
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    RCIMWrapperEngine.getInstance().unInit();
  }
}
