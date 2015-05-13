//
//  DataViewController.h
//  CorvallisRecycle
//
//  Created by Dave Beltramini on 5/12/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ViewController.h"

@class RecycleViewController;
@class ItemViewController;
@class BusinessViewController;
@class BusinessInfoViewController;
@class DataViewController;
@interface DataViewController : UIViewController
@property (nonatomic, strong) NSURL                 *URL;
@property (nonatomic,retain) DataViewController  *dataViewController;
@end
