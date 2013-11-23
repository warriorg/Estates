//
//  QyysViewController.m
//  Estates
//
//  Created by warrior gao on 13-11-10.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import "QyysViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "CoverFlowView.h"

@interface QyysViewController ()
{
    CoverFlowView *coverFlowView;
    MPMoviePlayerViewController *moviePlayer;
    UIView *currView;
    float width;
    float height;
    
    NSMutableArray *descriptionArr;
}
@end

@implementation QyysViewController

- (id)init
{
    self = [super init];
    if (self) {
        descriptionArr = [NSMutableArray arrayWithObjects:
                          @"盐城世纪公园建设设计融合了中国古文化和盐城的人文历史，共设有中心活动、民俗风情、科技文化、儿童活动、密林休闲五大功能区，是集科普、休闲、娱乐、健身、集会于一体，老少皆宜、雅俗共赏的多功能绿色生态、园林式公园。",
                          @"盐城市第一中学植根于文化厚重、具有光荣革命传统的盐阜老区。学校肇始于1923年，是盐城第一所公立中学，曾被陈毅元帅誉为苏北中等教育的“天之骄子”。2003年11月，被评为江苏省首批四星级高中。",
                          @"盐城市第三人民医院暨盐城市红十字医院是一所集医疗、教学、科研、预防保健、康复为一体的三级综合医院，创建于1946年，是苏北地区第一所人民医院。现为东南大学医学院和南通大学附属医院，是徐州医学院等高等医药院校的教学医院。",
                          @"盐城市聚龙湖公园原名内港湖公园,是盐城市城南新区城市中心的核心地块，建设有公园水韵舞台、音乐喷泉、九曲栈桥、清风馆、水云轩、飘城新街等10多个景点。",
                          @"盐塘河公园是城南新区核心区，位于解放南路以东，串场河景观路以西，规划支路以南，盐塘河以北，人民南路两侧，是一个“山水景观型”的市民健身公园。公园以人民南路为界，分为东园、西园两部分。",nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[btnQyys setSelected:YES];
    [self setBackgroudImage:[UIImage imageNamed:@"bg_pzsh.jpg"]];
    width = self.contentView.frame.size.width;
    height = self.contentView.frame.size.height;
    
    currView = [[UIView alloc] initWithFrame:self.contentView.frame];
    [self.contentView addSubview:currView];
    
    UIButton *btnJtys = [[UIButton alloc] initWithFrame:CGRectMake(180, height - 40, 80, 40)];
    [btnJtys setTitle:@"交通优势" forState:UIControlStateNormal];
    [btnJtys setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btnJtys.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [btnJtys setTag:2];
    [btnJtys addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btnJtys];
    
    UIButton *btnZbpt = [[UIButton alloc] initWithFrame:CGRectMake(260, height - 40, 80, 40)];
    [btnZbpt setTitle:@"周边配套" forState:UIControlStateNormal];
    [btnZbpt setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btnZbpt.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [btnZbpt addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btnZbpt];
    
    [self touchUp:btnJtys];

}

- (void)touchUp:(UIButton *)sender
{
    [moviePlayer.moviePlayer stop];
    [[currView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    if (sender.tag == 2) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"jtys" ofType:@"mp4"];
        
        moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:path]];
        moviePlayer.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
        moviePlayer.moviePlayer.controlStyle = MPMovieControlStyleNone;
        [moviePlayer.moviePlayer prepareToPlay];
        moviePlayer.moviePlayer.shouldAutoplay = YES;
        moviePlayer.moviePlayer.allowsAirPlay = YES;
//        [moviePlayer.moviePlayer setRepeatMode:MPMovieRepeatModeOne];
        moviePlayer.view.backgroundColor = [UIColor clearColor];
        moviePlayer.view.frame = self.contentView.frame;
        [currView addSubview:moviePlayer.view];
        
    } else {
        coverFlowView = [[CoverFlowView alloc] initWithFrame:CGRectMake(10, 50, width - 20, height - 150)];
        coverFlowView.items = [NSMutableArray arrayWithObjects:@"zbpt1.jpg", @"zbpt3.jpg", @"zbpt4.jpg", @"zbpt5.jpg", @"zbpt6.jpg", nil];
        [currView addSubview:coverFlowView];
        [coverFlowView reloadData];
        
        UILabel *description = [[UILabel alloc] initWithFrame:CGRectMake(80, height - 100, width - 160, 60)];
        description.lineBreakMode = NSLineBreakByWordWrapping;
        description.numberOfLines = 0;
        description.textColor = [UIColor yellowColor];
        description.text = [descriptionArr objectAtIndex:0];
        [description setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:description];
        __block NSMutableArray *arr = descriptionArr;
        coverFlowView.changeIndex = ^(int index){
            description.text = [arr objectAtIndex:index];
        };
    }
}

@end
