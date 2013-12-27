//
//  PopupView.m
//  myb-ios
//
//  Created by warrior gao on 13-8-15.
//  Copyright (c) 2013年 51myb. All rights reserved.
//

#import "PopupView.h"

@interface PopupView()

- (void)defalutInit;
- (void)fadeIn;
- (void)fadeOut;

@end

@implementation PopupView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self defalutInit];
    }
    return self;
}

- (void)defalutInit
{
    self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.layer.borderWidth = 1.0f;
    self.layer.cornerRadius = 10.0f;
    self.clipsToBounds = TRUE;
    
    _titleView = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleView.backgroundColor = [UIColor colorWithRed:59./255.
                                                 green:89./255.
                                                  blue:152./255.
                                                 alpha:1.0f];
    
    _titleView.textAlignment = UITextAlignmentCenter;
    _titleView.textColor = [UIColor whiteColor];
    CGFloat xWidth = self.bounds.size.width;
    _titleView.lineBreakMode = UILineBreakModeTailTruncation;
    _titleView.frame = CGRectMake(0, 0, xWidth, 36);
    [self addSubview:_titleView];
    
    UIButton *btnClose = [[UIButton alloc] initWithFrame:CGRectMake(xWidth - 40, 2, 35, 35)];
    [btnClose setImage:[UIImage imageNamed:@"ic_close"] forState:UIControlStateNormal];
    [btnClose addTarget:self
                 action:@selector(dismiss)
       forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnClose];
    
    _contentView = [[UIView alloc] initWithFrame:CGRectZero];
    _contentView.frame = CGRectMake(0, 18, xWidth, self.frame.size.height - 18);
    [self addSubview:_contentView];
    
    _overlayView = [[UIControl alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _overlayView.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.6];
}

#pragma mark - animations

- (void)fadeIn
{
    self.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.alpha = 0;
    [UIView animateWithDuration:.35 animations:^{
        self.alpha = 1;
        self.transform = CGAffineTransformMakeScale(1, 1);
    }];
    
}
- (void)fadeOut
{
    [UIView animateWithDuration:.35 animations:^{
        self.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [_overlayView removeFromSuperview];
            [self removeFromSuperview];
        }
    }];
}

- (void)setTitle:(NSString *)title
{
    _titleView.text = title;
}

- (void)addContentSubview:(UIView *)view
{
    [_contentView addSubview:view];
}

- (CGRect)getContentFrame
{
    return _contentView.frame;
}

- (void)show
{
    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:_overlayView];
    [keywindow addSubview:self];
    
    self.center = CGPointMake(keywindow.bounds.size.width/2.0f,
                              keywindow.bounds.size.height/2.0f);
    [self fadeIn];
}

- (void)dismiss
{
    [self fadeOut];
}

@end
