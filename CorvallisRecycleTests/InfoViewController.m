//
//  BNRQuizViewControler.m
//  CorvallisRecycle
//
//  Created by Dave Beltramini on 5/6/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
//



#define K_CELL_ID @"cellid"
#import "InfoViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface UIViewController ()
@property (nonatomic, weak) IBOutlet UILabel *recycleTitle;
@property (nonatomic, weak) IBOutlet UITextView *recycleText;
@property (nonatomic, weak) IBOutlet UIImage *recycleImage;
@property (nonatomic, weak) IBOutlet UILabel *recycleCorvallis;


//@property (nonatomic) UIView *blockView;
@property (nonatomic) NSArray *dataArray;
//@property (nonatomic) UITableView *tableView;

@end


@implementation BNRQuizViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Initialization code
        self.navigationItem.title = @"Corvallis Reuse and Repair Directory";

        
    }
    return self;
}

- (IBAction)itemsRecycle:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://site.republicservices.com/site/corvallis-or/en/documents/corvallisrecycledepot.pdf"]];
}

- (IBAction)curbsideRecycle:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://site.republicservices.com/site/corvallis-or/en/documents/detailedrecyclingguide.pdf"]];
}



@end
