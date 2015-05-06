//
//  BNRQuizViewControler.m
//  CorvallisRecycle
//
//  Created by Dave Beltramini on 5/6/15.
//  Copyright (c) 2015 Katie Beltramini. All rights reserved.
//



#define K_CELL_ID @"cellid"
#import "BNRQuizViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface BNRQuizViewController ()
//@interface BNRQuizViewController ()< UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UILabel *recycleTitle;
@property (nonatomic, weak) IBOutlet UITextView *recycleText;
@property (nonatomic, weak) IBOutlet UIImage *recycleImage;
@property (nonatomic, weak) IBOutlet UILabel *recycleCorvallis;


//@property (nonatomic) UIView *blockView;
@property (nonatomic) NSArray *dataArray;
//@property (nonatomic) UITableView *tableView;

@end


@implementation BNRQuizViewController

/*
 
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 // Initialization code
 self.navigationItem.title = @"Categories";
 _dataArray = @[@"cindy", @"aaron", @"owen", @"ethan"];
 
 }
 return self;
 }
 
 
 
 
 - (void) loadView {
 //TODO:
 [super loadView];
 self.view.backgroundColor = [UIColor greenColor];
 }
 
 - (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view.
 //    UIView *blockView = [UIView new];
 //    blockView.backgroundColor = [UIColor redColor];
 //    self.blockView = blockView;
 //    [self.view addSubview:self.blockView];
 
 
 UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
 tableView.clipsToBounds = YES;
 tableView.scrollsToTop = YES;
 tableView.delegate = self;
 tableView.dataSource = self;
 tableView.scrollEnabled = YES;
 tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
 tableView.contentInset = UIEdgeInsetsMake(15.0f, 0.0f, 15.0f, 0.0f);
 tableView.allowsSelection = YES;
 tableView.showsVerticalScrollIndicator = YES;
 tableView.separatorInset = UIEdgeInsetsMake(0.0f, 50.0f, 0.0f, 0.0f);
 self.tableView = tableView;
 [self.view addSubview:self.tableView];
 
 //self.view.backgroundColor = [UIColor purpleColor];
 
 [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:K_CELL_ID];
 }
 
 - (void) viewWillLayoutSubviews
 {
 //TODO: tell view elements where to be on screen
 //  self.blockView.frame = CGRectMake(20, 10, 40, 20);
 
 self.tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
 }
 
 
 
 
 
 #pragma mark - UITableViewDataSource Methods
 -(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
 {
 return 1;
 }
 
 -(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 return self.dataArray.count;
 }
 
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 NSString *name = self.dataArray[indexPath.row];
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:K_CELL_ID forIndexPath:indexPath];
 
 cell.textLabel.text = name;
 return cell;
 }
 
 
 
 
 */

- (IBAction)itemsRecycle:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://site.republicservices.com/site/corvallis-or/en/documents/corvallisrecycledepot.pdf"]];
}

- (IBAction)curbsideRecycle:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://site.republicservices.com/site/corvallis-or/en/documents/detailedrecyclingguide.pdf"]];
}



@end
