//
//  REJSpaceObject.m
//  Outer Space Guide
//
//  Created by RobinJayaswal on 12/7/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import "REJSpaceObject.h"
#import "AstronomicalData.h"

@implementation REJSpaceObject

-(id) init
{
    self = [self initWithData:nil andWithPicture:nil];
    return self;
}

-(id) initWithData:(NSDictionary *)data andWithPicture:(UIImage *)image
{
    self = [super init];
    
    self.name = data[PLANET_NAME];
    self.nickname = data[PLANET_NICKNAME];
    self.funFact = data[PLANET_INTERESTING_FACT];
    self.gravity = [data[PLANET_GRAVITY] floatValue];
    self.diameter = [data[PLANET_DIAMETER] floatValue];
    self.numberOfMoons = [data[PLANET_NUMBER_OF_MOONS] integerValue];
    self.temperature = [data[PLANET_TEMPERATURE] floatValue];
    self.yearLength = [data[PLANET_YEAR_LENGTH] floatValue];
    self.dayLength = [data[PLANET_DAY_LENGTH] floatValue];
    self.image = image;
    
    return self;
}

@end
