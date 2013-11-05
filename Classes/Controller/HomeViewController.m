//
//  HomeViewController.m
//  Estates
//
//  Created by warrior gao on 13-11-5.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 700)];
    [bgImage setImage:[UIImage imageNamed:@"home.jpg"]];
    [self.view addSubview:bgImage];
}

@end
