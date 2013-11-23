//
//  BaseViewController.m
//  Estates
//
//  Created by warrior gao on 13-10-28.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import "BaseViewController.h"
#import "NavMenu.h"
#import "QyjjViewController.h"
#import "XsscViewController.h"
#import "PzshViewController.h"
#import "QyysViewController.h"

@interface BaseViewController ()
{
    
}
@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 698)];
    [self.view addSubview:_contentView];
    
    bgImageView = [[UIImageView alloc] initWithFrame:self.contentView.frame];
    [bgImageView setImage:[UIImage imageNamed:@"home.jpg"]];
    [self.contentView addSubview:bgImageView];
    
    [self buildMenu];
}

- (void)buildMenu
{
    float width = WIDTH;
    float top = 698;
    
    UIImageView *bgLineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, top, width, 2)];
    [bgLineImage setImage:[UIImage imageNamed:@"home_line.png"]];
    [self.view addSubview:bgLineImage];
    top += 2;
    
    float left = 0;
    float averageWidth = width/6;
    btnCompanyIntro = [[UIButton alloc] initWithFrame:CGRectMake(left, top, averageWidth, 68)];
    [btnCompanyIntro setBackgroundImage:[UIImage imageNamed:@"company_intro.png"] forState:UIControlStateNormal];
    [btnCompanyIntro setBackgroundImage:[UIImage imageNamed:@"company_intro_high.png"] forState:UIControlStateHighlighted];
    [btnCompanyIntro setBackgroundImage:[UIImage imageNamed:@"company_intro_high.png"] forState:UIControlStateSelected];
    [btnCompanyIntro addTarget:self action:@selector(navBarTouch:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    [btnCompanyIntro setTag:navTypeQyjj];
    [self.view addSubview:btnCompanyIntro];
    left += averageWidth;
    
    btnQyys = [[UIButton alloc] initWithFrame:CGRectMake(left, top, averageWidth, 68)];
    [btnQyys setBackgroundImage:[UIImage imageNamed:@"btnQyys.png"] forState:UIControlStateNormal];
    [btnQyys setBackgroundImage:[UIImage imageNamed:@"btnQyys_high.png"] forState:UIControlStateSelected];
    [btnQyys setBackgroundImage:[UIImage imageNamed:@"btnQyys_high.png"] forState:UIControlStateHighlighted];
    [btnQyys addTarget:self action:@selector(navBarTouch:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    [btnQyys setTag:navTypeQyys];
    [self.view addSubview:btnQyys];
    left += averageWidth;
    
    btnXmgk = [[UIButton alloc] initWithFrame:CGRectMake(left, top, averageWidth, 68)];
    [btnXmgk setBackgroundImage:[UIImage imageNamed:@"btnXmgk.png"] forState:UIControlStateNormal];
    [btnXmgk setBackgroundImage:[UIImage imageNamed:@"btnXmgk_high.png"] forState:UIControlStateSelected];
    [btnXmgk setBackgroundImage:[UIImage imageNamed:@"btnXmgk_high.png"] forState:UIControlStateHighlighted];
    [btnXmgk addTarget:self action:@selector(navBarTouch:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    [btnXmgk setTag:navTypeXmgk];
    [self.view addSubview:btnXmgk];
    left += averageWidth;
    
    btnPzsh = [[UIButton alloc] initWithFrame:CGRectMake(left, top, averageWidth, 68)];
    [btnPzsh setBackgroundImage:[UIImage imageNamed:@"btnPzsh.png"] forState:UIControlStateNormal];
    [btnPzsh setBackgroundImage:[UIImage imageNamed:@"btnPzsh_high.png"] forState:UIControlStateSelected];
    [btnPzsh setBackgroundImage:[UIImage imageNamed:@"btnPzsh_high.png"] forState:UIControlStateHighlighted];
    [btnPzsh addTarget:self action:@selector(navBarTouch:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    [btnPzsh setTag:navTypePzsh];
    [self.view addSubview:btnPzsh];
    left += averageWidth;
    
    btnHxsx = [[UIButton alloc] initWithFrame:CGRectMake(left, top, averageWidth, 68)];
    [btnHxsx setBackgroundImage:[UIImage imageNamed:@"btnHxsx.png"] forState:UIControlStateNormal];
    [btnHxsx setBackgroundImage:[UIImage imageNamed:@"btnHxsx_high.png"] forState:UIControlStateSelected];
    [btnHxsx setBackgroundImage:[UIImage imageNamed:@"btnHxsx_high.png"] forState:UIControlStateHighlighted];
    [btnHxsx addTarget:self action:@selector(navBarTouch:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    [btnHxsx setTag:navTypeHxsx];
    [self.view addSubview:btnHxsx];
    left += averageWidth;
    
    btnXssc = [[UIButton alloc] initWithFrame:CGRectMake(left, top, averageWidth, 68)];
    [btnXssc setBackgroundImage:[UIImage imageNamed:@"btnXssc.png"] forState:UIControlStateNormal];
    [btnXssc setBackgroundImage:[UIImage imageNamed:@"btnXssc_high.png"] forState:UIControlStateSelected];
    [btnXssc setBackgroundImage:[UIImage imageNamed:@"btnXssc_high.png"] forState:UIControlStateHighlighted];
    [btnXssc addTarget:self action:@selector(navBarTouch:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    [btnXssc setTag:navTypeXssc];
    [self.view addSubview:btnXssc];
}

- (void)navBarTouch:(UIButton *)sender forEvent:(UIEvent*)event
{
    [btnCompanyIntro setSelected:NO];
    [btnQyys setSelected:NO];
    [btnXmgk setSelected:NO];
    [btnPzsh setSelected:NO];
    [btnHxsx setSelected:NO];
    [btnXssc setSelected:NO];
    
    [sender setSelected:YES];
    
    switch (sender.tag) {
        case navTypeQyjj:
        {
            QyjjViewController *controller = [QyjjViewController new];
            [self presentViewController:controller animated:NO completion:nil];
            break;
        }
        case navTypeQyys:
        {
            QyysViewController *controller = [QyysViewController new];
            [self presentViewController:controller animated:NO completion:nil];
            break;
        }
        case navTypePzsh:
        {
            PzshViewController *controller = [PzshViewController new];
            [self presentViewController:controller animated:NO completion:nil];
            break;
        }
        case navTypeXssc:
        {
            XsscViewController *controller = [[XsscViewController alloc] init];
            [self presentViewController:controller animated:NO completion:nil];
            break;
        }
        default:
            [bgImageView setImage:[UIImage imageNamed:@"home.jpg"]];
            break;
    }
    
    
}

- (void)setBackgroudImage:(UIImage *)bgImage
{
    [bgImageView setImage:bgImage];
}

@end
