//
//  ViewController.m
//  CountdownTimerDemo
//
//  Created by Levi on 2017/3/30.
//  Copyright © 2017年 SL. All rights reserved.
//

#import "ViewController.h"
#import "CountdownTimerLabel.h"

@interface ViewController ()<CountdownTimerLabelDelegate>

@property (strong,nonatomic) UILabel * label;
@property (strong,nonatomic) CountdownTimerLabel * countdownTimerLabel;
@property (strong,nonatomic) CountdownTimerLabel * redColorTimerLabel;
@property (strong,nonatomic) UILabel * redColorLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.label];
    
    _countdownTimerLabel = [[CountdownTimerLabel alloc] initWithLabel:_label];
    [_countdownTimerLabel setCountDownTime:20]; //设置倒计时时间
    [_countdownTimerLabel startTimer];
    _countdownTimerLabel.delegate = self;
    
    [self.view addSubview:self.redColorLabel];
    _redColorTimerLabel = [[CountdownTimerLabel alloc] initWithLabel:_redColorLabel];
    [_redColorTimerLabel setCountDownTime:60]; //设置倒计时时间
    [_redColorTimerLabel startTimer];
    _redColorTimerLabel.delegate = self;
}

#pragma mark --CountdownTimerLabelDelegate--
-(void)timerContinuesToRunLabel:(UILabel *)label time:(NSString *)time{
    if (label == self.label) {
        NSLog(@"灰色label 定时器继续运行：%@",time);
    }else if (label == self.redColorLabel){
        NSLog(@"红色label 定时器继续运行：%@",time);
    }
}

-(void)timerCountdownIsCompleteLabel:(UILabel *)label timer:(NSString *)time{
    if (label == self.label) {
        NSLog(@"灰色label 定时器运行完成：%@",time);
    }else if (label == self.redColorLabel){
        NSLog(@"红色label 定时器运行完成：%@",time);
    }
}

-(UILabel * )label{
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
        _label.backgroundColor = [UIColor grayColor];
    }
    return _label;
}

-(UILabel *)redColorLabel{
    if (!_redColorLabel) {
        _redColorLabel = [[UILabel alloc]initWithFrame:CGRectMake(160, 50, 100, 100)];
        _redColorLabel.backgroundColor = [UIColor redColor];
    }
    return _redColorLabel;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
