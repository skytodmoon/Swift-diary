//
//  UITableViewCell+FFAdd.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "UITableViewCell+FFAdd.h"
#import <objc/runtime.h>

static char indexPathKey,cellModelKey;

@implementation UITableViewCell (FFAdd)

-(void)setIndexPath:(NSIndexPath *)indexPath {
    objc_setAssociatedObject(self, &indexPath, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSIndexPath *)indexPath {
    return objc_getAssociatedObject(self, &indexPathKey);
}

-(void)setCellModel:(FFViewModel *)cellModel {
    objc_setAssociatedObject(self, &cellModelKey, cellModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(FFViewModel *)cellModel {
    return objc_getAssociatedObject(self, &cellModelKey);
}

@end
