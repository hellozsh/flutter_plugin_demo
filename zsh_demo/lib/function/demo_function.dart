
part of zsh_demo;

class DemoFunction {

  final StreamController<MethodCall> _methodStreamController = new StreamController.broadcast(); // ignore: close_sinks
  Stream<MethodCall> get _methodStream => _methodStreamController.stream; // Used in

  DemoFunction() {

    /// 1.
//    testChannel.setMethodCallHandler((MethodCall call) {
//
//      if(call.method == "nativeToFlutter") {
//        nativeToFlutter(call.arguments);
//      }
//      return;
//    });

    /// 2.配合stream流使用
    testChannel.setMethodCallHandler((MethodCall call) {

      _methodStreamController.add(call);
      return;
    });

  }

  /// 发送一个消息给原生，不带参数，不带返回值
  Future<void> flutterToNative() async {

    await testChannel.invokeMethod('flutterToNative');
  }

  /// 发送一个消息给原生，带参数，带返回值
  Future<bool> flutterToNativeWith(String text) async {

    return await testChannel.invokeMethod('flutterToNativeWith', text);
  }

  /// 原生发来一个消息，带参数
  void nativeToFlutter(String text) async {

    ToastUtils.toast("收到原生发来的消息,参数是:$text");
  }

  /// 原生发来一个消息，带参数
  Stream<String> nativeToFlutterStream() async* {

    yield* _methodStream
        .where((m) => m.method == "nativeToFlutter")
        .map((m) => m.arguments);
  }

  /// 收到监听
  Stream<String> receiveMessageStream() async* {

    yield* eventChannel
        .receiveBroadcastStream()
        .map((text) => text);
  }

}