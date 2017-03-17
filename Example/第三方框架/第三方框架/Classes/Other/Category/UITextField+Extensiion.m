//
//  UITextField+Extensiion.m
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/17.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "UITextField+Extensiion.h"

@implementation UITextField (Extensiion)

/**
 *  是否是手机号
 */
+(BOOL)isMobilePhone:(NSString *)phoneNum{
    NSString *MOBIL = @"^1(3[0-9]|4[579]|5[0-35-9]|7[01356]|8[0-9])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBIL];
    if ([regextestmobile evaluateWithObject:phoneNum]) {
        return YES;
    }
    return NO;
}

/**
 *  身份证号码18位判断
 */
+(BOOL)checkUserID:(NSString *)userID{
    //长度不能为18的都排除
    if (userID.length!= 18) {
        return NO;
    }
    //验证格式
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    
    BOOL flag = [identityCardPredicate evaluateWithObject:userID];
    
    if (!flag) {
        //格式错误
        return flag;
    }else{
        //格式正确判断是否合法
        
        //将前17位加权因子保存在数组里
        NSArray *idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
        //这是除以11后，可能产生的11位余数,验证码,也保存成数组
        NSArray *idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
        
        //用来保存前17位各自乘加权因子后的总和
        NSInteger idCardWiSum = 0;
        for (int i = 0; i < 17; i++) {
            NSInteger subStrIndex = [[userID substringWithRange:NSMakeRange(i, 1)] integerValue];
            NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
            
            idCardWiSum+= subStrIndex * idCardWiIndex;
        }
        //计算出验证码所在数组的位置
        NSInteger idCardMod = idCardWiSum%11;
        
        //得到最后一位身份证号码
        NSString *idCardLast = [userID substringWithRange:NSMakeRange(17, 1)];
        
        //如果等于2,则说明验证码是10,身份证号码最后一位应该是x
        if (idCardMod == 2) {
            if ([idCardLast isEqualToString:@"X"] || [idCardLast isEqualToString:@"x"]){
                return YES;
            }else{
                return NO;
            }
            }else{
                //用计算出验证码和最后一位身份证号码匹配,如果一致，说明通过,否则无效的身份证号码
                if ([idCardLast isEqualToString:[idCardYArray objectAtIndex:idCardMod]]) {
                    return YES;
                }else{
                    return NO;
                }
            }
        }
    }
/**
 *车牌号格式校验
 */
+(BOOL)checkCarID:(NSString *)carID{
    if (carID.length!= 7) {
        return NO;
    }
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-hj-zA-HJ-Z]{1}[a-hj-zA-HJ-Z_0-9]{4}[a-hj-zA-HJ-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    return [carTest evaluateWithObject:carID];
    
    return YES;
}
/**
 *  6~16位数字/字母/下划线组成的密码格式校验
 */
+(BOOL)checkPws:(NSString *)pswStr{
    NSString *pattern = @"^[A-Za-z0-9_]{6,16}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    return [pred evaluateWithObject:pswStr];
}

/***  判断字符串是否全为[(数字)OR(数字|字母)OR(字母)OR(汉字)]*/
+(BOOL)isAllNumber:(NSString *)string{

    NSString *conditon = @"^[0-9]*$";//是否都是数字
    //    NSString *condition = @"^[A-Za-z]+$";//是否都是字母
    //    NSString *condition = @"^[A-Za-z0-9]+$";//是否都是字母和数字{6,16}
    //    NSString *condition = @"^[A-Za-z0-9]{6,16}$";//是否都是字母和数字且长度在[6,16]
    //    NSString *condition = @"^[\u4e00-\u9fa5]{0,}$";//只能输入汉字
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",conditon];
    
    return [predicate evaluateWithObject:string];
}

/**
 *  银行卡格式验证
 */
+(BOOL)isBankCard:(NSString *)bankCard
{
    if (bankCard.length < 16) {
        return NO;
    }
    //奇数求和
    NSInteger oddsum = 0;
     //偶数求和
    NSInteger evensum = 0;
    NSInteger allsum = 0;
    NSInteger cardNoLength = (NSInteger)[bankCard length];
    // 取了最后一位数
    NSInteger lastNum = [[bankCard substringFromIndex:cardNoLength-1] intValue];
    //测试的是除了最后一位数外的其他数字
    bankCard = [bankCard substringToIndex:cardNoLength - 1];
    for (NSInteger i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [bankCard substringWithRange:NSMakeRange(i-1, 1)];
        NSInteger tmpVal = [tmpString integerValue];
        //卡号位数为奇数
        if (cardNoLength % 2 ==1 ) {
            //偶数位置
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                //奇数位置
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
}

/**
 *  邮箱格式验证
 */
+(BOOL)isEmail:(NSString *)email{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}




@end
