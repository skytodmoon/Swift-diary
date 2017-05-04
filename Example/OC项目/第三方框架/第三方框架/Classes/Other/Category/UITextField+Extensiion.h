//
//  UITextField+Extensiion.h
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/17.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extensiion)

/*** **
 手机号码 13[0-9],14[5|7|9],15[0-3],15[5-9],17[0|1|3|5|6|8],18[0-9]
 移动：134[0-8],13[5-9],147,15[0-2],15[7-9],178,18[2-4],18[7-8]
 联通：13[0-2],145,15[5-6],17[5-6],18[5-6]
 电信：133,1349,149,153,173,177,180,181,189
 虚拟运营商: 170[0-2]电信  170[3|5|6]移动 170[4|7|8|9],171 联通
 上网卡又称数据卡，14号段为上网卡专属号段，中国联通上网卡号段为145，中国移动上网卡号段为147，中国电信上网卡号段为149
 */
+(BOOL)isMobilePhone:(NSString *)phoneNum;

/***身份证格式18位和合法验证 */
+(BOOL)checkUserID:(NSString *)userID;

/***  车牌号格式校验 */
+(BOOL)checkCarID:(NSString *)carID;

/***  6~16位数字/字母/下划线组成的密码格式校验*/
+(BOOL)checkPws:(NSString *)pswStr;

/***  判断字符串是否全为[(数字)OR(数字|字母)OR(字母)OR(汉字)]*/
+(BOOL)isAllNumber:(NSString *)string;

//银行卡格式验证
+(BOOL)isBankCard:(NSString *)bankCard;

//邮箱格式验证
+(BOOL)isEmail:(NSString *)email;
@end
