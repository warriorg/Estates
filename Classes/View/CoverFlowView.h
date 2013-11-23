//
//  CoverFlowView.h
//  Estates
//
//  Created by warrior gao on 13-11-16.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface CoverFlowView : UIView<iCarouselDataSource,iCarouselDelegate>
{
    iCarousel *coverFlow;
}

@property(nonatomic, strong) NSMutableArray *items;
@property(nonatomic, copy)void(^changeIndex)(int index);

- (void)reloadData;

@end
