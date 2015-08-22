//
//  AddPlanetViewController.h
//  Outer Space Guide
//
//  Created by RobinJayaswal on 12/10/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REJSpaceObject.h"

@protocol AddPlanetViewControllerDelegate <NSObject>

@required

-(void)addSpaceObject:(REJSpaceObject *)addedObject;
-(void)didCancel;

@end

@interface AddPlanetViewController : UIViewController

@property (weak, nonatomic) id <AddPlanetViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *planetName;
@property (strong, nonatomic) IBOutlet UITextField *planetNickname;
@property (strong, nonatomic) IBOutlet UITextField *interestingFact;
@property (strong, nonatomic) IBOutlet UITextField *temperature;
@property (strong, nonatomic) IBOutlet UITextField *diameter;
@property (strong, nonatomic) IBOutlet UITextField *numberOfMoons;


- (IBAction)addButtonPressed:(UIButton *)sender;
- (IBAction)cancelButtonPressed:(UIButton *)sender;


@end
