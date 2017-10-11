//
//  ViewController.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"

/**
 在RAC中最核心的类RACSiganl,会用这个类就能用ReactiveCocoa开发了
 */

//RACSiganl:信号类,表示将来有数据传递，只要有数据改变，信号内部接收到数据，就会马上发出数据。
//信号类(RACSiganl)，只是表示当数据改变时，信号内部会发出数据，它本身不具备发送信号的能力，而是交给内部一个订阅者去发出。
//默认一个信号都是冷信号，也就是值改变了，也不会触发，只有订阅了这个信号，这个信号才会变为热信号，值改变了才会触发。
//如何订阅信号：调用信号RACSignal的subscribeNext就能订阅。

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //RACSiganl简单使用
    [self signal];
    
    //RACSubject简单使用
    [self subject];
    
    //RACReplaySubject的简单使用
    [self replaySubject];
    
    //RACSequence和RACTuple简单使用
    [self arrayTuple];
    [self dictTuple];
    
    //字典转模型
    [self dicToModel];
    
    //RACMulticastConnection简单使用
    [self multicastConnection];
    
    //RACCommand简单使用
    [self command];
    // Do any additional setup after loading the view, typically from a nib.
}

// RACSignal使用步骤：
// 1.创建信号 + (RACSignal *)createSignal:(RACDisposable * (^)(id subscriber))didSubscribe
// 2.订阅信号,才会激活信号. - (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock
// 3.发送信号 - (void)sendNext:(id)value
-(void)signal{
    //1.创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        //保存起来就不会被取消订阅
        subscriber = subscriber;
        //发送信号
        [subscriber sendNext:@1];
        
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"默认信号发送完毕被取消");
        }];
    }];
    
    //如果要取消就拿到RACDisposable
    //订阅信号
    RACDisposable *disposable = [signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    
    //取消订阅
    [disposable dispose];
}


// RACSubject使用步骤
// 1.创建信号 [RACSubject subject]，跟RACSiganl不一样，创建信号时没有block。
// 2.订阅信号 - (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock
// 3.发送信号 sendNext:(id)value
-(void)subject {
    //创建信号
    //创建信号
    RACSubject *subject = [RACSubject subject];
    
    //订阅信号
    [subject subscribeNext:^(id x) {
        NSLog(@"订阅者一%@",x);
    }];
    
    [subject subscribeNext:^(id x) {
        NSLog(@"订阅者二%@",x);
    }];
    //发送信号
    [subject sendNext:@"111"];
}

// RACReplaySubject使用步骤:
// 1.创建信号 [RACSubject subject]，跟RACSiganl不一样，创建信号时没有block。
// 2.可以先订阅信号，也可以先发送信号。
// 2.1 订阅信号 - (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock
// 2.2 发送信号 sendNext:(id)value
-(void)replaySubject{
    
    //创建信号
    RACReplaySubject *replaySubject = [RACReplaySubject subject];
    
    //发送信号
    [replaySubject sendNext:@"2222"];
    
    
    [replaySubject sendNext:@"333"];
    //订阅信号
    [replaySubject subscribeNext:^(id x) {
        NSLog(@"第一个订阅者%@",x);
    }];
    
    //如果想一个信号被订阅，就重复播放之前所有值,需要发送信号，在订阅信号
    [replaySubject subscribeNext:^(id x) {
        NSLog(@"第二个订阅者%@",x);
    }];
}

