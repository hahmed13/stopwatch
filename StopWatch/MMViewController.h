//
//  MMViewController.h
//  StopWatch
//
//  Created by Hammad A  on 10/13/13.
//  Copyright (c) 2013 Hammad Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *stopWatchLabel;

- (IBAction)onStartPressed:(id)sender;
- (IBAction)onStopPressed:(id)sender;

@end
