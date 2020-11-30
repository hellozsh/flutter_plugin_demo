#import <Flutter/Flutter.h>

@interface ZshDemoPlugin : NSObject<FlutterPlugin>

@property (nonatomic, strong) FlutterMethodChannel* channel;

@property (nonatomic, strong) UIApplication *application;

@end


@interface ToastView : UIView

+ (ToastView *)show:(NSString *)text rootVc:(UIViewController *)rootVc;

- (void)cancel;

@end
