/**
 * @header FunctionStartsLocalize
 * @abstract 启动
 * @author作者
 * @version 1.00 2017/10/16 Creation
 */

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface FunctionStartsLocalize : NSObject

/**
 *  设置高德地图key
 *
 *  返回结果 NSString
 */
- (NSString *)settingGDDTKey;

/**
 *  配置定位工具
 *
 *  @param webViews  浏览器对象
 *  @param identificationTag  功能标识
 */
- (void)classificationStart:(WKWebView *)webViews :(NSString *)identificationTag;

@end
