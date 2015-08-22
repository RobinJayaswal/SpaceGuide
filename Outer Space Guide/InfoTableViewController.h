//
//  InfoTableViewController.h
//  Outer Space Guide
//
//  Created by RobinJayaswal on 12/10/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REJSpaceObject.h"
@interface InfoTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) REJSpaceObject *spaceObject;
@end
