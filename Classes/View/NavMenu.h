//
//  NavMenu.h
//  Estates
//
//  Created by warrior gao on 13-11-8.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavMenu : UIView

@property (nonatomic) int cornerRadius;
@property (nonatomic) BOOL titleShadow;
@property (nonatomic) BOOL buttonGradient;
@property (strong, nonatomic) UIColor *titleShadowColor;
@property (nonatomic) CGSize titleShadowOffset;



@property(nonatomic, copy)void(^onClick)(void);

- (void)addButtonWithTitle:(NSString *) title block:(void (^)()) block;
- (void)addButtonWithTitle:(NSString *)title
                     color:(UIColor*)color
                titleColor:(UIColor*)titleColor
               borderWidth:(NSUInteger)borderWidth
               borderColor:(UIColor*)borderColor
                     block:(void (^)())block;
- (void) showWithRect;

@end
