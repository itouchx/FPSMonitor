//
//  FPSMonitor.m
//  MiU
//
//  Created by laughing on 15/7/15.
//  Copyright (c) 2015年 MiU. All rights reserved.
//

#import "FPSMonitor.h"
#import <UIKit/UIKit.h>

@interface FPSMonitor()
@property (nonatomic) UILabel *label;
@property (nonatomic) CADisplayLink *disp;
+ (instancetype)defaultMonitor;
@end

@implementation FPSMonitor

+ (instancetype)defaultMonitor
{
    static FPSMonitor *obj;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [self new];
    });
    return obj;
}

- (void)tick:(CADisplayLink*)disp
{
    static int frames;
    static double timeStamp;
    double now = CFAbsoluteTimeGetCurrent();
    if (now-timeStamp>0.5)
    {
        int val = 1.0*disp.frameInterval*frames/(now-timeStamp);
        _label.text = [NSString stringWithFormat:@"FPS:%i", val];
        if (val>=45)
        {
            _label.textColor = [UIColor greenColor];
        }else if (val>=30)
        {
            _label.textColor = [UIColor orangeColor];
        }else
        {
            _label.textColor = [UIColor redColor];
        }
        timeStamp = now;
        frames = 0;
    }else
    {
        ++frames;
    }
}

- (void)showFPS
{
    if (_label.superview)
    {
        [[UIApplication sharedApplication].keyWindow bringSubviewToFront:_label];
    }else
    {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(2, 64, 80, 20)];
        [[UIApplication sharedApplication].keyWindow addSubview:_label];
        _label.backgroundColor = [UIColor clearColor];
    }
    
    if (!_disp)
    {
        _disp = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
        _disp.frameInterval = 2;
        [_disp addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
}

- (void)hideFPS
{
    [_disp invalidate];
    _disp = nil;
    [_label removeFromSuperview];
    _label = nil;
}

+ (void)showFPS
{
    [[self defaultMonitor] showFPS];
}

+ (void)hideFPS
{
    [[self defaultMonitor] hideFPS];
}

@end
