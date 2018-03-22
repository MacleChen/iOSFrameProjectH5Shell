//
//  GlobalPrefixHeader.swift
//  EnvironmentSource
//
//  Created by jointsky on 2016/11/28.
//  Copyright © 2016年 陈帆. All rights reserved.
//

import UIKit
import Foundation


/*******************   SCREEN  屏幕的尺寸     ******************/
let SCREEN_WIDTH = UIScreen.main.bounds.size.width              // 宽
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height            // 高


/********************    application Delegate  *************/
let APP_DELEGATE = UIApplication.shared.delegate as! AppDelegate


/*****************     VIEW 界面视图设置     *****************/
// MARK:     建议：导航栏中的按钮图片的大小一般为26  26@2x   26@3x
// 导航栏和状态栏的高度
let NAVIGATION_AND_STATUS_HEIGHT: CGFloat = (44.0+20.0)
 // 工具栏的高度
let TOOL_BAR_HEIGHT: CGFloat = 49.0
// tabBar和navBar上的图标的标准大小
let ITEM_IMAGE_CGSZE = CGSize.init(width: 26, height: 26)
// 状态栏的高度
let STATUS_BAR_HEIGHT: CGFloat = 20.0
// 导航栏的高度
let NAVIGATION_BAR_HEIGHT: CGFloat = 44.0
// 一般cell的高度
let CELL_NORMAL_HEIGHT: CGFloat = 44.0
// 每页显示的cell个数
let DEFAULT_IMAGE_CELL_PAGESIZE = "19"


/*********************   COLOR  - 颜色      **************************/
// 系统普通颜色
let COLOR_NORMAL_SYSTEM = UIColorRGBA_Selft(r: 255, g: 255, b: 255, a: 1.0)
// 系统高亮颜色
let COLOR_HIGHT_LIGHT_SYSTEM = UIColorRGBA_Selft(r: 252, g: 81, b: 81, a: 1.0)
// 分割线的颜色
let COLOR_SEPARATOR_LINE = UIColorFromRGB(rgbValue: 0xd9d9d9)
// tableView 的背景色
let BG_COLOR_TABLE_OR_COLLECTION = UIColorFromRGB(rgbValue: 0xf1f0f0)
// light Gay color
let COLOR_LIGHT_GAY = UIColorFromRGB(rgbValue: 0x999999)
// Gay color
let COLOR_GAY = UIColorFromRGB(rgbValue: 0x666666)
// dark Gay color
let COLOR_DARK_GAY = UIColorFromRGB(rgbValue: 0x333333)

// carbon coin color
let COLOR_CARBON_COIN = UIColorFromRGB(rgbValue: 0xe59c1e)


/*********************    FONT  - 字体样式     **********************/
//正常系统显示的字体
let FONT_NORMAL_FAMILY = "Helvetica-Light"


/*********************   FONTSIZE  - 字体大小     ********************/
// MARK: 导航栏上的字体大小
let NAVIGATION_TITLE_FONT_SIZE:CGFloat = 18.0
// MARK: 大字体
let FONT_BIG_SIZE:CGFloat = 16.0
// MARK: 大字体
let FONT_SYSTEM_SIZE:CGFloat = 15.0
// MARK: 标准字体
let FONT_STANDARD_SIZE:CGFloat = 14.0
// mark: 小字体
let FONT_SMART_SIZE:CGFloat = 12.0
// mark: 非常小字体
let FONT_VERY_SMART_SIZE:CGFloat = 9.0



/********************     layout 布局设置    ****************/
// 标准的圆角弧度
let CORNER_NORMAL:CGFloat = 5.0
// 标准的圆角弧度
let CORNER_SMART:CGFloat = 3.0
// 标准的圆角弧度
let BORDER_WIDTH: CGFloat = 0.5


/*******************    DATE 日期时间设置     *********************/
// 日期的标准格式
let DATE_STANDARD_FORMATTER = "yyyy-MM-dd HH:mm:ss"
// 验证码重新获取描述（单位：s）
let RUN_LOOP_VALUE = 60


/************************     DICT_KEY 自定义         ********************/
let DICT_TITLE = "title"             // 标题
let DICT_SUB_TITLE = "subTitle"      // 标题
let DICT_IMAGE_PATH = "imagePath"    // 本地图片地址
let DICT_IDENTIFIER = "identifier"   // ID
let DICT_IS_NEXT = "isNext"          // 是否有跳转
let DICT_USER_INFO  = "userInfo"     // 用户信息字典key
let DICT_SUB_VALUE1  = "value1"      // value1的key
let DICT_SUB_VALUE2  = "value2"      // value2的key
let DICT_SUB_VALUE3  = "value3"      // value3的key
let DICT_IS_SHOW_COIN_TASK = "isShowCoinTask"   // 是否显示过碳币任务列表


/*********************     LOCATION  定位设置     **********************/
/// 默认 未定位成功的城市 和 code
let DEFAULT_LOCATIONFAILED_CITY = "北京市"
let DEFAULT_LOCATIONFAILED_CODE = "110000000"
let DEFAULT_CITY_CENTER_LONGITUDE = "116.403406"
let DEFAULT_CITY_CENTER_LATITUDE = "39.91582"
/// 定位保存值
let LOCATION_ADDRESS = "locationAddress"        // 定位地址
let LOCATION_LATITUDE = "locationLatitude"      // 定位维度
let LOCATION_LONGTITUDE = "locationLongitude"   // 定位经度


