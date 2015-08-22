//
//  InfoTableViewController.m
//  Outer Space Guide
//
//  Created by RobinJayaswal on 12/10/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import "InfoTableViewController.h"

@interface InfoTableViewController ()

@end

@implementation InfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = self.spaceObject.name;
            cell.detailTextLabel.text = self.spaceObject.nickname;
            break;
        case 1:
            cell.textLabel.text = self.spaceObject.name;
            cell.detailTextLabel.text = self.spaceObject.nickname;
            break;
        case 2:
            cell.textLabel.text = self.spaceObject.name;
            cell.detailTextLabel.text = self.spaceObject.nickname;
            break;
        case 3:
            cell.textLabel.text = self.spaceObject.name;
            cell.detailTextLabel.text = self.spaceObject.nickname;
            break;
        case 4:
            cell.textLabel.text = self.spaceObject.name;
            cell.detailTextLabel.text = self.spaceObject.nickname;
            break;
        case 5:
            cell.textLabel.text = self.spaceObject.name;
            cell.detailTextLabel.text = self.spaceObject.nickname;
            break;
        case 6:
            cell.textLabel.text = @"Day Length";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.dayLength];
            break;
        case 7:
            cell.textLabel.text = @"Gravitational Force";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.gravity];
        default:
            break;
    }
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
