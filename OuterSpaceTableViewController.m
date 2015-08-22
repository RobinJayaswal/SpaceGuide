//
//  OuterSpaceTableViewController.m
//  Outer Space Guide
//
//  Created by RobinJayaswal on 12/6/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import "OuterSpaceTableViewController.h"
#import "REJSpaceObject.h"
#import "AstronomicalData.h"
#import "secondaryViewController.h"
#import "InfoTableViewController.h"
#import "REJAddedSpaceObject.h"

@interface OuterSpaceTableViewController ()

@end

@implementation OuterSpaceTableViewController

#pragma mark - Lazy Instansiation

-(NSMutableArray *)planets
{
    if (!_planets)
    {
        _planets = [[NSMutableArray alloc] init];
    }
    return _planets;
}

-(NSMutableArray *)addedPlanets
{
    if (!_addedPlanets)
    {
        _addedPlanets = [[NSMutableArray alloc] init];
    }
    return _addedPlanets;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    for (NSDictionary *planetData in [AstronomicalData allKnownPlanets])
    {
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        
        REJSpaceObject *planet = [[REJSpaceObject alloc] initWithData:planetData andWithPicture:[UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
    }
    
    NSArray *myPlanetsAsPropertyLists = [[NSUserDefaults standardUserDefaults] arrayForKey:@"Object"];
    for (NSDictionary *dictionary in myPlanetsAsPropertyLists)
    {
        REJSpaceObject *spaceObject = [self spaceObjectForDictionary:dictionary];
        [self.addedPlanets addObject:spaceObject];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Learning about NSDictionary
//Learning about NSDictionary:

//    NSString *firstColor = @"Red";
//    //create mutable dictionary
//    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
//    //set an object, and set a key to access this object
//    [myDictionary setObject:firstColor forKey:@"Fire Truck Color"];
//    NSLog(@"%@", myDictionary);
//    //access an object by calling method objectForKey on myDictionary
//    NSString *fireTruckColor = [myDictionary objectForKey:@"Fire Truck Color"];
//    NSLog(@"%@", fireTruckColor);

//    NSNumber *myNumber = [NSNumber numberWithInt:5];
//    NSNumber *floatNumber = [NSNumber numberWithFloat:3.14];
//    you can only put objects, not primitives, in your arrays and dictionaries. NSNumber wraps your primitive in an object.
#pragma mark - AddPlanetViewControllerDelegate Methods
-(void)didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)addSpaceObject:(REJSpaceObject *)addedObject
{
    [self.addedPlanets addObject:addedObject];
    
    //will add object to be added to NSUserDefaults and stored there
    NSMutableArray *spaceObjectsReadyForStorage = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"Object"] mutableCopy];
    if (!spaceObjectsReadyForStorage) spaceObjectsReadyForStorage = [[NSMutableArray alloc] init];
    [spaceObjectsReadyForStorage addObject:[self preparePlanetForNSUserDefaults:addedObject]];
    [[NSUserDefaults standardUserDefaults] setObject:spaceObjectsReadyForStorage forKey:@"Object"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData];
}

#pragma mark - Helper Methods

-(NSDictionary *)preparePlanetForNSUserDefaults:(REJSpaceObject *)spaceObject
{
    NSData *imageData = UIImagePNGRepresentation(spaceObject.image);
    NSDictionary *dictionaryToStore = @{PLANET_NAME : spaceObject.name, PLANET_NICKNAME : spaceObject.nickname, PLANET_INTERESTING_FACT : spaceObject.funFact, PLANET_TEMPERATURE : @(spaceObject.temperature), PLANET_DIAMETER : @(spaceObject.diameter), PLANET_NUMBER_OF_MOONS : @(spaceObject.numberOfMoons), PLANET_IMAGE : imageData};
    return dictionaryToStore;
}

-(REJSpaceObject *)spaceObjectForDictionary:(NSDictionary *)dictionary
{
    NSData *imageData = dictionary[PLANET_IMAGE];
    REJSpaceObject *spaceObject = [[REJSpaceObject alloc] initWithData:dictionary andWithPicture:[UIImage imageNamed:@"EinsteinRing.jpg"]];
    return spaceObject;
}

#pragma mark - Preparing for Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]])
    {
        if ([segue.destinationViewController isKindOfClass:[secondaryViewController class]])
        {
            secondaryViewController *nextView = segue.destinationViewController;
            NSIndexPath *rowPressed = [self.tableView indexPathForCell:sender];
            if (rowPressed.section == 0)
            {
                REJSpaceObject *newObject = [self.planets objectAtIndex:rowPressed.row];
                nextView.spaceObject = newObject;
            }
            if (rowPressed.section == 1)
            {
                REJSpaceObject *newObject = [self.addedPlanets objectAtIndex:rowPressed.row];
                nextView.spaceObject = newObject;
            }
        }
    }
    if ([sender isKindOfClass:[NSIndexPath class]])
    {
        if ([segue.destinationViewController isKindOfClass:[InfoTableViewController class]])
        {
            InfoTableViewController *nextView = segue.destinationViewController;
            NSIndexPath *rowPressed = sender;
            if (rowPressed.section ==0)
            {
                REJSpaceObject *spaceObject = [self.planets objectAtIndex:rowPressed.row];
                nextView.spaceObject = spaceObject;
            }
            else
            {
                REJSpaceObject *spaceObject = [self.addedPlanets objectAtIndex:rowPressed.row];
                nextView.spaceObject = spaceObject;
            }
            
        }
    }
    if ([segue.destinationViewController isKindOfClass:[AddPlanetViewController class]])
    {
        AddPlanetViewController *addedSpaceObject = segue.destinationViewController;
        addedSpaceObject.delegate = self;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    if ([self.addedPlanets count])
    {
        return 2;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 1) return [self.addedPlanets count];
    if (section == 0) return [self.planets count];
    else return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //configure the cell
    if (indexPath.section == 1) {
        REJSpaceObject *createdPlanet = [self.addedPlanets objectAtIndex:indexPath.row];
        cell.textLabel.text = createdPlanet.name;
        cell.detailTextLabel.text = createdPlanet.nickname;
        cell.imageView.image = createdPlanet.image;
    }
    else {
        REJSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.image;
    }
    
    //general
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:.5 alpha:1];
    cell.textLabel.highlightedTextColor = [UIColor blueColor];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
    
}

#pragma mark - TableView Delegate

-(void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"push to datatable" sender:indexPath];
    
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) return YES;
    else return NO;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        REJSpaceObject *removedObject = [self.addedPlanets objectAtIndex:indexPath.row];
        [self.addedPlanets removeObject:removedObject];
        NSMutableArray *updatedArray = [[NSMutableArray alloc] init];
        for (REJSpaceObject *spaceObject in self.addedPlanets)
        {
            [updatedArray addObject:[self preparePlanetForNSUserDefaults:spaceObject]];
        }
        [[NSUserDefaults standardUserDefaults] setObject:updatedArray forKey:@"Object"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        // Delete the row from the data source
        
        
        if (updatedArray.count > 0)
        {
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        else
        {
            [tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
        }
    }
    
    
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
