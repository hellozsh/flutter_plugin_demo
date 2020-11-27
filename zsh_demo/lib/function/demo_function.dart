
part of zsh_demo;

class DemoFunction {

  /// 发送一个消息给原生，不带参数，不带返回值
  Future<void> sendSimpleText() async {

    await testChannel.invokeMethod('sendSimpleText');
  }

  /// 发送一个消息给原生，带参数，带返回值
  Future<bool> sendText(String text) async {

    return await testChannel.invokeMethod('sendText', text);
  }

}