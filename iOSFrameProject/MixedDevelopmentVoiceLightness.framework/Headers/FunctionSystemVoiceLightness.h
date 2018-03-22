//
//  FunctionSystemVoiceLightness.h
//  MixedDevelopmentVoiceLightness
//
//  Created by 陈帆 on 2017/12/5.
//  Copyright © 2017年 陈帆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface FunctionSystemVoiceLightness : NSObject

-(instancetype)initWithWebView:(WKWebView *)webView;

/**
 把音量调大
 */
- (void)turnUpVoiceWithAnimation:(BOOL)isAnimation;

/**
 把音量调小
 
 @param isAnimation 是否有动画
 */
- (void)turnDownVoiceWithAnimation:(BOOL)isAnimation;


/**
 设置音量大小
 
 @param voiceValue 音量值（0.0~1.0范围）
 @param isAnimation 是否动画
 */
- (void)turnVoiceWithValue:(float)voiceValue AndAnimation:(BOOL)isAnimation;



/**
 把亮度调大
 */
- (void)turnUpLightness;

/**
 把亮度调小
 */
- (void)turnDownLightness;

/**
 调节指定亮度
 
 @param lightValue 亮度值（0~1.0范围）
 */
- (void)turnLightnessWithValue:(float)lightValue;

@end
