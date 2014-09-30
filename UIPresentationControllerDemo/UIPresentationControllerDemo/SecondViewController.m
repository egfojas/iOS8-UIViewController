//
//  PresentedViewController.m
//  UIPresentationControllerDemo
//
//  Created by Edgar Allan Fojas on 9/30/14.
//  Copyright (c) 2014 Edgar Allan Fojas. All rights reserved.
//

#import "SecondViewController.h"

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
