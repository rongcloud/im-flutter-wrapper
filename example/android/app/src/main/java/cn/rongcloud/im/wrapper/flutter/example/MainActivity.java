package cn.rongcloud.im.wrapper.flutter.example;

import android.os.Bundle;

import androidx.annotation.Nullable;

import cn.example.im_interface_wrapper_flutter_example.PokeMessage;

import java.util.ArrayList;
import java.util.List;

import cn.rongcloud.im.wrapper.flutter.RCIMWrapperPlugin;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.rong.imlib.model.MessageContent;
import cn.rongcloud.im.wrapper.flutter.RCIMWrapperEngine;
import io.rong.message.CommandMessage;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        List<Class<? extends MessageContent>> list = new ArrayList<>();
        list.add(PokeMessage.class);
        list.add(CommandMessage.class);
        RCIMWrapperPlugin imPlugin = (RCIMWrapperPlugin) getFlutterEngine().getPlugins().get(RCIMWrapperPlugin.class);
        if (imPlugin != null) {
            imPlugin.engine.messageContentClassList = list;
        }

        // KT
        /*
        val plugin = flutterEngine?.plugins?.get(RCIMWrapperPlugin::class.java) as RCIMWrapperPlugin;
        // 给 messageContentClassList 添加注册类
        val pokeMessageClass = PokeMessage::class.java
        plugin.engine.messageContentClassList.add(pokeMessageClass);
        * */


    }
}
