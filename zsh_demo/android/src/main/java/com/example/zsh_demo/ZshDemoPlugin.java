package com.example.zsh_demo;

import androidx.annotation.NonNull;

import io.flutter.Log;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

public class ZshDemoPlugin implements FlutterPlugin, MethodCallHandler {

  static String NAMESPACE = "plugins.zsh.com/zsh_demo";

  private MethodChannel channel;
  private EventChannel _receiveMessageStateChannel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {

    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), NAMESPACE+"/testChannel");
    channel.setMethodCallHandler(this);

    LabelViewFactory factory = new LabelViewFactory(flutterPluginBinding.getBinaryMessenger());
    flutterPluginBinding.getPlatformViewRegistry().registerViewFactory(NAMESPACE+"/labelView",factory);

    _receiveMessageStateChannel = new EventChannel(flutterPluginBinding.getBinaryMessenger(), NAMESPACE + "/receiveMessages");
    _receiveMessageStateChannel.setStreamHandler(receiveMessageStateChannelHandler);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

    if (call.method.equals("flutterToNative")) {

      Log.e("zhousuhua", "安卓 flutterToNative 无参数");
      result.success(null);
    } else if (call.method.equals("flutterToNativeWith")) {

      Log.e("zhousuhua", "安卓 flutterToNativeWith 参数"+call.arguments.toString());


      result.success(true);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  final EventChannel.StreamHandler receiveMessageStateChannelHandler = new EventChannel.StreamHandler() {
    private EventChannel.EventSink sink;

    @Override
    public void onListen(Object o, EventChannel.EventSink eventSink) {

      Log.i("zhousuhua", "stateHandler=== onListen");
      sink = eventSink;

      /// 添加计时器
      sink.success("1000");
    }

    @Override
    public void onCancel(Object o) {

      Log.i("zhousuhua", "stateHandler=== onCancel");
      sink = null;
    }
  };
}
