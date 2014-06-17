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
@property (nonatomic,assign) BOOL loading;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *feedImageView;

- (void) displayFeed;

@end

@implementation feedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.loadingFeed startAnimating];
//        [self performSelector:@selector(displayFeed) withObject:nil afterDelay:2];
//        
    }
    return self;
}

- (void) displayFeed {
    [self.loadingFeed stopAnimating];
    self.scrollView.contentSize = CGSizeMake(self.feedImageView.frame.size.width,self.feedImageView.frame.size.height);
    
}

- (void)viewDidLoad
{
   
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIActivityIndicatorView *loadingView =[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    loadingView.center = self.view.center;
    
    [self.view addSubview:loadingView];
    [self.loadingFeed startAnimating];
    [self performSelector:@selector(displayFeed) withObject:nil afterDelay:2];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
