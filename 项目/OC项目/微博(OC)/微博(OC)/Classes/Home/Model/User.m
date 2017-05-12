
//  Weibo
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "User.h"

@implementation User

+(instancetype)userWithDict:(NSDictionary *)dict {
    
    User * user= [[self alloc]init];
    user.name = dict[@"name"];
    user.idstr = dict[@"idstr"];
    user.profile_image_url = dict[@"profile_image_url"];
    
    return user;
    
}

-(void)setMbtype:(int)mbtype {
    
    _mbtype = mbtype;
    self.vip = mbtype > 2;
    
}
@end
