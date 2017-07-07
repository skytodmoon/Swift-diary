//
//  NSString+Size.m
//  美团
//
//  Created by 金亮齐 on 2017/7/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

-(CGSize)boundingRectWithSize:(CGSize)size withFont:(NSInteger)font{

    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:font]};
    
    CGSize retSize = [self boundingRectWithSize:size
                                        options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    
    return retSize;
}

@end
