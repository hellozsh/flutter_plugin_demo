//
//  LabelViewFactory.h
//  zsh_demo
//
//  Created by 周素华 on 30/11/2020.
//

#import <UIKit/UIKit.h>
#import <Flutter/Flutter.h>

@interface LabelViewFactory : NSObject<FlutterPlatformViewFactory>

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;

@end


@interface IosLabelView : NSObject<FlutterPlatformView>

- (instancetype)initWithFrame:(CGRect)frame
               viewIdentifier:(int64_t)viewId
                    arguments:(id _Nullable)args
              binaryMessenger:(NSObject<FlutterBinaryMessenger>*_Nullable)messenger;

@end

 
