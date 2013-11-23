//
//  HxsxViewController.m
//  Estates
//
//  Created by warrior gao on 13-11-23.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import "HxsxViewController.h"
#import "HxtView.h"

@interface HxsxViewController ()
{
    UIView *currView;
    float width;
    float height;
}
@end

@implementation HxsxViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [btnHxsx setSelected:YES];
    
    [self setBackgroudImage:[UIImage imageNamed:@"bg_pzsh.jpg"]];

    
    width = self.contentView.frame.size.width;
    height = self.contentView.frame.size.height;
    
    currView = [[UIView alloc] initWithFrame:self.contentView.frame];
    [self.contentView addSubview:currView];
    
    UIButton *btnHxt = [[UIButton alloc] initWithFrame:CGRectMake(650, height - 40, 80, 40)];
    [btnHxt setTitle:@"户型图" forState:UIControlStateNormal];
    [btnHxt setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btnHxt.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [btnHxt setTag:2];
    [btnHxt addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btnHxt];
    
    UIButton *btnSx = [[UIButton alloc] initWithFrame:CGRectMake(730, height - 40, 80, 40)];
    [btnSx setTitle:@"户型赏析" forState:UIControlStateNormal];
    [btnSx setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btnSx.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [btnSx setTag:1];
    [btnSx addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btnSx];
    
    UIButton *btnSnmy = [[UIButton alloc] initWithFrame:CGRectMake(810, height - 40, 80, 40)];
    [btnSnmy setTitle:@"户型赏析" forState:UIControlStateNormal];
    [btnSnmy setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btnSnmy.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [btnSnmy addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btnSnmy];

    
    [self touchUp:btnHxt];
}

- (void)touchUp:(UIButton *)sender
{
    [[currView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];

    switch (sender.tag) {
        case 2:
        {
            HxtView *hxtView = [[HxtView alloc] initWithFrame:currView.frame];
            [currView addSubview:hxtView];
        }
            break;
            
        default:
            break;
    }
}

@end
