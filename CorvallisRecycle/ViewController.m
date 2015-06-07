//
//  ViewController.m
//  CorvallisRecycle
//
//  Created by Katie Beltramini on 5/6/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ItemViewController.h"
#import "InfoViewController.h"
#import "BusinessViewController.h"
#import "DataViewController.h"

@interface ViewController () <NSURLSessionDelegate>

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, copy) NSArray *categories;

@end

@implementation ViewController
@synthesize infoViewController;

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title = @"Corvallis Reuse and Repair Directory";
        
        NSURLSessionConfiguration *config =
        [NSURLSessionConfiguration defaultSessionConfiguration];
        
        _session = [NSURLSession sessionWithConfiguration:config
                                                 delegate:self
                                            delegateQueue:nil];
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
        NSLog(@"bi%@", bundleIdentifier);
        [self fetchFeed];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithTitle:@"Info" style: UIBarButtonItemStylePlain    target:self action:@selector(home)];
    self.navigationItem.leftBarButtonItem = backButton;
}

//if the user clicks on info, then they will go to a new view with information on this app
-(void)home{
    
    NSLog(@"navigation call for info");
    [self.navigationController pushViewController:infoViewController animated:YES];
}

//fetches the data for the feed using a json api
- (void)fetchFeed
{
    NSString *requestString = @"http://web.engr.oregonstate.edu/~marshale/recycleAPI/category";
    NSURL *url = [NSURL URLWithString:requestString];
    //sets the cache policy for the api
    NSURLRequest *req = [NSURLRequest requestWithURL:url  cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];
   
    
    NSURLSessionDataTask *dataTask =
    [self.session dataTaskWithRequest:req
                    completionHandler:
     ^(NSData *data, NSURLResponse *response, NSError *error) {
         
         NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:0
                                                                      error:nil];
         self.categories = jsonObject[@"courses"];
         dispatch_async(dispatch_get_main_queue(), ^{
             [self.tableView reloadData];
         });
     }];
    [dataTask resume];
    
}


//creates a table view ui for data
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.categories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                    forIndexPath:indexPath];
    
    NSDictionary *category = self.categories[indexPath.row];
    cell.textLabel.text = category[@"title"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //NSLog(@"called");
    NSDictionary *category = self.categories[indexPath.row];
    NSURL *URL = [NSURL URLWithString:category[@"url"]];
    
    //logic to push these 2 pieces of data to the next view
    self.itemViewController.title = category[@"title"];
    self.itemViewController.URL = URL;
    
    [self.navigationController pushViewController:self.itemViewController
                                         animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
   
    [super viewWillDisappear:animated];
}


- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{

}


@end

