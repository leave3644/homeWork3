//
//  profileViewController.m
//  homeWork3
//
//  Created by Kaili An on 6/17/14.
//  Copyright (c) 2014 Kelly An. All rights reserved.
//

#import "profileViewController.h"
#import "loginViewController.h"

@interface profileViewController ()
- (IBAction)logoutButton:(id)sender;

@end

@implementation profileViewController

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

- (IBAction)logoutButton:(id)sender {
    UIViewController *vc = [[loginViewController alloc]init];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:vc animated:YES completion:nil];
}
@end
