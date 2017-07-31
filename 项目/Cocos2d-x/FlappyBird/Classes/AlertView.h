//
//  AlertView.h
//  FlappyBird
//
//  FlappyBird
//
//  Created by 金亮齐 on 2017/7/25.
//
//

#import <Foundation/Foundation.h>

@interface AlertView : UIAlertView

typedef void (^ButtonClick)();

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
            cancelButtonTitle:(NSString *)cancelButtonTitle
                okButtonTitle:(NSString *)okButtonTitle
                     oklClick:(ButtonClick)okClick
                  cancelClick:(ButtonClick)cancelClick;

@end
