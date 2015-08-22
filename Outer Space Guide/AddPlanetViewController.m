//
//  AddPlanetViewController.m
//  Outer Space Guide
//
//  Created by RobinJayaswal on 12/10/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import "AddPlanetViewController.h"

@interface AddPlanetViewController ()

@end

@implementation AddPlanetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self.delegate didCancel];
}
- (IBAction)addButtonPressed:(UIButton *)sender {
    REJSpaceObject *newObject = [[REJSpaceObject alloc] init];
    newObject.name = self.planetName.text;
    newObject.nickname = self.planetNickname.text;
    newObject.funFact = self.interestingFact.text;
    newObject.temperature = [self.temperature.text floatValue];
    newObject.diameter = [self.diameter.text floatValue];
    newObject.numberOfMoons = [self.numberOfMoons.text intValue];
    newObject.image = [UIImage imageNamed:@"EinsteinRing.jpg"];
    [self.delegate addSpaceObject:newObject];
}
@end
