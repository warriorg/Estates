//
//  SaleDetailsViewController.m
//  Estates
//
//  Created by warrior gao on 13-11-10.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import "SaleDetailsViewController.h"
#import "RoomView.h"

@interface SaleDetailsViewController ()
{
    NSMutableArray *rooms;
}
@end

@implementation SaleDetailsViewController


- (id)init
{
    self = [super init];
    if (self) {
        rooms = [NSMutableArray new];
        for(int i = 0; i < 24; i++) {
            [rooms addObject:@""];
        }
        
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

    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, width - 20, 40)];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setFont:[UIFont boldSystemFontOfSize:30]];
    [title setTextColor:[UIColor colorWithRed:214.0/255.0 green:147.0/255.0 blue:50.0/255.0 alpha:1]];
    [self.view addSubview:title];
    [title setText:_roomName];
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(10, 50, width - 20, height - 40)];
    table.layer.borderColor = [UIColor blackColor].CGColor;
    table.layer.borderWidth = 1;
    table.dataSource = self;
    table.delegate = self;
    [table setSeparatorColor:[UIColor clearColor]];
    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    [self.contentView addSubview:table];
}

#pragma mark - table view

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return rooms.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *activityItemView = @"builderCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:activityItemView];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:activityItemView];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSString *item = [rooms objectAtIndex:indexPath.row];
    
    float tmpWidth = (self.contentView.frame.size.width - 30) / 5;
    
    for (int i = 0; i < 5; i++) {
        RoomView *roomView = [[RoomView alloc] initWithFrame:CGRectMake(tmpWidth * i, 0, tmpWidth, 70)];
        [cell addSubview:roomView];
    }
    
    
    
//    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SaleDetailsViewController *controller = [SaleDetailsViewController new];
    [self presentViewController:controller animated:NO completion:nil];
}

@end
