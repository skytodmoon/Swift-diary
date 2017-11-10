//
//  FeedsDataModel.m
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "FeedsDataModel.h"

@implementation FeedsContentModel

@end


@implementation FeedsModel


- (void)setContent:(FeedsContentModel *)content {
    _content = content;
    if (!content) return;
    
    self.thumbImages = [self getImageUrlsWithContentModel:content WithAppendStr:@"-c.w170.jpg"];
    self.photoImages = [self getImageUrlsWithContentModel:content WithAppendStr:nil];
    
}

- (NSArray *)getImageUrlsWithContentModel:(FeedsContentModel *)model WithAppendStr:(NSString *)appendStr {
    
    NSMutableArray *imageUrls = [[NSMutableArray alloc] initWithCapacity:model.images.count];
    
    for (NSString *url in model.images) {
        
        NSMutableString *imageUrl = model.image_base.mutableCopy;
        
        [imageUrl appendString:url];
        
        if (appendStr) [imageUrl appendString:appendStr];
        
        [imageUrls addObject:[NSURL URLWithString:imageUrl]];
        
    }
    
    return imageUrls.copy;
}

@end

@implementation FeedsDataModel

+ (NSArray<NSString *> *)setupDataFieldsIsModelArray:(BOOL *)isModelArray {
    return @[@"data"];
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"feeds" : [FeedsModel class]};
}

@end
