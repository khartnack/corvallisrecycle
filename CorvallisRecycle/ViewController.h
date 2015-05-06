//
//  ViewController.h
//  TableMain
//
//  Created by Dave Beltramini on 4/29/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
// testtest

#import <UIKit/UIKit.h>

@class ItemViewController;
@class BNRQuizViewController;
@class RecycleViewController;
@class BusinessViewController;
@class BusinessInfoViewController;
@interface ViewController : UITableViewController //{BNRQuizViewController *BNRQuizViewController;}



@property (nonatomic, strong) ItemViewController *itemViewController;
@property(nonatomic,retain) BNRQuizViewController *BNRQuizViewController;
@property(nonatomic,retain) RecycleViewController  *recycleViewController;
@property(nonatomic,retain) BusinessViewController  *businessViewController;
@property(nonatomic,retain) BusinessInfoViewController  *businessInfoViewController;
@property(nonatomic, strong) NSURL *URL;
@end

