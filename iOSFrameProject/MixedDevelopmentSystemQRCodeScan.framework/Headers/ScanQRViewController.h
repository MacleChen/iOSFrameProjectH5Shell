//
//  ScanQRViewController.h
//  MixedDevelopmentSystemQRCodeScan
//
//  Created by 陈帆 on 2017/11/27.
//  Copyright © 2017年 陈帆. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WKWebView;
@interface ScanQRViewController : UIViewController


/**
 自定义初始化方法
 
 @param webView webView
 @param title 导航栏标题
 @param titleColor 标题颜色
 @param titleBgColor 导航栏背景颜色
 @return 实体对象
 */
- (instancetype)initWithWebView:(WKWebView *)webView andTitle:(NSString *)title andTitleColor:(UIColor *)titleColor andTitleBgColor:(UIColor *)titleBgColor;

@end
