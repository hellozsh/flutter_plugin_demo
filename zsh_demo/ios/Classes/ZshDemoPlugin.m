#import "ZshDemoPlugin.h"
#import "LabelViewFactory.h"

 
@interface ReceiveStreamHandler : NSObject <FlutterStreamHandler>

@property (nonatomic, strong) FlutterEventSink sink;

@end

@implementation ReceiveStreamHandler

- (FlutterError * _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    
    self.sink = nil;
    return nil;
}

- (FlutterError * _Nullable)onListenWithArguments:(id _Nullable)arguments eventSink:(nonnull FlutterEventSink)events {
    
    self.sink = events;
    return  nil;
}

@end

NSString *const NAMESPACE = @"plugins.zsh.com/zsh_demo";


@interface ZshDemoPlugin() {
    
    int _time;
}

@property (nonatomic, strong) ReceiveStreamHandler *streamHandler;

@end

@implementation ZshDemoPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    
    NSString *string = [NSString stringWithFormat:@"%@/testChannel",NAMESPACE];
    FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:string
            binaryMessenger:[registrar messenger]];
    ZshDemoPlugin* instance = [[ZshDemoPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
    instance.channel = channel;
    
    [registrar addApplicationDelegate:instance];
    
    /// factory的注册
    LabelViewFactory* webviewFactory =
         [[LabelViewFactory alloc] initWithMessenger:registrar.messenger];
    NSString *viewType = [NSString stringWithFormat:@"%@/labelView",NAMESPACE];
    [registrar registerViewFactory:webviewFactory withId:viewType];
    
    /// EventChannel的注册
    NSString *eventString = [NSString stringWithFormat:@"%@/receive",NAMESPACE];
    FlutterEventChannel *receiveChannel = [FlutterEventChannel eventChannelWithName:eventString binaryMessenger:registrar.messenger];
    ReceiveStreamHandler *handler = [[ReceiveStreamHandler alloc] init];
    [receiveChannel setStreamHandler:handler];
    instance.streamHandler = handler;
 
    /// 这里模拟来消息,每隔10分钟,给sink添加数据
    [instance timer];
}

// 处理代码,返回
// 一定要调用result,否则flutter方不知道什么时候结束
- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
     
    if ([@"flutterToNative" isEqualToString:call.method]) {
         
        
        [ToastView show:[NSString stringWithFormat:@"ios端 接收到 flutter传来的方法"] rootVc:self.application.windows.firstObject.rootViewController];
        result(nil);
    } else if ([@"flutterToNativeWith" isEqualToString:call.method]) {
        
        __weak typeof(self)weakSelf = self;
       ToastView *toastView = [ToastView show:[NSString stringWithFormat:@"ios端 接收到 flutter传来的方法 参数:%@",call.arguments] rootVc:self.application.windows.firstObject.rootViewController];
        dispatch_async(dispatch_get_main_queue(), ^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [toastView cancel];
                [weakSelf.channel invokeMethod:@"nativeToFlutter" arguments:@"ios 参数"];
            });
        });
        
        result(@(YES));
      } else {
      result(FlutterMethodNotImplemented);
    }
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.application = application;
    
    return YES;
}

- (void)timer {
    
    __weak typeof(self)weakSelf = self;
    // GCD定时器
    static dispatch_source_t _timer;
    //设置时间间隔
    NSTimeInterval period = 5.f;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0);
    // 事件回调
    dispatch_source_set_event_handler(_timer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{

            self->_time ++;
            if (weakSelf.streamHandler.sink != nil) {
                weakSelf.streamHandler.sink([NSString stringWithFormat:@"%d",self->_time]);
            }
        });
    });

    // 开启定时器
    dispatch_resume(_timer);
}

@end
 

@interface ToastView ()

@property (nonatomic, weak) UIView *baseCoverView;

@property (nonatomic, weak) UILabel *textLbl;

@end

@implementation ToastView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self createView];
    }
    return self;
}

- (void)createView {
    
    self.backgroundColor = [UIColor clearColor];
    
    if (!_baseCoverView) {
        
        UIView *baseCoverView = [[UIView alloc] initWithFrame:self.bounds];
        baseCoverView.backgroundColor = [UIColor blackColor];
        baseCoverView.alpha = 0.5;
        [self addSubview:baseCoverView];
        _baseCoverView = baseCoverView;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapCoverView)];
        [_baseCoverView addGestureRecognizer:tap];
    }
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(20, 300, 300, 40)];
    backView.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 10;
    self.clipsToBounds = YES;
    [self addSubview:backView];
    
    UILabel *textLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    self.textLbl = textLbl;
    [backView addSubview:textLbl];
}

- (void)tapCoverView {
    
    [self cancel];
}

+ (ToastView *)show:(NSString *)text rootVc:(UIViewController *)rootVc {
    
    
    for (UIView *subView in rootVc.view.subviews) {
        if ([subView isKindOfClass:[ToastView class]]) {
            [(ToastView *)subView cancel];
        }
    }
    ToastView *alertView = [[ToastView alloc] initWithFrame:rootVc.view.bounds];
    [rootVc.view addSubview:alertView];
 
    alertView.textLbl.text = text;
    alertView.baseCoverView.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        
        alertView.baseCoverView.alpha = 0.6;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            //            [alertView setTop_DQExt:trueAlY];
        } completion:^(BOOL finished) {
            
        }];
    }];
    return alertView;
}

- (void)cancel {

    [self.baseCoverView removeFromSuperview];
    [self removeAllSubviews];
    [self removeFromSuperview];
    self.baseCoverView = nil;
}


- (void)removeAllSubviews {
    
    while (self.subviews.count)
    {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}


@end
