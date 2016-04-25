//
//  ViewController.m
//  08_SoundTools
//
//  Created by GeekerHua on 15/12/30.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

#import "ViewController.h"
//#import "08_SoundTools-Bridging-Header.h"
#import "单例-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
//    [SoundTools sharedTools]
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (int i = 0; i < 2; i++) {
        NSLog(@"%@",[SoundTools sharedTools]);
        
    }
    NSLog(@"----%@",[[SoundTools alloc] init]);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
