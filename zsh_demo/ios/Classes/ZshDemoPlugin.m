#import "ZshDemoPlugin.h"

@implementation ZshDemoPlugin

NSString *const NAMESPACE = @"plugins.zsh.com/zsh_demo";

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    
    NSString *string = [NSString stringWithFormat:@"%@/testChannel",NAMESPACE];
    FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:string
            binaryMessenger:[registrar messenger]];
    ZshDemoPlugin* instance = [[ZshDemoPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

// 处理代码,返回
// 一定要调用result,否则flutter方不知道什么时候结束
- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
     
    if ([@"sendSimpleText" isEqualToString:call.method]) {
        
        result(nil);
    } else if ([@"sendText" isEqualToString:call.method]) {
        
        NSLog(@"ios 端 接收到 参数 %@",call.arguments);
        result(@(YES));
      } else {
      result(FlutterMethodNotImplemented);
    }
}

@end
