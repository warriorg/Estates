//
//  RoomView.m
//  Estates
//
//  Created by warrior gao on 13-11-10.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import "RoomView.h"
#import <QuartzCore/QuartzCore.h>

@implementation RoomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView
{
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1;
//    self.layer.cornerRadius = 5;
    
    float width = self.frame.size.width;
    float height = self.frame.size.height;
    float margin = 5;
    float top = 5;
    float left = 5;
    
    float tmpHeight = 20;
    
    UILabel *roomNum = [[UILabel alloc] initWithFrame:CGRectMake(left, top, width - 90, tmpHeight)];
    [roomNum setText:@"1101室"];
    [roomNum setFont:[UIFont boldSystemFontOfSize:16]];
    [roomNum setBackgroundColor:[UIColor clearColor]];
    [self addSubview:roomNum];
    top += tmpHeight + margin;
    
    tmpHeight = 15;
    UILabel *roomType = [[UILabel alloc] initWithFrame:CGRectMake(left, top, width - 90, tmpHeight)];
    [roomType setText:@"2房2厅1卫"];
    [roomType setBackgroundColor:[UIColor clearColor]];
    [roomType setFont:[UIFont systemFontOfSize:14]];
    [self addSubview:roomType];
    top += tmpHeight + margin;

    UILabel *roomArea = [[UILabel alloc] initWithFrame:CGRectMake(left, top, width - 90, tmpHeight)];
    [roomArea setText:@"98平米"];
    [roomArea setFont:[UIFont systemFontOfSize:14]];
    [roomArea setBackgroundColor:[UIColor clearColor]];
    [self addSubview:roomArea];
    
    top = 10;
    tmpHeight = 20;
    UIButton *btnStatus = [[UIButton alloc] initWithFrame:CGRectMake(width - 90, top, 80, height - 20)];
    [btnStatus setBackgroundColor:[UIColor redColor]];
    [btnStatus setTitle:@"待售" forState:UIControlStateNormal];
    [self addSubview:btnStatus];
}

@end
