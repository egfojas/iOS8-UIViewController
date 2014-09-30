//
//  PresentedViewController.m
//  UIPresentationControllerDemo
//
//  Created by Edgar Allan Fojas on 9/30/14.
//  Copyright (c) 2014 Edgar Allan Fojas. All rights reserved.
//

#import "SecondViewController.h"
#import "CustomPresentationController.h"
#import "CustomPresentationAnimationController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 300, 30)];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(didTapBackButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:backButton];
}

- (void)didTapBackButton:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0)
{
    if (presented == self) {
        return [[CustomPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    }
    
    return nil;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    if(presented == self) {
        return [[CustomPresentationAnimationController alloc] initWithIsPresenting:YES];
    }
    return nil;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    if(dismissed == self) {
        return [[CustomPresentationAnimationController alloc] initWithIsPresenting:NO];
    }
    return nil;
}
@end
