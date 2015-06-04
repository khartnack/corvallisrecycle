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
//@property (weak, nonatomic) NSString *NameDataText;
//@property (weak, nonatomic) NSString *AddressDataText;
@property (weak,nonatomic) NSString *geocoder;
//@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) PlaceAnnotation *annotation;
//@property (nonatomic, copy) NSString *title;
@end

@implementation MapViewController
@synthesize NameDataText;
@synthesize AddressDataText;
@synthesize geocoder = _geocoder;



/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Initialization code
        self.navigationItem.title = @"Map";
      
    }
    return self;
}*/


-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
     self.navigationItem.title = @"Map";
   // [super viewDidLoad];
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
            // [self.mapView setCenterCoordinate:annotation.coordinate
                         //             animated:YES];
             
             
             CLLocationDistance regionWidth  = 750;
             CLLocationDistance regionHeight = 750;
             MKCoordinateRegion startRegion = MKCoordinateRegionMakeWithDistance(startCenter,regionWidth, regionHeight);
             [self.mapView setRegion:startRegion animated:YES];
             
         //}
            // [self showMap];
         }
     }];
   // CLLocationCoordinate2D startCenter = _location;
    //CLLocationCoordinate2DMake(28.5407,-81.3786);
   // CLLocationDistance regionWidth  = 1500;
   // CLLocationDistance regionHeight = 1500;
   // MKCoordinateRegion startRegion = MKCoordinateRegionMakeWithDistance(startCenter,regionWidth, regionHeight);
   // [self.mapView setRegion:startRegion animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (IBAction)addressButton:(id)sender {
    
    NSLog(@"addressButton");
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
             _coords = location.coordinate;
             
             [self showMap];
         }
     }];
}

-(void)showMap
{
    NSDictionary *address = @{
                              (NSString *)kABPersonAddressStreetKey: AddressDataText,
                              };
    
    MKPlacemark *place = [[MKPlacemark alloc]
                          initWithCoordinate:_coords
                          addressDictionary:address];
    MKMapItem *mapItem =
    [[MKMapItem alloc]initWithPlacemark:place];
    [mapItem openInMapsWithLaunchOptions:nil];
   
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
