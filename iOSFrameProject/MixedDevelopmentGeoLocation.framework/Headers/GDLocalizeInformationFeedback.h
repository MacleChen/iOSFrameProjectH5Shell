/**
 * @header GDLocalizeInformationFeedback
 * @abstract 高德单次定位信息反馈
 * @author作者
 * @version 1.00 2017/10/16 Creation
 */

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface GDLocalizeInformationFeedback : NSObject

/**
 *  获取Documents目录
 *
 *  @param webViews  浏览器对象
 *  @param longitude  定位经度
 *  @param latitude  定位纬度
 *  @param address  定位详细地址
 */
+ (void)jsCallOC:(WKWebView *)webViews :(double)longitude :(double)latitude :(NSString *)address andProvince:(NSString *)province andCity:(NSString *)city andCounty:(NSString *)county andStreet:(NSString *)street;

@end
