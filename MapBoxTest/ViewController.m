//
//  ViewController.m
//  MapBoxTest
//
//  Created by Adrien Long on 30/06/2016.
//  Copyright © 2016 Corellis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <MGLMapViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mapView setDelegate:self];
    
    [self.mapView setUserTrackingMode:MGLUserTrackingModeFollowWithHeading];
    [self displayTrackingModeWithMessage:@"viewDidLoad"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self displayTrackingModeWithMessage:@"5 scd before"];
        
        [self.mapView setUserTrackingMode:MGLUserTrackingModeFollowWithHeading];
        
        [self displayTrackingModeWithMessage:@"5 scd after"];
        
        [self.mapView setCenterCoordinate:self.mapView.userLocation.coordinate
                                zoomLevel:15
                                 animated:YES];
    });
}

- (void)mapViewDidFinishLoadingMap:(MGLMapView *)mapView
{
    [self displayTrackingModeWithMessage:@"mapViewDidFinishLoadingMap"];
}

- (void)mapViewDidFinishRenderingMap:(MGLMapView *)mapView fullyRendered:(BOOL)fullyRendered
{
    [self displayTrackingModeWithMessage:@"mapViewDidFinishRenderingMap"];
}

#pragma mark - Private

- (void)displayTrackingModeWithMessage:(NSString *)message
{
    NSString *trackingMode = trackingModeToString(self.mapView.userTrackingMode);
    
    if (trackingMode) {
        NSLog(@"\n\n%@ \n\t:: Tracking Mode :: %@", message, trackingMode);
    }
}

NS_INLINE NSString *trackingModeToString(MGLUserTrackingMode mode)
{
    switch (mode) {
        case MGLUserTrackingModeNone: {
            return @"None";
        } break;
        case MGLUserTrackingModeFollow: {
            return @"Follow";
        } break;
        case MGLUserTrackingModeFollowWithCourse: {
            return @"FollowWithCourse";
        } break;
        case MGLUserTrackingModeFollowWithHeading: {
            return @"FollowWithHeading";
        } break;
        default:
            break;
    }
    
    return @"Unknown";
}

@end
