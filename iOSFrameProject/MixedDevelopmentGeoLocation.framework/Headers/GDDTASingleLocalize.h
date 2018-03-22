/**
 * @header GDDTASingleLocalize
 * @abstract 高德地图单次定位
 * @author作者
 * @version 1.00 2017/10/16 Creation
 */

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface GDDTASingleLocalize : NSObject

/**
 *  配置定位工具
 *
 *  @param webViews  浏览器对象
 */
- (void)initLocalizeTool:(WKWebView *)webViews;

/**
 *  开始定位
 */
- (void)startLocalize;

@end
