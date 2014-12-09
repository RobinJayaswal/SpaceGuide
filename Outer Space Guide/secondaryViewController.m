//
//  secondaryViewController.m
//  Outer Space Guide
//
//  Created by RobinJayaswal on 12/8/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import "secondaryViewController.h"
#import "UIScrollViewViewController.h"

@interface secondaryViewController ()

@end

@implementation secondaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.gravityNumber.text = [NSString stringWithFormat:@"%f", self.spaceObject.gravity];
    self.spaceImage.image = self.spaceObject.image;
    self.planet.text = self.spaceObject.name;
    self.nickname.text = self.spaceObject.nickname;
    self.interestingfact.text = self.spaceObject.funFact;
    self.diameter.text = [NSString stringWithFormat:@"%f", self.spaceObject.diameter];
    self.temperature.text = [NSString stringWithFormat:@"%f", self.spaceObject.temperature];
    self.moons.text = [NSString stringWithFormat:@"%i", self.spaceObject.numberOfMoons];
    self.day.text = [NSString stringWithFormat:@"%f", self.spaceObject.dayLength];
    self.year.text = [NSString stringWithFormat:@"%f", self.spaceObject.yearLength];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UIButton class]])
    {
        if ([segue.destinationViewController isKindOfClass:[UIScrollViewViewController class]])
             {
                 UIScrollViewViewController *nextView = segue.destinationViewController;
                 nextView.spaceObject = self.spaceObject;
             }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
