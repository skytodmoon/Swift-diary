//
//  MerAroundGroupModel.h
//  美团
//
//  Created by 金亮齐 on 2017/7/4.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MerAroundGroupModel : NSObject

@property (nonatomic, strong) NSString *squareimgurl;/**< 图片url */
@property (nonatomic, strong) NSString *mname;/**< 店名 */
@property (nonatomic, strong) NSString *range;/**< 范围 */
@property (nonatomic, strong) NSString *title;/**<  标题 */
@property (nonatomic, strong) NSNumber *price;/**<  现价 */

@property (nonatomic, strong) NSNumber *value;/**<  原价 */
@property (nonatomic, strong) NSNumber *rating;/**<  评分 */
@property (nonatomic, strong) NSNumber *rate_count;
@property (nonatomic, strong) NSNumber *id;


@end
