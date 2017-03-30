//
//  CountdownTimerLabel.m
//  CountdownTimerDemo
//
//  Created by Levi on 2017/3/30.
//  Copyright © 2017年 SL. All rights reserved.
//

#import "CountdownTimerLabel.h"

@interface CountdownTimerLabel ()

@property (assign,nonatomic) NSTimeInterval countdownValue;   //倒计时的秒数
@property (strong,nonatomic) NSDate * startCountdownDate;     //开始倒计时的时间
@property (strong,nonatomic) NSDate * date1970;
@property (strong,nonatomic) NSDate * timeToCountdownOff;         //以1970年时间为准  加上倒计时的秒数
@property (strong,nonatomic) NSTimer * timer;
@property (strong,nonatomic) NSDateFormatter * dateFormatter;

@end

@implementation CountdownTimerLabel

- (instancetype)initWithLabel:(UILabel *)theLabel{
    self = [super init];
    
    if(self){
        self.timeLabel = theLabel;
    }
    return self;
}

- (UILabel*) timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = self;
    }
    return _timeLabel;
}

- (NSDateFormatter*) dateFormatter{
    if (_dateFormatter == nil) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
        [_dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
        _dateFormatter.dateFormat = @"HH:mm:ss";
    }
    return _dateFormatter;
}

- (void) setCountDownTime:(NSTimeInterval) time{
    _date1970 = [NSDate dateWithTimeIntervalSince1970:0];
    _timeToCountdownOff = [_date1970 dateByAddingTimeInterval:_countdownValue = (time < 0)? 0 : time];//基于date1970加上倒计时的秒数
}

-(void)startTimer{
    
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateLabel) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
    if(_startCountdownDate == nil){
        _startCountdownDate = [NSDate date];
    }
    
    _timerRun = YES;
    [_timer fire];
}

//停止定时器
-(void)stopTimer{
    if(_timerRun){
        [_timer invalidate];
        _timer = nil;
        _timerRun = NO;
    }
}

-(void)updateLabel{
    
    NSDate * timeToShow = [NSDate date];
    NSTimeInterval timeDiff = [timeToShow timeIntervalSinceDate:_startCountdownDate];//开始倒计时的时间与当前时间的差（秒）
    
    if (_timerRun) {    //倒计时继续运行
        
        if(timeDiff >= _countdownValue){  //倒计时停止
            [self stopTimer];
            timeToShow = [_date1970 dateByAddingTimeInterval:0];
            _startCountdownDate = nil;
            
            if ([_delegate respondsToSelector:@selector(timerCountdownIsCompleteLabel:timer:)]) {
                [_delegate timerCountdownIsCompleteLabel:self.timeLabel timer:[self.dateFormatter stringFromDate:timeToShow]];
            }
            
        }else{
            
            timeToShow = [_timeToCountdownOff dateByAddingTimeInterval:(timeDiff*-1)];
            
            if (![self.timeLabel.text isEqualToString:[self.dateFormatter stringFromDate:timeToShow]]) {
                if ([_delegate respondsToSelector:@selector(timerContinuesToRunLabel:time:)]) {
                    [_delegate timerContinuesToRunLabel:self.timeLabel time:[self.dateFormatter stringFromDate:timeToShow]];
                }
            }
            
        }
    }else{
        timeToShow = _timeToCountdownOff;
    }
    
    self.timeLabel.text = [self.dateFormatter stringFromDate:timeToShow];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
