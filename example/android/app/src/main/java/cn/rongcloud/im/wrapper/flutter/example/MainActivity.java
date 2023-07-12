package cn.rongcloud.im.wrapper.flutter.example;

import android.os.Bundle;

import androidx.annotation.Nullable;

import cn.example.im_interface_wrapper_flutter_example.PokeMessage;

import java.util.ArrayList;
import java.util.List;

import io.flutter.embedding.android.FlutterActivity;
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
        RCIMWrapperEngine.getInstance().messageContentClassList = list;

    }
}
