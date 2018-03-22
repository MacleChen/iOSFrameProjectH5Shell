//
//  FunctionSystemCameraAlbum.h
//  MixedDevelopmentCameraAndPhotoAlbum
//
//  Created by jointsky on 2017/11/1.
//  Copyright © 2017年 陈帆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

/**
 获取拍照相册类型
 
 - SystemCameraAlbumTypeCamera: 获取拍照
 - SystemCameraAlbumTypeAlbum: 获取相册
 - SystemCameraAlbumTypeAll: 获取拍照和相册
 */
typedef NS_ENUM(NSInteger, SystemCameraAlbumType) {
    SystemCameraAlbumTypeCamera,
    SystemCameraAlbumTypeAlbum,
    SystemCameraAlbumTypeAll,
};

@interface FunctionSystemCameraAlbum : NSObject

/**
 初始化方法
 
 @param viewController 当前控制器
 @param webView 当前webView
 @param cameraAlbumTitle 显示窗口的title
 @param cameraAlbumType 功能类型
 @return 实体对象
 */
- (instancetype)initWithCurrentVC:(UIViewController *)viewController andWebView:(WKWebView *)webView andTitle:(NSString *)cameraAlbumTitle andType:(SystemCameraAlbumType)cameraAlbumType;


/**
 设置cameraAlbum类型方法
 
 @param viewController 当前控制器
 @param webView 当前webView
 @param cameraAlbumTitle 显示窗口的title
 @param cameraAlbumType 功能类型
 @return 实体对象
 */
- (void)setSystemCameraAlbumWithCurrentVC:(UIViewController *)viewController andWebView:(WKWebView *)webView andTitle:(NSString *)cameraAlbumTitle andType:(SystemCameraAlbumType)cameraAlbumType;

@end
