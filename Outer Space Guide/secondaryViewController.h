//
//  secondaryViewController.h
//  Outer Space Guide
//
//  Created by RobinJayaswal on 12/8/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REJSpaceObject.h"

@interface secondaryViewController : UIViewController

@property (strong,nonatomic)REJSpaceObject *spaceObject;
@property (strong, nonatomic) IBOutlet UIImageView *spaceImage;
@property (strong, nonatomic) IBOutlet UILabel *gravityNumber;

@property (strong, nonatomic) IBOutlet UILabel *planet;
@property (strong, nonatomic) IBOutlet UILabel *nickname;
@property (strong, nonatomic) IBOutlet UILabel *interestingfact;
@property (strong, nonatomic) IBOutlet UILabel *diameter;
@property (strong, nonatomic) IBOutlet UILabel *temperature;
@property (strong, nonatomic) IBOutlet UILabel *moons;
@property (strong, nonatomic) IBOutlet UILabel *day;
@property (strong, nonatomic) IBOutlet UILabel *year;


@end
