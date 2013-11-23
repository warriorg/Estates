//
//  SalesViewController.m
//  Estates
//
//  Created by warrior gao on 13-11-9.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import "SalesViewController.h"
#import "SaleDetailsViewController.h"

@interface SalesViewController ()
{
    NSMutableArray *building;
}
@end

@implementation SalesViewController

- (id)init
{
    self = [super init];
    if(self) {
        building = [NSMutableArray new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [btnXssc setSelected:YES];

    float width = self.contentView.frame.size.width;
    float height = self.contentView.frame.size.height;
    [self setBackgroudImage:[UIImage imageNamed:@"bg_xssc.jpg"]];
 
    for (int i = 1; i < 22; i++) {
        [building addObject:[NSString stringWithFormat:@"%d号楼",i]];
    }
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(600, 200, width - 610, height - 220)];
    [tableView setBackgroundColor:[UIColor clearColor]];
    tableView.layer.borderWidth = 1;
    tableView.layer.cornerRadius = 10;
    tableView.layer.borderColor = [UIColor blackColor].CGColor;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.contentView addSubview:tableView];
}

#pragma mark - table view

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return building.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *activityItemView = @"builderCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:activityItemView];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:activityItemView];
    }

//    214 147 50
    NSString *item = [building objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:item];
    [cell.textLabel setTextColor:[UIColor colorWithRed:214.0/255.0 green:147.0/255.0 blue:50.0/255.0 alpha:1]];
    [cell setBackgroundColor:[UIColor clearColor]];
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SaleDetailsViewController *controller = [SaleDetailsViewController new];
    [controller setRoomName:[building objectAtIndex:indexPath.row]];
    [self presentViewController:controller animated:NO completion:nil];
}


@end
