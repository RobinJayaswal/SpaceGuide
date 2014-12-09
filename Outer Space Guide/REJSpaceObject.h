//
//  REJSpaceObject.h
//  Outer Space Guide
//
//  Created by RobinJayaswal on 12/7/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface REJSpaceObject : NSObject

-(id)initWithData: (NSDictionary *)data andWithPicture: (UIImage *)image;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *funFact;
@property (nonatomic) float gravity;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float temperature;
@property (nonatomic) int numberOfMoons;
@property (strong,nonatomic) UIImage *image;
@end
