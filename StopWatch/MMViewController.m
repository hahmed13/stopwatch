//
//  MMViewController.m
//  StopWatch
//
//  Created by Hammad A  on 10/13/13.
//  Copyright (c) 2013 Hammad Ahmed. All rights reserved.
//

#import "MMViewController.h"

@interface MMViewController ()

@property (strong,nonatomic) NSTimer *stopWatchTimer;
@property (strong, nonatomic) NSDate *startDate;

@end

@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


/*
-(void)updateTimer
{
    static NSInteger counter = 0;
    self.stopWatchLabel.text = [NSString stringWithFormat:@"Counter :%i", counter++];
    
    
}*/

-(void)updateTimer
{
    
    // Create date from the elapsed time
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:self.startDate];
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    // Create a date formatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss:SS"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    
    
    // Format the elapsed time and set it to the label
    NSString *timeString = [dateFormatter stringFromDate:timerDate];
    self.stopWatchLabel.text = timeString;
    
    
    
}


- (IBAction)onStartPressed:(id)sender
{
    
    self.startDate = [NSDate date];
    
   // Create the stop watch timer that fires every 10 ms
    self.stopWatchTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0
                                                           target:self
                                                         selector:@selector(updateTimer)
                                                         userInfo:nil
                                                          repeats:YES];
}

- (IBAction)onStopPressed:(id)sender {
    [self.stopWatchTimer invalidate];
    self.stopWatchTimer = nil;
    [self updateTimer];
    
}
@end
