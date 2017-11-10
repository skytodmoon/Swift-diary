//
//  StatusImageContentView.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusImageContentView : UICollectionView

@property (nonatomic,copy)   NSArray<NSURL *> *photoImages; //原图

@property (nonatomic,copy)   NSArray<NSURL *> *thumbImages; //缩略图

+ (instancetype)makeStatusImageContentView ;

@end
