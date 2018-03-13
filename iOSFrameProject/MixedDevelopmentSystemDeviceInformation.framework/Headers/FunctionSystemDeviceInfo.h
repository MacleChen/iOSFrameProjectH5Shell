//
//  FunctionSystemDeviceInfo.h
//  MixedDevelopmentSystemDeviceInformation
//
//  Created by 陈帆 on 2017/12/5.
//  Copyright © 2017年 陈帆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface FunctionSystemDeviceInfo : NSObject

- (instancetype)initWithWebView:(WKWebView *)webView;

/**
 获取当前设备基本信息
 */
- (void)getCurrentDeviceInformation;

@end
