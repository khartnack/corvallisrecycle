//
//  AppDelegate.m
//  CorvallisRecycle
//
//  Created by Dave Beltramini on 5/6/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
//
//  AppDelegate.m
//  TableMain
//
//  Created by Dave Beltramini on 4/29/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.

#import "AppDelegate.h"
#import "ViewController.h"
#import "ItemViewController.h"
#import "InfoViewController.h"
#import "RecycleViewController.h"
#import "BusinessViewController.h"
#import "BusinessInfoViewController.h"
#import "DataViewController.h"



#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//from:http://www.appcoda.com/customize-navigation-status-bar-ios-7/



@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController *cvc = [[ViewController alloc] init];

    
    //need to alloc a controller for each view here
    ItemViewController *wvc = [[ItemViewController alloc] init];
    cvc.itemViewController = wvc;
    
    InfoViewController *bnr = [[InfoViewController alloc] init];
    cvc.infoViewController = bnr;
    
    RecycleViewController *rvc = [[RecycleViewController alloc] init];
    wvc.recycleViewController = rvc;
    
    BusinessViewController *bvc = [[BusinessViewController alloc] init];
    rvc.businessViewController = bvc;
    
    BusinessInfoViewController *bivc = [[BusinessInfoViewController alloc] initWithStyle:UITableViewStyleGrouped];
    bvc.businessInfoViewController = bivc;
    
   // DataViewController *dvc = [[DataViewController alloc] init];
   // bvc.dataViewController = dvc;
    
    UINavigationController *masterNav = [[UINavigationController alloc] initWithRootViewController:cvc];
    
    //create the look for nav bar across views
    //[[UINavigationBar appearance] setBarTintColor:[UIColor greenColor]];
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x66CCFF)];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];

    
    self.window.rootViewController = masterNav;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end