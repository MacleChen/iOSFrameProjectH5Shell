//
//  FunctionSystemVoiceInput.h
//  MixedDevelopmentSystemVoiceInput
//
//  Created by jointsky on 2017/11/9.
//  Copyright © 2017年 陈帆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface FunctionSystemVoiceInput : NSObject


/**
 初始化--- 加入配置文件名称
 
 @param fileName 配置文件名
 @return 实体
 */
- (instancetype)initWithConfigationFileName:(NSString *)fileName;


// 开启语音
- (void)startVoiceInputWithWebView:(WKWebView *)webView;


// 关闭语音并返回语音转文字
- (void)closeVoiceInputWithWebView:(WKWebView *)webView;



// 取消语音录制
- (void)cancelVoiceInputWithWebView:(WKWebView *)webView;
@end
