//
//  ViewController.m
//  FPSMonitor
//
//  Created by WG on 15/11/25.
//  Copyright © 2015年 WG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    dispatch_after(2, dispatch_get_main_queue(), ^{
//        sleep(10000);
//    });
//    dispatch_async(dispatch_get_global_queue(2, 0), ^{
//        for (int i = 0; i < 100000; ++i) {
//            NSLog(@"-------------  %i   %i", i % 2, i);
//            if (i % 2 == 0) {
//                dispatch_sync(dispatch_get_main_queue(), ^{
//                    sleep(4);
//                });
//            }else{
//                dispatch_sync(dispatch_get_global_queue(2, 0), ^{
//                    sleep(4);
//                });
//            }
//        }
//    });
    
//    CABasicAnimation * an = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
//    an.toValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
//    an.autoreverses = YES;
//    an.repeatCount = HUGE;
//    [_label.layer addAnimation:an forKey:@""];
    
    
//    _label.layer.backgroundColor
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
