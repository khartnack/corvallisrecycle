//
//  BusinessViewController.m
//  TableMain
//
//  Created by Dave Beltramini on 5/5/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
//test

#import "BusinessViewController.h"
#import "RecycleViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "ItemViewController.h"
#import "BusinessInfoViewController.h"



@interface BusinessInfoViewController () <NSURLSessionDelegate>

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSArray *courses;
//@property (nonatomic, copy) NSArray *courses;
//@property (nonatomic, copy) NSData *data;
@property (strong, nonatomic) UITableViewCell *nameCell;
@property (strong, nonatomic) UITableViewCell *addressCell;
@property (strong, nonatomic) UITableViewCell *cityCell;
@property (strong, nonatomic) UITableViewCell *stateCell;
@property (strong, nonatomic) UITableViewCell *zipCell;
@property (strong, nonatomic) UITableViewCell *phoneCell;
@property (strong, nonatomic) UITableViewCell *webCell;
@property (strong, nonatomic) UITableViewCell *noteCell;
@property (strong, nonatomic) UITextField *nameText;
@property (strong, nonatomic) UITextField *addressText;
@property (strong, nonatomic) UITextField *cityText;
@property (strong, nonatomic) UITextField *stateText;
@property (strong, nonatomic) UITextField *zipText;
@property (strong, nonatomic) UITextField *phoneText;
@property (strong, nonatomic) UITextField *webText;
@property (strong, nonatomic) UITextField *noteText;
@property (strong,nonatomic) NSIndexPath *indexPath;

@end

@implementation BusinessInfoViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Initialization code
        self.navigationItem.title = @"Categories";
        NSURLSessionConfiguration *config =
        [NSURLSessionConfiguration defaultSessionConfiguration];
        
        _session = [NSURLSession sessionWithConfiguration:config
                                                 delegate:self
                                            delegateQueue:nil];
        // _courses = [NSArray alloc];
        
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


- (void)fetchFeed
{
    
    NSURLRequest *req = [NSURLRequest requestWithURL:_URL cachePolicy:NSURLRequestReloadIgnoringCacheData
                                     timeoutInterval:60.0];
    
    NSURLSessionDataTask *dataTask =
    [self.session dataTaskWithRequest:req
                    completionHandler:
     ^(NSData *data, NSURLResponse *response, NSError *error) {
         
         
         //NSLog(@"data -->%@", data);
         NSError *err = nil;
         NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:0
                                                                      error:&err];
         
         // NSLog(@"err %@",err);
         
         //NSLog(@"jsonObject -->%@", jsonObject);
         self.courses = jsonObject[@"courses"];
         
         NSLog(@"courses -->%@", self.courses);
         
         dispatch_async(dispatch_get_main_queue(), ^{
             [self.tableView reloadData];
         });
     }];
    [dataTask resume];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    NSLog(@"viewdidload");
    /* self.nameCell = [[UITableViewCell alloc] init];
     self.nameCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
     
     self.cityCell = [[UITableViewCell alloc] init];
     self.cityCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
     //NSLog(@"--%@",courses);
     
     NSDictionary *course = self.courses[_indexPath.row];
     // NSData *data = [stringJson dataUsingEncoding:NSUTF8StringEncoding];
     //NSDictionary *course = [NSJSONSerialization JSONObjectWithData:_data options:kNilOptions error:&error];
     self.nameCell.textLabel.text = @"Corvallis Reuse";
     //self.nameText.text = course[@"title"];
     [self.nameCell addSubview:self.cityText];
     //cell.textLabel.text = course[@"title"];
     self.cityCell.textLabel.text = course[@"city"];
     //self.cityCell.textLabel.text = @"Corvallis";
     [self.cityCell addSubview:self.cityText]; */
    
    NSLog(@"--%@",self.cityCell.textLabel.text);
    
    
    // [self.tableView registerClass:[UITableViewCell class]
    //        forCellReuseIdentifier:@"UITableViewCell"];
}


//KB: Return the number of sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

//KB: Return the number of rows for each section in your static table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch(section)
    {
        case 0:  return 6;  // section 0 has 6 rows
        case 1:  return 1;
        case 2:  return 1;
        default: return 0;
    };
}

