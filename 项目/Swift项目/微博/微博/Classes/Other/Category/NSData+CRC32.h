//
//  NSData+CRC32.h
//  微博
//
//  Created by 金亮齐 on 2017/9/4.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <zlib.h>

@interface NSData (CRC32)

-(int32_t) crc_32;

-(uLong)getCRC32;

@end
