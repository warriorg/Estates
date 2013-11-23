//
//  XmgkViewController.m
//  Estates
//
//  Created by warrior gao on 13-11-23.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import "XmgkViewController.h"

@interface XmgkViewController ()

@end

@implementation XmgkViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [btnXmgk setSelected:YES];
    
    [self setBackgroudImage:[UIImage imageNamed:@"ceshi.jpg"]];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 512, 349)];
    [imageView setImage:[UIImage imageNamed:@"ceshi.jpg"]];
    [self.contentView addSubview:imageView];
}


@end
