//
//  HxtView.m
//  Estates
//
//  Created by warrior gao on 13-11-23.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import "HxtView.h"

@implementation HxtView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        index = 1;
        float width = self.frame.size.width;
        float height = self.frame.size.height;
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(85, 180, width - 170, height - 250)];
        [imageView setImage:[UIImage imageNamed:@"hxt01.jpg"]];
        [imageView setUserInteractionEnabled:YES];
        [self addSubview:imageView];
        
        leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 359, 40, 40)];
        [leftImage setImage:[UIImage imageNamed:@"leftArrows.png"]];
        [leftImage setHidden:YES];
        [self addSubview:leftImage];
        
        rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(width - 60, 359, 40, 40)];
        [rightImage setImage:[UIImage imageNamed:@"rightArrows.png"]];
        [self addSubview:rightImage];
        
        UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
        [recognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
        [imageView addGestureRecognizer:recognizer];
        
        recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
        [recognizer setDirection:UISwipeGestureRecognizerDirectionRight];
        [imageView addGestureRecognizer:recognizer];

    }
    return self;
}

- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)sender
{
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        if(index < 28) {
            index++;
//            NSLog(@"%@",[NSString stringWithFormat:@"hxt%02d.jpg",index]);
            [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"hxt%02d.jpg",index]]];
            
            CATransition *animation = [CATransition animation];
            [animation setDuration:0.3]; //Animate for a duration of 1.0 seconds
            [animation setType:kCATransitionPush]; //New image will push the old image off
            [animation setSubtype:kCATransitionFromRight]; //Current image will slide off to the left, new image slides in from the right
            [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
            [[imageView layer] addAnimation:animation forKey:nil];
            
        }
    }
    
    if(sender.direction == UISwipeGestureRecognizerDirectionRight) {
        if(index > 1) {
            index--;
            
            [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"hxt%02d.jpg",index]]];
            
            
            CATransition *animation = [CATransition animation];
            [animation setDuration:0.3]; //Animate for a duration of 1.0 seconds
            [animation setType:kCATransitionPush]; //New image will push the old image off
            [animation setSubtype:kCATransitionFromLeft]; //Current image will slide off to the left, new image slides in from the right
            [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
            [[imageView layer] addAnimation:animation forKey:nil];
        }
    }
    
    if(index == 28){
        [rightImage setHidden:YES];
    } else {
        [rightImage setHidden:NO];
    }
    if(index == 1) {
        [leftImage setHidden:YES];
    } else {
        [leftImage setHidden:NO];
    }

}


@end
