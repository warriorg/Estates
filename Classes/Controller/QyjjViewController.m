//
//  QyjjViewController.m
//  Estates
//
//  Created by warrior gao on 13-11-9.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import "QyjjViewController.h"

@interface QyjjViewController ()
{
    int index;
}
@end

@implementation QyjjViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [btnCompanyIntro setSelected:YES];
    index = 1;
    [bgImageView setImage:[UIImage imageNamed:@"bg_qyjj_1.jpg"]];
    bgImageView.userInteractionEnabled = YES;
    
    
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
    [bgImageView addGestureRecognizer:recognizer];
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:UISwipeGestureRecognizerDirectionRight];
    [bgImageView addGestureRecognizer:recognizer];
}

- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)sender
{
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        if(index < 3) {
            index++;
            
            [bgImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"bg_qyjj_%d.jpg",index]]];

            CATransition *animation = [CATransition animation];
            [animation setDuration:0.3]; //Animate for a duration of 1.0 seconds
            [animation setType:kCATransitionPush]; //New image will push the old image off
            [animation setSubtype:kCATransitionFromRight]; //Current image will slide off to the left, new image slides in from the right
            [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
            [[bgImageView layer] addAnimation:animation forKey:nil];

        }
    }
    
    if(sender.direction == UISwipeGestureRecognizerDirectionRight) {
        if(index > 1) {
            index--;
            [bgImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"bg_qyjj_%d.jpg",index]]];
            
            
            CATransition *animation = [CATransition animation];
            [animation setDuration:0.3]; //Animate for a duration of 1.0 seconds
            [animation setType:kCATransitionPush]; //New image will push the old image off
            [animation setSubtype:kCATransitionFromLeft]; //Current image will slide off to the left, new image slides in from the right
            [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
            [[bgImageView layer] addAnimation:animation forKey:nil];
        }
    }
}

@end
