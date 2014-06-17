//
//  loginViewController.m
//  homeWork3
//
//  Created by Kaili An on 6/13/14.
//  Copyright (c) 2014 Kelly An. All rights reserved.
//

#import "loginViewController.h"
#import "feedViewController.h"
#define kbOFFSET_FOR_KEYBOARD 80.0;

@import Security;

@interface loginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameInput;
@property (weak, nonatomic) IBOutlet UITextField *passwordInput;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;
@property (nonatomic,assign) BOOL loading;
- (IBAction)usernameEditing:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

- (IBAction)passwordEditing:(id)sender;

- (IBAction)loginAction:(id)sender;
- (void) checkResponse;

- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;


@end

@implementation loginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.loading = NO;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIActivityIndicatorView *loadingView =[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    loadingView.center = self.view.center;
    
    
    
    [self.view addSubview:loadingView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)usernameEditing:(id)sender {
    if([self.nameInput.text isEqualToString: @""])
    {
        self.loginButton.enabled = NO;
            }
    else{
        
        self.loginButton.enabled = YES;
    }
}

- (IBAction)passwordEditing:(id)sender {
    if([self.nameInput.text isEqualToString: @""])
    {
        self.loginButton.enabled = NO;
       
    }
    else{
        self.loginButton.enabled = YES;
    }


}

- (IBAction)loginAction:(id)sender {
//    if(self.loading){
//        [self.loadingView stopAnimating];
//        self.loading = NO;
//    }else{
//        [self.loadingView startAnimating];
//        self.loading = YES;
    
    [self.loadingView startAnimating];
    [self performSelector:@selector(checkResponse) withObject:nil afterDelay:2];
       }

- (void) checkResponse{
    [self.loadingView stopAnimating];
    if([[self.nameInput.text lowercaseString] isEqualToString:@"kelly"] && [self.passwordInput.text isEqualToString:@"password"])
    {
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Yess..." message:@"Password and username matched" delegate:self cancelButtonTitle:@"Next Screen" otherButtonTitles:nil];
//        [alertView show];
        
        UIViewController *vc = [[feedViewController alloc]init];
        vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        [self presentViewController:vc animated:YES completion:nil];
        
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry, Incorrect Password" message:@"Password and username is not match" delegate:self cancelButtonTitle:@"Re-enter" otherButtonTitles:nil];
        [alertView show];
        
    }

}
- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.view.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
                     }
                     completion:nil];
}

- (void)willHideKeyboard:(NSNotification *)notification{
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.view.frame = CGRectMake(0, self.view.frame.size.height + kbSize.height + self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
                     }
                     completion:nil];     }
@end
