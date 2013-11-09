//
//  BaseViewController.h
//  Estates
//
//  Created by warrior gao on 13-10-28.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define WIDTH 1024

@interface BaseViewController : UIViewController
{
@protected
    UIImageView *bgImageView;
}

@property(nonatomic, strong) UIView *contentView;

- (void)setBackgroudImage:(UIImage *)bgImage;

@end

enum navType
{
    navTypeQyjj,
    navTypeQyys,
    navTypeXmgk,
    navTypePzsh,
    navTypeHxsx,
    navTypeXssc
};