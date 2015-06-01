//
//  BusinessViewController.m
//  TableMain
//
//  Created by Dave Beltramini on 5/5/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
// testtest

#import "BusinessViewController.h"
#import "RecycleViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "ItemViewController.h"
#import "BusinessInfoViewController.h"
#import "DataViewController.h"

@interface BusinessViewController () <NSURLSessionDelegate>

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, copy) NSArray *businesses;


@end

@implementation BusinessViewController
@synthesize dataViewController;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Initialization code
        self.navigationItem.title = @"Categories";
        NSURLSessionConfiguration *config =
        [NSURLSessionConfiguration defaultSessionConfiguration];
        
        _session = [NSURLSession sessionWithConfiguration:config
                                                 delegate:self
                                            delegateQueue:nil];
        
    }
    return self;
}


- (void)setURL:(NSURL *)URL
{
    _URL = URL;
    
    NSLog(@"--%@",URL);
    if (_URL) {
        [self fetchFeed];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewdidload");
    
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithTitle:@"Map" style: UIBarButtonItemStylePlain    target:self action:@selector(map)];

    self.navigationItem.rightBarButtonItem = backButton;
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

-(void)map{
    
    NSLog(@"navigation call for map");
 
    
    
}

- (void)fetchFeed
{
    
    NSURLRequest *req = [NSURLRequest requestWithURL:_URL cachePolicy:NSURLRequestReloadIgnoringCacheData
                                     timeoutInterval:60.0];
    
    NSURLSessionDataTask *dataTask =
    [self.session dataTaskWithRequest:req
                    completionHandler:
     ^(NSData *data, NSURLResponse *response, NSError *error) {
         
         
         NSLog(@"data -->%@", data);
         NSError *err = nil;
         NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:0
                                                                      error:&err];
         
         NSLog(@"err %@",err);
         
         NSLog(@"jsonObject -->%@", jsonObject);
         self.businesses = jsonObject[@"courses"];
         
         
         NSLog(@"courses -->%@", self.businesses);
         
         dispatch_async(dispatch_get_main_queue(), ^{
             [self.tableView reloadData];
         });
     }];
    [dataTask resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.businesses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                    forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSDictionary *business = self.businesses[indexPath.row];
    cell.textLabel.text = business[@"title"];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *business = self.businesses[indexPath.row];
    NSURL *URL = [NSURL URLWithString:business[@"url"]];
    
    self.dataViewController.title = business[@"title"];
  //  self.businessInfoViewController.URL = URL;
    self.dataViewController.URL = URL;
   // NSLog(@"--%@",URL);
  //  [self.navigationController pushViewController:self.businessInfoViewController animated:YES];
    [self.navigationController pushViewController:self.dataViewController animated:YES];

     
}


/*- (void)  URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
 didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
   completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler
{
    NSURLCredential *cred =
    [NSURLCredential credentialWithUser:@"BigNerdRanch"
                               password:@"AchieveNerdvana"
                            persistence:NSURLCredentialPersistenceForSession];
    completionHandler(NSURLSessionAuthChallengeUseCredential, cred);
}*/

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    
    
}

@end