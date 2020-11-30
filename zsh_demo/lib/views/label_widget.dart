part of zsh_demo;



// ignore: must_be_immutable
class LabelWidget extends StatelessWidget {

  String text;
  LabelWidget(String text) {
    this.text = text;
  }

  /// 执行build构建widget
  @override
  Widget build(BuildContext context) {

    return platform.build(context: context, text: text);
  }

  PlatformView _platform;

  set platform(PlatformView platform) {
    _platform = platform;
  }

  /// 根据不同平台创建不同的view
  PlatformView get platform {
    if (_platform == null) {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          _platform = AndroidLabelView();
          break;
        case TargetPlatform.iOS:
          _platform = IosLabelView();
          break;
        default:
          throw UnsupportedError(
              "Trying to use the default webview implementation for $defaultTargetPlatform but there isn't a default one");
      }
    }
    return _platform;
  }
}