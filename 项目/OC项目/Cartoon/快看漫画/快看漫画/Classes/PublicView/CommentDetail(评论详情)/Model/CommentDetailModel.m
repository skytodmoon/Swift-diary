//
//  CommentDetailModel.m
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "CommentDetailModel.h"
#import "CommentsModel.h"

@implementation CommentDetailModel
+ (NSArray<NSString *> *)setupDataFieldsIsModelArray:(BOOL *)isModelArray {
    return @[@"data"];
}


+ (NSDictionary *)mj_objectClassInArray {
    return @{@"comments":[CommentsModel class]};
}

@end
