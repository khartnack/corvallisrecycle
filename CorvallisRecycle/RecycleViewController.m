//
//  RecycleViewController.m
//  TableMain
//
//  Created by Dave Beltramini on 5/3/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
//

#import "RecycleViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "ItemViewController.h"
#import "BusinessViewController.h"

@interface RecycleViewController () <NSURLSessionDelegate>

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, copy) NSArray *courses;


@end

@implementation RecycleViewController



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
         self.courses = jsonObject[@"courses"];
         
         
         NSLog(@"courses -->%@", self.courses);
         
         dispatch_async(dispatch_get_main_queue(), ^{
             [self.tableView reloadData];
         });
     }];
    [dataTask resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.courses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                    forIndexPath:indexPath];
    
    NSDictionary *course = self.courses[indexPath.row];
    cell.textLabel.text = course[@"title"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *course = self.courses[indexPath.row];
    NSURL *URL = [NSURL URLWithString:course[@"url"]];
    
    self.businessViewController.title = course[@"title"];
    self.businessViewController.URL = URL;
    NSLog(@"--%@",URL);
    [self.navigationController pushViewController:self.businessViewController animated:YES];
}

- (void)  URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
 didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
   completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler
{
    NSURLCredential *cred =
    [NSURLCredential credentialWithUser:@"BigNerdRanch"
                               password:@"AchieveNerdvana"
                            persistence:NSURLCredentialPersistenceForSession];
    completionHandler(NSURLSessionAuthChallengeUseCredential, cred);
}


@end