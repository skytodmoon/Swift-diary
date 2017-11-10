//
//  ReplyDataModel.m
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "ReplyDataModel.h"

@implementation TargetCommentModel

@end

@implementation TargetComicModel

@end

@implementation ReplyCommentsModel

@end

@implementation ReplyDataModel


+ (NSDictionary *)mj_objectClassInArray {
    return @{@"comments":[ReplyCommentsModel class]};
}

+ (NSArray<NSString *> *)setupDataFieldsIsModelArray:(BOOL *)isModelArray {
    return @[@"data"];
}

@end
