//
//  DataViewController.m
//  CorvallisRecycle
//
//  Created by Dave Beltramini on 5/12/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
//images from: http://www.myiconfinder.com/icon/phone-call-calling-contact-us-tele-telephone-//communication-cell-landline/10348

#import "DataViewController.h"

#import "BusinessViewController.h"
#import "RecycleViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "ItemViewController.h"
#import "BusinessInfoViewController.h"
#import "MapViewController.h"
#import<MapKit/MapKit.h>
#import<AddressBook/AddressBook.h>



@interface DataViewController () <NSURLSessionDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteLabel;
@property (weak, nonatomic) IBOutlet UILabel *AddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *PhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *WebSiteLabel;
@property (weak, nonatomic) IBOutlet UITextView *AddressField;
@property (weak, nonatomic) IBOutlet UIButton *MapButton;
@property (weak, nonatomic) IBOutlet UILabel *PhoneData;
@property (weak, nonatomic) IBOutlet UILabel *WSData;
@property CLLocationCoordinate2D coords;
@property (weak, nonatomic) NSString *NameDataText;
@property (weak, nonatomic) NSString *AddressDataText;
@property (weak, nonatomic) NSString *WSDataText;
@property (weak, nonatomic) NSString *PhoneDataText;
@property (weak,nonatomic) NSString *geocoder;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *NameData;
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, copy) NSArray *businesses;
@property (nonatomic, copy) NSArray *courses;
@property (nonatomic, strong) NSDictionary *theCourse;
@end

@implementation DataViewController
@synthesize NameDataText;
@synthesize AddressDataText;
@synthesize WSDataText;
@synthesize PhoneDataText;
@synthesize geocoder = _geocoder;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        NSLog(@"HERE");
        // Initialization code
        self.navigationItem.title = @"Business Info";
        NSURL *URL = self.businessViewController.URL;
        _URL = URL;
        NSURLSessionConfiguration *config =
        [NSURLSessionConfiguration defaultSessionConfiguration];
        
        _session = [NSURLSession sessionWithConfiguration:config
                                                 delegate:self
                                            delegateQueue:nil];
        _URL = URL;
    }
    return self;
}


- (void)setURL:(NSURL *)URL
{
    NSLog(@"set url");
    _URL = URL;
    NSLog(@"--URLset%@",URL);
    
    if (_URL) {
        [self fetchFeed];
    }
}

- (void)fetchFeed
{
    NSURLRequest *req = [NSURLRequest requestWithURL:_URL cachePolicy:NSURLRequestReloadIgnoringCacheData
                                     timeoutInterval:60.0];
    NSLog(@"jsonObject -->%@", _URL);
    NSURLSessionDataTask *dataTask =
    [self.session dataTaskWithRequest:req
                    completionHandler:
     ^(NSData *data, NSURLResponse *response, NSError *error) {
         
         
         NSError *err = nil;
         NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:0
                                                                      error:&err];
         self.businesses = jsonObject[@"courses"];
         NSArray *courses = jsonObject[@"courses"];
         for ( NSDictionary *theCourse in courses )
         {
             self.NameDataText = theCourse[@"name"];
             self.AddressDataText = theCourse[@"address"];
             self.PhoneDataText = theCourse[@"phonenumber"];
             self.WSDataText = theCourse[@"website"];
         }
         
         dispatch_async(dispatch_get_main_queue(), ^{
         });
     }];
    [dataTask resume];
}

-(void)map{
    
    NSLog(@"navigation call for map");
    self.mapViewController.AddressDataText = AddressDataText;
    self.mapViewController.NameDataText = NameDataText;
    [self.navigationController pushViewController:self.mapViewController animated:YES];
}
    
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.NameData.text = @"";
    self.AddressField.text = @"";
    self.PhoneData.text = @"";
    self.WSData.text = @"";
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.NameData.text = self.NameDataText;
    self.AddressField.text = self.AddressDataText;
    NSLog(@"AddressField %@", self.AddressField.text);
    if (![self.AddressField.text isEqualToString: @"N/A"])
    {
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithTitle:@"Map" style: UIBarButtonItemStylePlain    target:self action:@selector(map)];
    
    self.navigationItem.rightBarButtonItem = backButton;
    }
    self.WSData.text = self.WSDataText;
    self.PhoneData.text = self.PhoneDataText;
    if (![self.PhoneData.text isEqualToString: @"N/A"])
        {
 
        //code from: http://quantgreeks.com/convert-a-string-to-phone-number-format-in-objective-cswift/
        NSMutableString *stringts = [NSMutableString stringWithString:self.PhoneData.text];
        [stringts insertString:@"(" atIndex:0];
        [stringts insertString:@")" atIndex:4];
        [stringts insertString:@" " atIndex:5];
        [stringts insertString:@"-" atIndex:9];
        self.PhoneData.text = stringts;
        }
}

- (IBAction)addressButton:(id)sender {
    
    NSLog(@"addressButton");
   CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder
     geocodeAddressString:self.AddressField.text
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
                              (NSString *)kABPersonAddressStreetKey: _AddressField.text,
                              };
    
    MKPlacemark *place = [[MKPlacemark alloc]
                          initWithCoordinate:_coords
                          addressDictionary:address];
    MKMapItem *mapItem =
    [[MKMapItem alloc]initWithPlacemark:place];
    [mapItem openInMapsWithLaunchOptions:nil];
}

- (IBAction)viewWebSite:(id)sender
{

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.WSDataText]];
    
}

-(IBAction)callPhone:(id)sender {
    NSLog(@"--open url%@",self.PhoneDataText);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@", self.PhoneDataText]]];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end