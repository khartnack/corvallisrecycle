//
//  MapViewController.m
//  CorvallisRecycle
//
//  Created by Dave Beltramini on 6/1/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
//
#import "DataViewController.h"
#import "BusinessViewController.h"
#import "RecycleViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "ItemViewController.h"
#import "BusinessInfoViewController.h"

#import<AddressBook/AddressBook.h>
#import "MapViewController.h"
#import "PlaceAnnotation.h"

@interface MapViewController ()
@property CLLocationCoordinate2D coords;
@property (weak,nonatomic) NSString *geocoder;
@property (nonatomic, strong) PlaceAnnotation *annotation;
@end

@implementation MapViewController
@synthesize NameDataText;
@synthesize AddressDataText;
@synthesize geocoder = _geocoder;


-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
     self.navigationItem.title = @"Map";
    self.mapView = [[MKMapView alloc] init];
    self.mapView.frame = CGRectMake(0, 0,self.view.bounds.size.width,self.view.bounds.size.height);
    self.mapView.delegate = self;
    self.mapView.mapType = MKMapTypeStandard;
    [self.view addSubview:self.mapView];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder
     geocodeAddressString:AddressDataText
     completionHandler:^(NSArray *placemarks,
                         NSError *error) {
         
         if (error) {
             NSLog(@"Geocode failed with error: %@", error);
             return;
         }
         
         if (placemarks && placemarks.count > 0)
         {
             CLPlacemark *placemark = placemarks[0];
             CLLocation *location = placemark.location;
             CLLocationCoordinate2D startCenter = location.coordinate;
             PlaceAnnotation *annotation = [[PlaceAnnotation alloc] init];
             annotation.coordinate = startCenter;
             annotation.title = NameDataText;
             self.mapView.zoomEnabled = YES;
             self.mapView.scrollEnabled = YES;
             [self.mapView addAnnotation:annotation];
             
             CLLocationDistance regionWidth  = 1500;
             CLLocationDistance regionHeight = 1500;
             MKCoordinateRegion startRegion = MKCoordinateRegionMakeWithDistance(startCenter,regionWidth, regionHeight);
             [self.mapView setRegion:startRegion animated:YES];
         }
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