/*****************     IMAGE_DEFAULT  默认图片     ********************/
// 默认返回键的图片地址
let DEFAULT_BACK_IMAGE_PATH = "default_back_icon.png"
// 默认的用户头像
let DEFAULT_USER_ICON = UIImage(named: "defaultUserImage.png")
// 默认App图标
let DEFUALT_APP_ICON = UIImage(named: "default_app_icon.png")



/****************    AIR_QUALITY - 空气质量设置    **********************/
let PHOTO_PM_25 = "pm25"                        // Pm2.5


/****************  NOTIFICATION - 消息通知机制    *********************/
let NOTIFICATION_UPDATE_UserInfo = "NotificationUpdateUserInfo"     // 用户消息通知
let NOTIFICATION_UPDATE_PhotoInfo = "NotificationUpdatePhotoInfo"   // 图片消息通知
let NOTIFICATION_UPDATE_UserOtherLogin = "NotificationUserOtherLogin"   // 用户其它地方登录通知
let NOTIFICATION_UPDATE_UserRegister = "NotificationUserRegister"       // 用户注册成功通知
let NOTIFICATION_UPDATE_CoinTaskUpdate = "NotificationCoinTaskupdate"   // 碳币任务更新


/**************   ACCOUNT - 账户信息    ****************/
//"https://www.baidu.com"   "http://www.ctcenv.com/edps-app/"  “http://www.ctcenv.com:8880”
let REQUEST_URL_INIT =  "http://www.ctcenv.com:8880"


/*****************   CHARACTER 字符个数     ******************/
let PHOTO_DESCRIPTION_LENGTH = 250 // 图片描述（字符）
let SUGGEST_INFO_LENGTH = 250 //  意见反馈(字符）
let WORDCOUNT_USERNAME = 20   // 用户昵称（字符）
let WORDCOUNT_USER_SPEAK = 50 // 用户说说长度（字符）
let WORDCOUNT_USER_PASSWORD = 20    // 用户密码长度（字符）
let WORDCOUNT_USER_PASSWORD_MIN = 6 // 用户密码长度（字符）
let WORDCOUNT_USER_PHONE = 11   // 手机号长度（字符）
let WORDCOUNT_USER_EMAIL = 50   // 邮箱最大长度（字符）
let WORDCOUNT_CHECK_CODE = 6    // 手机验证码长度（字符）


/*****************    WORD_TIP 文字提示     ******************/
let RESPONSE_DATA_NIL = "请求到的数据为空"
let RESULT_WEB_ERROR = "网络异常，请稍后重试"
let OTHER_LOGING_TIP = "该用户已在其它地方登录"
let GLOBAL_USERINFO_NIL_TIP = "未获取到当前用户信息, 请重新登录"
let GLOBAL_CHECK_PHONE_NOT_SEND_TIP = "该手机号未发送验证码"
let GLOBAL_CHECK_PHONE_CHECK_CODE_TIP = "验证码不正确"
let GLOBAL_CHECK_PASSWORD_LENGTH_TIP = "密码长度6~20个字符"


/// 设置rgb颜色的方法
///
/// - parameter r: red
/// - parameter g: green
/// - parameter b: blue
/// - parameter a: alpha
///
/// - returns: UIColor
func UIColorRGBA_Selft(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}



/// 根据开始位置和长度截取字符串
///
/// - Parameters:
///   - textStr: 要截取的字符串
///   - start: 开始位置
///   - length: 截取长度
/// - Returns: 截取后的字符串
func CUTString(textStr: String, start:Int, length:Int = -1) -> String {
    var len = length
    if len == -1 {
        len = textStr.count - start
    }
    let st = textStr.index(textStr.startIndex, offsetBy:start)
    let en = textStr.index(st, offsetBy:len)
    return String(textStr[st ..< en])
}


/// 16进制的方式设置颜色（eg. 0xff1122）
///
/// - Parameter rgbValue: 16进制颜色值
/// - Returns: UIColor
func UIColorFromRGB(rgbValue:Int) -> UIColor {
    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgbValue & 0xFF))/255.0, alpha: 1.0)
}


/// 获取默认的图片对象
///
/// - Returns: 默认占位图片
func DEFAULT_IMAGE() -> UIImage {
    let defaultImagePath = "default_image\((arc4random() % 5)+1)"
    return UIImage.init(named: defaultImagePath)!
}



/// PM2.5值对应的颜色获取方法
///
/// - Parameter pm25Value: PM2.5值
/// - Returns: UIColor
func colorPm25WithValue(pm25Value: Int) -> UIColor {
    if pm25Value >= 0 && pm25Value < 50 {
        return UIColorFromRGB(rgbValue: 0x67cf00)
    } else if pm25Value >= 50 && pm25Value < 100 {
        return UIColorFromRGB(rgbValue: 0xfdd100)
    } else if pm25Value >= 100 && pm25Value < 150 {
        return UIColorFromRGB(rgbValue: 0xff8901)
    } else if pm25Value >= 150 && pm25Value < 200 {
        return UIColorFromRGB(rgbValue: 0xff2500)
    } else if pm25Value >= 200 && pm25Value < 300 {
        return UIColorFromRGB(rgbValue: 0x991753)
    } else if pm25Value >= 300 && pm25Value < 500 {
        return UIColorFromRGB(rgbValue: 0x62091d)
    } else if pm25Value >= 500 {
        return UIColor.black
    } else {
        return UIColor.white
    }
}



/// 自定义带方法名和行号的打印方法
///
/// - parameter message:    message
/// - parameter methodName: 方法名
/// - parameter lineNumber: 行号
func myPrint<T>(message: T, methodName: String = #function, lineNumber: Int = #line) {
    #if DEBUG
        print("\(methodName)[\(lineNumber)]:\(message)")
    #endif
}






