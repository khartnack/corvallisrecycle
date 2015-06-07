//
//  BusinessViewController.h
//  TableMain
//
//  Created by Dave Beltramini on 5/5/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "ViewController.h"
#import "ItemViewController.h"
#import "RecycleViewController.h"


@class RecycleViewController;
@class ItemViewController;
@class BusinessViewController;
@class DataViewController;
@interface BusinessViewController : UITableViewController

@property (nonatomic, strong) NSURL                 *URL;
@property (nonatomic,retain) BusinessViewController  *businessViewController;
@property (nonatomic, retain) BusinessInfoViewController *businessInfoViewController;
@property (nonatomic, retain) DataViewController *dataViewController;
@end
