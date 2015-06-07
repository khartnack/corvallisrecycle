//
//  ItemViewController.h
//  TableMain
//
//  Created by Dave Beltramini on 4/29/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "AppDelegate.h"



@class RecycleViewController;
@class ItemViewController;
@class BusinessViewController;
@class DataViewController;
@interface ItemViewController : UITableViewController
@property (nonatomic, weak) IBOutlet UILabel *recycleTitle;
@property (nonatomic, weak) IBOutlet UITextView *recycleText;
@property (nonatomic, strong) ItemViewController *itemViewController;
@property(nonatomic,retain) RecycleViewController  *recycleViewController;
@property(nonatomic, retain) BusinessViewController *businessViewController;
@property(nonatomic, retain) DataViewController *dataInfoViewController;
@property (nonatomic, strong) NSURL                 *URL;


@end