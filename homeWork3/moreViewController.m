//
//  moreViewController.m
//  homeWork3
//
//  Created by Kaili An on 6/17/14.
//  Copyright (c) 2014 Kelly An. All rights reserved.
//

#import "moreViewController.h"
#import "profileViewController.h"

@interface moreViewController ()
- (IBAction)profileButton:(id)sender;

@end

@implementation moreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)profileButton:(id)sender {
    UIViewController *vc = [[profileViewController alloc]init];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:vc animated:YES completion:nil];
}
@end
