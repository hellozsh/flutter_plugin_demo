//
//  LabelViewFactory.m
//  zsh_demo
//
//  Created by 周素华 on 30/11/2020.
//

#import "LabelViewFactory.h"

 
@implementation LabelViewFactory {
    
    NSObject<FlutterBinaryMessenger>* _messenger;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
    self = [super init];
    if (self) {
      _messenger = messenger;
    }
    return self;
}

/// 如何解析;   这里需要和flutter方保持一致
- (NSObject<FlutterMessageCodec>*)createArgsCodec {
    
    return [FlutterStandardMessageCodec sharedInstance];
}

- (NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args {
    
    IosLabelView *labelView = [[IosLabelView alloc] initWithFrame:frame
                                                   viewIdentifier:viewId
                                                        arguments:args
                                                  binaryMessenger:_messenger];
     return labelView;
}

@end


@implementation IosLabelView {
    int64_t _viewId;
    FlutterMethodChannel* _channel;
    UILabel * _uiLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
               viewIdentifier:(int64_t)viewId
                    arguments:(id _Nullable)args
              binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
    
    if (self = [super init]) {
        NSString *text = @"ios UILabel";

        if ([args isKindOfClass:[NSDictionary class]]) {
            NSDictionary *params = (NSDictionary *)args;
            if([[params allKeys] containsObject:@"text"]){
                if ([[params valueForKey:@"text"] isKindOfClass:[NSString class]]) {
                   text = [NSString stringWithFormat:@"%@:%@",text,[params valueForKey:@"text"]];
                }
            }
        }
        _uiLabel = [[UILabel alloc] initWithFrame:frame];
        _uiLabel.textAlignment = NSTextAlignmentCenter;
        _uiLabel.text = text;
        _uiLabel.font = [UIFont systemFontOfSize:30];
         
        NSString* channelName = [NSString stringWithFormat:@"plugins.zsh.com/zsh_demo/labelView_%lld", viewId];
        _channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        __weak __typeof__(self) weakSelf = self;
        [_channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
            [weakSelf onMethodCall:call result:result];
        }];
    }
    return self;
}

- (nonnull UIView *)view {
    return _uiLabel;
}

- (void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    
  if ([[call method] isEqualToString:@"updateSettings"]) {
      
  } else {
      
     result(FlutterMethodNotImplemented);
  }
}

@end
