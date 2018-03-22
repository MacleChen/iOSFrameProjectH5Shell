//
//  FunctionSystemVideoRec.h
//  MixedDevelopmentSystemVideoRecord
//
//  Created by jointsky on 2017/11/16.
//  Copyright © 2017年 陈帆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

/**
 获取视频录制类型
 
 - SystemVideoRecordAndLibrary: 获取视频录制和媒体库
 - SystemVideoRecord: 获取视频录制
 - SystemVideoLibrary: 获取媒体库
 */
typedef NS_ENUM(NSInteger, SystemVideoType) {
    SystemVideoRecordAndLibrary,
    SystemVideoRecord,
    SystemVideoLibrary,
};

@interface FunctionSystemVideoRec : NSObject

/**
 设置SystemVideo类型方法
 
 @param viewController 当前控制器
 @param webView 当前webView
 @param systemVideoTitle 显示窗口的title
 @param systemVideoType 功能类型
 */
- (void)setSystemCameraAlbumWithCurrentVC:(UIViewController *)viewController andWebView:(WKWebView *)webView andTitle:(NSString *)systemVideoTitle andType:(SystemVideoType)systemVideoType;

@end
