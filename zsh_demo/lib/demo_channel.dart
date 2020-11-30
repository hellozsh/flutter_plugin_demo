
part of zsh_demo;


const NAMESPACE = 'plugins.zsh.com/zsh_demo';

// 用于flutter 发送消息给原生
const MethodChannel testChannel = const MethodChannel('$NAMESPACE/testChannel');


const EventChannel eventChannel = const EventChannel('$NAMESPACE/receive');


const String LABEL_VIEW = '$NAMESPACE/labelView';