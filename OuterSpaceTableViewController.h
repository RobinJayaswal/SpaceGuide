//
//  OuterSpaceTableViewController.h
//  Outer Space Guide
//
//  Created by RobinJayaswal on 12/6/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPlanetViewController.h"

#define ADDED_SPACE_OBJECTS_KEY = @"Added Space Objects Array"

@interface OuterSpaceTableViewController : UITableViewController <AddPlanetViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *planets;
@property (strong, nonatomic) NSMutableArray *addedPlanets;

@end
