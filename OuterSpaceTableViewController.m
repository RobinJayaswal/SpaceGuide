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

@interface OuterSpaceTableViewController ()

@end

@implementation OuterSpaceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.planets = [[NSMutableArray alloc] init];
    
    for (NSDictionary *planetData in [AstronomicalData allKnownPlanets])
    {
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        
        REJSpaceObject *planet = [[REJSpaceObject alloc] initWithData:planetData andWithPicture:[UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
        
        
    }
    
    
    
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
    
    
    NSNumber *myNumber = [NSNumber numberWithInt:5];
    NSNumber *floatNumber = [NSNumber numberWithFloat:3.14];
    //you can only put objects, not primitives, in your arrays and dictionaries. NSNumber wraps your primitive in an object.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]])
    {
        if ([segue.destinationViewController isKindOfClass:[secondaryViewController class]])
        {
            secondaryViewController *nextView = segue.destinationViewController;
            NSIndexPath *rowPressed = [self.tableView indexPathForCell:sender];
            REJSpaceObject *newObject = [self.planets objectAtIndex:rowPressed.row];
            nextView.spaceObject = newObject;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    return [self.planets count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    // Configure the cell...
    REJSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
    cell.textLabel.text = planet.name;
    cell.detailTextLabel.text = planet.nickname;
    cell.imageView.image = planet.image;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:.5 alpha:1];
    cell.textLabel.highlightedTextColor = [UIColor blueColor];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
