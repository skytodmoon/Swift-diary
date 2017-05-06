//
//  HomeimageScrollCell.h
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageScrollView.h"

@interface HomeimageScrollCell : UITableViewCell

@property(nonatomic, strong) ImageScrollView *imageScrollView;
@property(nonatomic, strong) NSArray *imageArr;

-(void)setImageArray:(NSArray *)imageArray;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier frame:(CGRect)frame;

@end
