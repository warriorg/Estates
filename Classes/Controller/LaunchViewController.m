//
//  HomeViewController.m
//  Estates
//
//  Created by warrior gao on 13-10-28.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import "LaunchViewController.h"
#import "HomeViewController.h"

@interface LaunchViewController ()
{
//    MPMoviePlayerViewController *moviePlayer;
}
@end

@implementation LaunchViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"launch" ofType:@"mp4"];
    
    MPMoviePlayerViewController *moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:path]];
    
    moviePlayer.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    moviePlayer.moviePlayer.controlStyle = MPMovieControlStyleNone;
    moviePlayer.moviePlayer.scalingMode = MPMovieScalingModeFill;
    [moviePlayer.moviePlayer prepareToPlay];
    moviePlayer.moviePlayer.shouldAutoplay = YES;
    moviePlayer.moviePlayer.allowsAirPlay = YES;
    [moviePlayer.moviePlayer stop];
    [self.view addSubview:moviePlayer.view];

    
    [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(movieDidFinish) userInfo:nil repeats:NO];
}

- (void)movieDidFinish
{
    HomeViewController *controller = [HomeViewController new];
    [self presentViewController:controller animated:YES completion:nil];
}

@end
