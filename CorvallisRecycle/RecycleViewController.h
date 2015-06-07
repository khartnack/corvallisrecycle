//
//  RecycleViewController.h
//  TableMain
//
//  Created by Katie Beltramini on 5/3/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
//
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "ViewController.h"
#import "ItemViewController.h"
#import "BusinessViewController.h"

@class RecycleViewController;
@class ItemViewController;
@class BusinessViewController;
@interface RecycleViewController : UITableViewController

@property (nonatomic, strong) NSURL                 *URL;
@property(nonatomic,retain) RecycleViewController  *recycleViewController;
@property(nonatomic,retain) BusinessViewController *businessViewController;

@end
