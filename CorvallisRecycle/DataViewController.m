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

@interface DataViewController () <NSURLSessionDelegate>
@property (weak, nonatomic) IBOutlet UILabel *AddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *PhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *WebSiteLabel;
@property (weak, nonatomic) IBOutlet UILabel *NotesLabel;
@property (weak, nonatomic) IBOutlet UILabel *StreetData;
@property (weak, nonatomic) IBOutlet UILabel *CityData;
@property (weak, nonatomic) IBOutlet UILabel *StateData;
@property (weak, nonatomic) IBOutlet UILabel *ZipData;
@property (weak, nonatomic) IBOutlet UILabel *PhoneData;
@property (weak, nonatomic) IBOutlet UILabel *WSData;
@property (weak, nonatomic) IBOutlet UITextView *NotesData;

@property (weak, nonatomic) NSString *NameDataText;
@property (weak, nonatomic) NSString *AddressDataText;
@property (weak, nonatomic) NSString *CityDataText;
@property (weak, nonatomic) NSString *StateDataText;
@property (weak, nonatomic) NSString *ZipDataText;
@property (weak, nonatomic) NSString *WSDataText;
@property (weak, nonatomic) NSString *NotesDataText;
@property (weak, nonatomic) NSString *PhoneDataText;

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
@synthesize CityDataText;
@synthesize StateDataText;
@synthesize ZipDataText;
@synthesize WSDataText;
@synthesize NotesDataText;
@synthesize PhoneDataText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        NSLog(@"HERE");
        // Initialization code
        self.navigationItem.title = @"Categories";
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


/*
 - (void)didReceiveMemoryWarning {
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
 }*/

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
    
  
    NSLog(@"--%@",_URL);
    NSLog(@"fetch feed");
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
         //self.NameData= [jsonObject objectForKey:@"title"];
         NSArray *courses = jsonObject[@"courses"];
         for ( NSDictionary *theCourse in courses )
         {
             NSLog(@"----");
             NSLog(@"Title: %@", theCourse[@"title"] );
             self.NameDataText = theCourse[@"title"];
             self.AddressDataText = theCourse[@"address"];
             self.CityDataText = theCourse[@"city"];
             self.StateDataText = theCourse[@"state"];
             self.ZipDataText = theCourse[@"zip"];
             self.PhoneDataText = theCourse[@"phone"];
             self.WSDataText = theCourse[@"website"];
             self.NotesDataText = theCourse[@"notes"];
      
             
             NSLog(@"----");
         }
         
     dispatch_async(dispatch_get_main_queue(), ^{
         
        
         });
     }];
    [dataTask resume];
}


-(void)viewWillAppear:(BOOL)animated
{
  
    [super viewWillAppear:animated];
    self.NameData.text = self.NameDataText;
    self.CityData.text = self.CityDataText;
    self.StreetData.text = self.AddressDataText;
    self.StateData.text = self.StateDataText;
    self.ZipData.text = self.ZipDataText;
    self.WSData.text = self.WSDataText;
    self.PhoneData.text = self.PhoneDataText;
    self.NotesData.text = self.NotesDataText;
    
//- (void)viewDidLoad {
  
   // self.NameData = _NameData;

  //    [super viewDidLoad];
    // Do any additional setup after loading the view frm its nib.
    NSLog(@"HERE2");
 //   [[NSOperationQueue mainQueue] addOperationWithBlock:^{
    
    //}];
    
    
}

- (IBAction)viewWebSite:(id)sender
{
     NSLog(@"--open url%@",self.WSData.text);
     NSLog(@"--open url2%@",self.WSDataText);
   // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://site.republicservices.com/site/corvallis-or/en/documents/corvallisrecycledepot.pdf"]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.WSDataText]];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end