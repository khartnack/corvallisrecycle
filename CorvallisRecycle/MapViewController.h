//
//  MapViewController.h
//  CorvallisRecycle
//
//  Created by Dave Beltramini on 6/1/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
//
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>
#import "DataViewController.h"
#import "AppDelegate.h"

@class DataViewController;
@class MapViewController;
@interface MapViewController : UIViewController  <MKMapViewDelegate>
@property (strong, nonatomic) MKMapView *mapView;
@property (strong, nonatomic) NSString *AddressDataText;
@property (strong, nonatomic) NSString *NameDataText;
@property (strong, nonatomic) MapViewController *mapViewController;
@property (strong,nonatomic) DataViewController *dataViewController;
@property (nonatomic, strong) NSArray *mapItemList;
@property (nonatomic, assign) MKCoordinateRegion boundingRegion;
@end
