//
//  ViewController.m
//  CDZPickerViewDemo
//
//  Created by Nemocdz on 2016/11/18.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import "ViewController.h"
#import "CDZPicker.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *label;
- (IBAction)single:(UIButton *)sender;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)showPicker:(UIButton *)sender {
    
}
- (IBAction)single:(UIButton *)sender {
    CDZPickerBuilder *builder = [CDZPickerBuilder new];
    builder.showMask = YES;
    [CDZPicker showSinglePickerInView:self.view withBuilder:builder strings:@[@"objective-c",@"java",@"python",@"php"] confirm:^(NSArray<NSString *> * _Nonnull strings, NSArray<NSNumber *> * _Nonnull indexs) {
        self.label.text = strings.firstObject;
        NSLog(@"strings:%@",strings);
    }cancel:^{
        NSLog(@"失败");
    }];
}



@end
