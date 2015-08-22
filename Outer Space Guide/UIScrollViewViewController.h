//
//  UIScrollViewViewController.h
//  Outer Space Guide
//
//  Created by RobinJayaswal on 12/9/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REJSpaceObject.h"
@interface UIScrollViewViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *planetScrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) REJSpaceObject *spaceObject;


@end
