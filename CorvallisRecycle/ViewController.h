//
//  ViewController.h
//  TableMain
//
//  Created by Dave Beltramini on 4/29/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
// testtest

#import <UIKit/UIKit.h>

@class ItemViewController;
@class InfoViewController;
@class RecycleViewController;
@class BusinessViewController;
@class DataViewController;
@interface ViewController : UITableViewController 
@property (nonatomic, strong) ItemViewController *itemViewController;
@property(nonatomic,retain) InfoViewController *infoViewController;
@property(nonatomic,retain) RecycleViewController  *recycleViewController;
@property(nonatomic,retain) BusinessViewController  *businessViewController;
@property(nonatomic,retain) DataViewController  *dataInfoViewController;
@property(nonatomic, strong) NSURL *URL;
@end

