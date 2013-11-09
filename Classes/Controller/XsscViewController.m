//
//  XsscViewController.m
//  Estates
//
//  Created by warrior gao on 13-11-9.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import "XsscViewController.h"
#import "CalculatorViewController.h"

@interface XsscViewController ()

@end

@implementation XsscViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setBackgroudImage:[UIImage imageNamed:@"bg_xssc.jpg"]];
    
    UIButton *btnCal = [[UIButton alloc] initWithFrame:CGRectMake(800, 300, 120, 45)];
    [btnCal setBackgroundImage:[UIImage imageNamed:@"bg_calculator.png"] forState:UIControlStateNormal];
    [btnCal addTarget:self action:@selector(beginCal) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btnCal];
    
    UIButton *btnSales = [[UIButton alloc] initWithFrame:CGRectMake(800, 360, 120, 45)];
    [btnSales setBackgroundImage:[UIImage imageNamed:@"bg_sale_table.png"] forState:UIControlStateNormal];
    [self.contentView addSubview:btnSales];
}

- (void)beginCal
{
    CalculatorViewController *controller = [CalculatorViewController new];
    [self presentViewController:controller animated:NO completion:nil];
}

@end
