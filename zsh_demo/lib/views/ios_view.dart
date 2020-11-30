
part of zsh_demo;

class IosLabelView implements PlatformView {

  @override
  Widget build({BuildContext context, String text}) {

    var map = creationParamsToMap(text);

    return UiKitView(
      viewType: LABEL_VIEW,
      creationParams: map,  /// 创建view传递给原生的参数
      creationParamsCodec: new StandardMessageCodec(), /// 参数编解码方式，和原生保持一致
      onPlatformViewCreated:(int id) {
        /// LABEL_VIEW_$id 又是一个cahnnel的唯一标识，可用于该IosLabelView原生实例与flutter的沟通，比如更新数据等

      },
    );
  }

  static Map<String, dynamic> creationParamsToMap(
      String text) {
    return <String, dynamic>{
      'text': text,
    };
  }
}