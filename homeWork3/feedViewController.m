//
//  feedViewController.m
//  homeWork3
//
//  Created by Kaili An on 6/16/14.
//  Copyright (c) 2014 Kelly An. All rights reserved.
//

#import "feedViewController.h"


@interface feedViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *loadingFeed;
@property (weak, nonatomic) IBOutlet UIImageView *scrollImage;

- (void) displayFeed;

@end

@implementation feedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.loadingFeed startAnimating];
        [self performSelector:@selector(displayFeed) withObject:nil afterDelay:2];
        
    }
    return self;
}

- (void) displayFeed {
    [self.loadingFeed stopAnimating];
    
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

@end
