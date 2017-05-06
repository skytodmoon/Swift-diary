//
//  HomelbumCell.h
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomelbumDelegate <NSObject>

@optional
-(void)didSelectedAlbumAtIndex:(NSInteger)index;

@end

@interface HomelbumCell : UITableViewCell

@property(nonatomic, strong) NSArray *imgurlArray;

@property(nonatomic, assign) id<HomelbumDelegate> delegate;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier frame:(CGRect)frame;

@end