-(void)arrayTuple{
    NSArray *array = @[@1,@2,@3];
    [array.rac_sequence.signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}

-(void)dictTuple{
    
    NSDictionary *dict = @{@"name": @"张三",@"age":@"20",@"sex":@"男"};
    [dict.rac_sequence.signal subscribeNext:^(id x) {
        //解包元祖，会把元祖的值，按照书顺序给参数里面的变量赋值
        RACTupleUnpack(NSString *key, NSString *value) = x;
        NSLog(@"%@---%@",key,value);
    }];
}


-(void)dicToModel{
    
    //RAC高级写法
    

}

// RACMulticastConnection使用步骤:
// 1.创建信号 + (RACSignal *)createSignal:(RACDisposable * (^)(id subscriber))didSubscribe
// 2.创建连接 RACMulticastConnection *connect = [signal publish];
// 3.订阅信号,注意：订阅的不在是之前的信号，而是连接的信号。 [connect.signal subscribeNext:nextBlock]
// 4.连接 [connect connect]
// 5.发送信号


// 需求：假设在一个信号中发送请求，每次订阅一次都会发送请求，这样就会导致多次请求。
// 解决：使用RACMulticastConnection就能解决.
-(void)multicastConnection{
    //创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"请求一次");
        
        //发送信号
        [subscriber sendNext:@"2"];
        
        return nil;
    }];
    
    //把信号转化为链接类
    RACMulticastConnection *connection = [signal publish];
    
    //订阅连接类信号
    
    [connection.signal subscribeNext:^(id x) {
        NSLog(@"第一个订阅者%@",x);
    }];
    
    [connection.signal subscribeNext:^(id x) {
        NSLog(@"第二个订阅者%@",x);
    }];
    [connection.signal subscribeNext:^(id x) {
        NSLog(@"第三个订阅者%@",x);
    }];
    
    //4.链接信号
    [connection connect];
}

// 一、RACCommand使用步骤:
// 1.创建命令 initWithSignalBlock:(RACSignal * (^)(id input))signalBlock
// 2.在signalBlock中，创建RACSignal，并且作为signalBlock的返回值
// 3.执行命令 - (RACSignal *)execute:(id)input

// 二、RACCommand使用注意:
// 1.signalBlock必须要返回一个信号，不能传nil.
// 2.如果不想要传递信号，直接创建空的信号[RACSignal empty];
// 3.RACCommand中信号如果数据传递完，必须调用[subscriber sendCompleted]，这时命令才会执行完毕，否则永远处于执行中。

// 三、RACCommand设计思想：内部signalBlock为什么要返回一个信号，这个信号有什么用。
// 1.在RAC开发中，通常会把网络请求封装到RACCommand，直接执行某个RACCommand就能发送请求。
// 2.当RACCommand内部请求到数据的时候，需要把请求的数据传递给外界，这时候就需要通过signalBlock返回的信号传递了。

// 四、如何拿到RACCommand中返回信号发出的数据。
// 1.RACCommand有个执行信号源executionSignals，这个是signal of signals(信号的信号),意思是信号发出的数据是信号，不是普通的类型。
// 2.订阅executionSignals就能拿到RACCommand中返回的信号，然后订阅signalBlock返回的信号，就能获取发出的值。


-(void)command{
    //创建命令
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        //命令内部传递参数
        NSLog(@"input === %@",input);
        
        //返回一个信号,可以返回一个空信号 [RACSignal empty];
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            NSLog(@"发送数据");
            //发送信号
            [subscriber sendNext:@"22"];
            
            //注意：数据传递完，最好调用sendCompleted，这时命令才执行完毕。
            [subscriber sendCompleted];
            
            return nil;
        }];
    }];
    //强引用
    command = command;
    
    //拿到返回信号方式二
    //command.executionSignals信号中的信号 switchToLatest转化为信号
    [command.executionSignals.switchToLatest subscribeNext:^(id x) {
        NSLog(@"拿到信号的方式二%@",x);
    }];
    
    //拿到返回信号方式一
    RACSignal *signal = [command execute:@"11"];
    
    [signal subscribeNext:^(id x) {
        NSLog(@"拿到信号的方式一%@",x);
    }];
    
    //执行命令
    [command execute:@"11"];
    
    //监听命令是否执行完毕
    [command.executing subscribeNext:^(id x) {
        if ([x boolValue] == YES) {
            NSLog(@"命令正在执行");
        }else{
            NSLog(@"命令完成/没有执行");
        }
        
    }];
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    OneViewController *one = [[OneViewController alloc] init];
    [self presentViewController:one animated:NO completion:nil];
}

@end

