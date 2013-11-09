//
//  CalculatorViewController.m
//  Estates
//
//  Created by warrior gao on 13-11-9.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *nibView =  [[NSBundle mainBundle] loadNibNamed:@"HouseLoanCalculatorView" owner:self options:nil];
    UIView *calView = [nibView objectAtIndex:0];
//    calView.center = CGPointMake(650, 250);
    [self.contentView addSubview:calView];
}

@end