// Return the row for the corresponding section and row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell =
    // [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
    //                              forIndexPath:indexPath];
    
    self.nameCell = [[UITableViewCell alloc] init];
    self.nameCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
    
    self.addressCell = [[UITableViewCell alloc] init];
    self.addressCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
    
    self.cityCell = [[UITableViewCell alloc] init];
    self.cityCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
    
    self.stateCell = [[UITableViewCell alloc] init];
    self.stateCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
    
    self.zipCell = [[UITableViewCell alloc] init];
    self.zipCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
    
    
    self.phoneCell = [[UITableViewCell alloc] init];
    self.phoneCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
    
    
    self.webCell = [[UITableViewCell alloc] init];
    self.webCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
    
    
    self.noteCell = [[UITableViewCell alloc] init];
    self.noteCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
    
    //NSLog(@"--%@",courses);
    
    NSDictionary *course = self.courses[_indexPath.row];
    // NSData *data = [stringJson dataUsingEncoding:NSUTF8StringEncoding];
    //NSDictionary *course = [NSJSONSerialization JSONObjectWithData:_data options:kNilOptions error:&error];
    
    //self.nameCell.textLabel.text = @"Corvallis Reuse";
    self.nameCell.textLabel.text = course[@"title"];
    [self.nameCell addSubview:self.nameText];
    self.addressCell.textLabel.text = course[@"address"];
    [self.addressCell addSubview:self.nameText];
    
    self.cityCell.textLabel.text = course[@"city"];
    [self.cityCell addSubview:self.cityText];
    
    self.stateCell.textLabel.text = course[@"state"];
    [self.stateCell addSubview:self.stateText];
    
    self.zipCell.textLabel.text = course[@"zip"];
    [self.zipCell addSubview:self.nameText];
    
    self.phoneCell.textLabel.text = course[@"phone"];
    [self.phoneCell addSubview:self.nameText];
    
    self.webCell.textLabel.text = course[@"website"];
    [self.webCell addSubview:self.nameText];
    
    self.noteCell.textLabel.text = course[@"notes"];
    [self.noteCell addSubview:self.nameText];
    switch(indexPath.section)
    {
        case 0:
            switch(indexPath.row)
        {
                
            case 0: return self.nameCell;  // section 0, row 0 is the first name
            case 1: return self.addressCell;   // section 0, row 1 is the last name
            case 2: return self.cityCell;   // section 0, row 1 is the last name
            case 3: return self.stateCell;   // section 0, row 1 is the last name
            case 4: return self.zipCell;   // section 0, row 1 is the last name
            case 5: return self.phoneCell;   // section 0, row 1 is the last name
        }
        case 1:
            switch(indexPath.row)
        {
                
            case 0: return self.webCell;  // section 0, row 0 is the first name
        }
        case 2:
            switch(indexPath.row)
        {
                
            case 0: return self.noteCell;  // section 0, row 0 is the first name
        }
            
            
    }
    return nil;
}
/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 UITableViewCell *cell =
 [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
 forIndexPath:indexPath];
 
 self.nameCell = [[UITableViewCell alloc] init];
 self.nameCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
 
 
 self.cityCell = [[UITableViewCell alloc] init];
 self.cityCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
 
 NSDictionary *course = self.courses[indexPath.row];
 self.nameCell.textLabel.text = @"Katie";
 [self.nameCell addSubview:self.cityText];
 self.cityCell.textLabel.text = course[@"city"];
 [self.cityCell addSubview:self.cityText];
 
 return cell;
 }*/

// Customize the section headings for each section
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch(section)
    {
        case 0: return @"Contact Info";
        case 1: return @"Web Site";
        case 2: return @"Notes";
    }
    return nil;
}

/*
 // Configure the row selection code for any cells that you want to customize the row selection
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Handle social cell selection to toggle checkmark
 if(indexPath.section == 1 && indexPath.row == 0) {
 
 // deselect row
 [tableView deselectRowAtIndexPath:indexPath animated:false];
 
 
 }
 }*/





- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}




/*
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
 {
 return [self.courses count];
 }*/










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