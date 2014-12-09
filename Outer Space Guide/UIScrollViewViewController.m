//
//  UIScrollViewViewController.m
//  Outer Space Guide
//
//  Created by RobinJayaswal on 12/9/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import "UIScrollViewViewController.h"

@interface UIScrollViewViewController ()

@end

@implementation UIScrollViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageView = [[UIImageView alloc] initWithImage:self.spaceObject.image];
    self.planetScrollView.contentSize = self.imageView.frame.size;
    [self.planetScrollView addSubview:self.imageView];
    self.planetScrollView.delegate = self;
    self.planetScrollView.maximumZoomScale = 1.5;
    self.planetScrollView.minimumZoomScale = .6;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
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
