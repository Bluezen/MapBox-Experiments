//
//  ViewController.m
//  MapBoxTest
//
//  Created by Adrien Long on 30/06/2016.
//  Copyright © 2016 Corellis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.mapView setUserTrackingMode:MGLUserTrackingModeFollowWithHeading];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.mapView setCenterCoordinate:self.mapView.userLocation.coordinate
                                zoomLevel:15
                                 animated:YES];
    });
}

@end
