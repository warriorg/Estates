//
//  CoverFlowView.m
//  Estates
//
//  Created by warrior gao on 13-11-16.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import "CoverFlowView.h"

@implementation CoverFlowView
@synthesize items;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        coverFlow = [[iCarousel alloc] initWithFrame:frame];
        coverFlow.delegate = self;
        coverFlow.dataSource = self;
        coverFlow.type = iCarouselTypeCoverFlow2;
        [self addSubview:coverFlow];
    }
    return self;
}

#pragma mark -
#pragma mark iCarousel methods

- (void)reloadData
{
    [coverFlow reloadData];
}

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return [items count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    UIImageView *imageView;
    if (view == nil)
    {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 600, 400)];
        view = imageView;
        [imageView setTag:1];
    }
    else
    {
        imageView = (UIImageView *)view;
    }
    
    [imageView setImage:[UIImage imageNamed:items[index]]];
    
    
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return value * 1.1f;
    }
    return value;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    self.changeIndex(carousel.currentItemIndex);
}

@end
