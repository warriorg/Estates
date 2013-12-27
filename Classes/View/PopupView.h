//
//  PopupView.h
//  myb-ios
//
//  Created by warrior gao on 13-8-15.
//  Copyright (c) 2013年 51myb. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "BaseView.h"

@interface PopupView : UIView
{
    UILabel     *_titleView;
    UIView      *_contentView;
    UIControl   *_overlayView;
    
}



- (void)setTitle:(NSString *)title;
- (void)addContentSubview:(UIView *)view;
- (CGRect)getContentFrame;

- (void)show;
- (void)dismiss;

@end
