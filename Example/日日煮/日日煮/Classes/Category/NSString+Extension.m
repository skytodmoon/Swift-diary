//
//  NSString+Extension.m
//  日日煮
//
//  Created by 金亮齐 on 2017/3/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)


- (NSURL *)yx_URL{
    return [NSURL URLWithString:self];
}

- (NSURL *)yx_fileURL{
    return [NSURL fileURLWithPath:self];
}

- (UIImage *)yx_image{
    return [UIImage imageNamed:self];
}

- (UIImageView *)yx_imageView{
    return [[UIImageView alloc] initWithImage:self.yx_image];
}


@end
