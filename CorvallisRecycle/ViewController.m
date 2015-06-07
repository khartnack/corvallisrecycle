//
//  ViewController.m
//  CorvallisRecycle
//
//  Created by Dave Beltramini on 5/6/15.
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

-(void)home{
    
    NSLog(@"navigation call for info");
    [self.navigationController pushViewController:infoViewController animated:YES];
}


- (void)fetchFeed
{
    NSString *requestString = @"http://web.engr.oregonstate.edu/~marshale/recycleAPI/category";
    
   // NSString *requestString = @"http://web.engr.oregonstate.edu/~beltramk/cs496/nerdranch5";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url  cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];
   
    
    NSURLSessionDataTask *dataTask =
    [self.session dataTaskWithRequest:req
                    completionHandler:
     ^(NSData *data, NSURLResponse *response, NSError *error) {
         
         NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:0
                                                                      error:nil];
         self.categories = jsonObject[@"courses"];
         
         NSLog(@"%@", self.categories);
         
         dispatch_async(dispatch_get_main_queue(), ^{
             [self.tableView reloadData];
         });
     }];
    [dataTask resume];
    

     
                               
}

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
    
    NSLog(@"--%@",URL);
    
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

