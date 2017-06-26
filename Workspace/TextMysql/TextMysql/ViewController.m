//
//  ViewController.m
//  TextMysql
//
//  Created by 金亮齐 on 2017/6/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "ViewController.h"
#import "DBManager.h"
#import "Person.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
    // Do any additional setup after loading the view.
}

- (void) test {
    DBManager *mgr = [DBManager sharedManager];
    //查询数据
    NSArray *array = [mgr getAllPersons];
    for (int i = 0; i < array.count; i++) {
        NSLog(@"%@",array[i]);
    }
    
    
    //添加数据
    Person *p = [[Person alloc] init];
    p.name = @"Mrs Wang";
    p.age = @"30";
    p.sex = @"man";
    p.tel = @"11111111111";
    [mgr addPerson:p];
    
    
     //删除数据
//     p.ID = @"4";
//     [mgr deletaPerson:p];
    
}
- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
