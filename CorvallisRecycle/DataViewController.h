//
//  DataViewController.h
//  CorvallisRecycle
//
//  Created by Dave Beltramini on 5/12/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "ViewController.h"
#import "ItemViewController.h"
#import "RecycleViewController.h"
#import "BusinessViewController.h"

@class RecycleViewController;
@class ItemViewController;
@class BusinessViewController;
@class BusinessInfoViewController;
@class DataViewController;
@class ViewController;
@class MapViewController;
@interface DataViewController : UIViewController
@property (nonatomic, strong) NSURL                 *URL;
@property (nonatomic,retain) DataViewController  *dataViewController;
@property (nonatomic,retain) BusinessViewController *businessViewController;
@property (nonatomic, retain) MapViewController *mapViewController;
@end
