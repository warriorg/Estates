//
//  PzshViewController.m
//  Estates
//
//  Created by warrior gao on 13-11-10.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import "PzshViewController.h"

@interface PzshViewController ()
{
    NSMutableArray *items;
    NSMutableArray *shpts;
    NSMutableArray *wyafs;
    
    iCarousel *coverFlow;
    UILabel *description;
    
    NSString *shptDescription;
    NSString *wyafDescription;
}
@end

@implementation PzshViewController

- (id)init
{
    self = [super init];
    if(self) {
        shpts = [NSMutableArray arrayWithObjects:@"shpt1.jpg", @"shpt2.jpg", @"shpt3.jpg", @"shpt4.jpg", @"shpt5.jpg", @"shpt6.jpg", @"shpt7.jpg", nil];
        shptDescription = @"小区内功能配套服务，KTV、咖啡厅、茶室、肯德基、麦德龙、瑜伽健身会所、室内高尔夫练习场、游泳馆、幼儿园等。";
        wyafs = [NSMutableArray arrayWithObjects:@"wyaf1.jpg", @"wyaf2.jpg", @"wyaf3.jpg", @"wyaf4.jpg", @"wyaf5.jpg",nil];
        wyafDescription = @"小区内实行智能化物业服务，住宅每户设可视对讲电话，大堂入户以及高速电梯实行智能化一卡通，并与物管中心联网，小区设红外线监控系统、闭路电视监控系统；火灾自动报警及消防联动控制系统；计算机网络系统；停车场管理系统等，让生活更加安全舒适。";
        items = shpts;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [btnPzsh setSelected:YES];
    [self setBackgroudImage:[UIImage imageNamed:@"bg_pzsh.jpg"]];
    float width = self.contentView.frame.size.width;
    float height = self.contentView.frame.size.height;
    
    coverFlow = [[iCarousel alloc] initWithFrame:CGRectMake(10, 100, width - 20, height - 150)];
    coverFlow.delegate = self;
    coverFlow.dataSource = self;
    coverFlow.type = iCarouselTypeCoverFlow2;

    [self.contentView addSubview:coverFlow];
    
    description = [[UILabel alloc] initWithFrame:CGRectMake(80, height - 100, width - 160, 60)];
    description.lineBreakMode = NSLineBreakByWordWrapping;
    description.numberOfLines = 0;
    description.textColor = [UIColor yellowColor];
    [description setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:description];
    description.text = shptDescription;
    
    UIButton *btnShpt = [[UIButton alloc] initWithFrame:CGRectMake(520, height - 40, 80, 40)];
    
    [btnShpt setTitle:@"生活配套" forState:UIControlStateNormal];
    [btnShpt setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btnShpt.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [btnShpt setTag:2];
    [btnShpt addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btnShpt];
    
    UIButton *btnWyaf = [[UIButton alloc] initWithFrame:CGRectMake(600, height - 40, 80, 40)];
    [btnWyaf setTitle:@"物业安防" forState:UIControlStateNormal];
    [btnWyaf setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btnWyaf.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [btnWyaf addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btnWyaf];

    
}

#pragma mark -
#pragma mark iCarousel methods

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

- (void)touchUp:(UIButton *)sender
{
    items = sender.tag == 2 ? shpts : wyafs;
    description.text = sender.tag == 2 ? shptDescription : wyafDescription;
    [coverFlow reloadData];
}

@end
