//
//  Constan.h
//  日日煮
//
//  Created by 金亮齐 on 2017/3/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#ifndef Constan_h
#define Constan_h




/** 屏幕宽度 */
#define kScreenW [UIScreen mainScreen].bounds.size.width

/** 屏幕高度 */
#define kScreenH [UIScreen mainScreen].bounds.size.height

/** 三原色的设置 */
#define kRGBColor(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

/** Documents文件夹的路径 */
#define kDocPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

/** appdelegate的实例对象 */
#define kAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

/** 把self转化为 __weak __block的方式, 方便的在block中使用而不导致内存循环应用问题 */

/** 在宏中使用 \ 可以换行 */
#define WK(weakSelf) \
__weak __typeof(&*self)weakSelf = self;\

/** Bundle路径 */
#define kMyBundlePath [[NSBundle mainBundle]pathForResource:@"MyBundle" ofType:@"bundle"]

/** 复制协议 */
#define kCopyZoneMethod \
- (id)copyWithZone:(NSZone *)zone { return [self modelCopy]; }

/** 归档解档协议 */
#define kCodingMethod \
- (void)encodeWithCoder:(NSCoder *)aCoder { [self modelEncodeWithCoder:aCoder]; } \
- (id)initWithCoder:(NSCoder *)aDecoder { self = [super initWithCoder:aDecoder]; return [self modelInitWithCoder:aDecoder]; }

/** 判断对象相等方法 */
#define kEqualObjMethod \
- (BOOL)isEqual:(id)object {\
return [self modelIsEqual:object];\
}

/** 自动完成对象描述 */
#define kDescriptionMethod \
- (NSString *)description { return [self modelDescription]; }

/** 对象Hash */
#define kHashMethod \
- (NSUInteger)hash { return [self modelHash]; }

#endif /* Constan_h */
