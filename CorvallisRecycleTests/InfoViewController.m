//
//  InfoViewController.m
//  CorvallisRecycle
//
//  Created by Katie Beltramini on 5/6/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
//

#define K_CELL_ID @"cellid"
#import "InfoViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface InfoViewController ()
@property (nonatomic, weak) IBOutlet UILabel *recycleTitle;
@property (nonatomic, weak) IBOutlet UITextView *recycleText;
@property (nonatomic, weak) IBOutlet UIImage *recycleImage;
@property (nonatomic, weak) IBOutlet UILabel *recycleCorvallis;
@property (nonatomic) NSArray *dataArray;

@end

@implementation InfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Initialization code
        self.navigationItem.title = @"Corvallis Reuse and Repair Directory";

        
    }
    return self;
}

//sends the user to the corvallisrecycledepot in safari
- (IBAction)itemsRecycle:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://site.republicservices.com/site/corvallis-or/en/documents/corvallisrecycledepot.pdf"]];
}
//sends the user to  information on curbside recycling in curbside in safari
- (IBAction)curbsideRecycle:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://site.republicservices.com/site/corvallis-or/en/documents/detailedrecyclingguide.pdf"]];
}



@end
