part of zsh_demo;


class AndroidLabelView implements PlatformView {

  @override
  Widget build({BuildContext context, String text}) {

    print("zhousuhua ===== map $text");

    return AndroidView(
      viewType: LABEL_VIEW,
      creationParams: <String, String>{"text": text},
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}