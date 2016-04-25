//
//  ViewController.m
//  09_RAC
//
//  Created by GeekerHua on 15/12/30.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTScope.h>  // 范围
#import "NetworkTools.h"

@interface ViewController ()
@property (strong, nonatomic) Person *person;    /**<   */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *demoButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person = [[Person alloc] init];
//    [self targetDemo];
    [[[NetworkTools sharedTools] request:GET URLString:@"http://www.weather.com.cn/data/sk/101010100.html" parameters:nil] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    } error:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)notificationDemo{
    // takeUntile 表示信号有效期
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil] takeUntil:[self rac_willDeallocSignal]] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
}

- (void)textFieldDemo{
    
    [[self.textField rac_textSignal] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}

/*
 1. 导入头文件 #import <ReactiveCocoa/RACEXTScope.h>
#import "NetworkTools.h"
 2. 外部写 @weakify(self)
 3. 内部写 @strongify(self)
 RAC的Block中只要出现self,一定会强引用
 */
- (void)targetDemo{
    @weakify(self)
    [[self.demoButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self)
        NSLog(@"%@",x);
        self.textField.text = @"hello";
    }];
    
}

- (void)targetDemo2{
    // OC解决循环引用
    __weak typeof(self) weakSelf = self;
    [[self.demoButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        // 为了避免block被传出控制器,且当前控制器销毁了,为了不影响block执行,使用strongSelf修饰
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"%@",x);
        strongSelf.textField.text = @"hello";
    }];
    
}

- (void)kvoDemo{
    // 一旦收到next消息,在next的Block中执行相应处理,不需要移除监听者
    [RACObserve(self.person, name) subscribeNext:^(id x) {
        NSLog(@"%@", x);
        self.nameLabel.text = x;
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.person.name = [NSString stringWithFormat:@"zhangsan %05d", arc4random_uniform(100000)];
}


- (void)dealloc
{
    NSLog(@"dealloc - %s",__FUNCTION__);
}
@end
