//
//  ViewController.m
//  UIPresentationControllerDemo
//
//  Created by Edgar Allan Fojas on 9/30/14.
//  Copyright (c) 2014 Edgar Allan Fojas. All rights reserved.
//

#import "HomeViewController.h"
#import "SecondViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) SecondViewController *secondViewController;

@end

@implementation HomeViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _secondViewController = [[SecondViewController alloc] init];
        [_secondViewController setModalPresentationStyle:UIModalPresentationCustom];
        [_secondViewController setTransitioningDelegate:_secondViewController];
    }
    return self;
}

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *presentButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 200, 30)];
    [presentButton setTitle:@"Present 2nd Screen" forState:UIControlStateNormal];
    [presentButton addTarget:self action:@selector(didTapPresentButton:) forControlEvents:UIControlEventTouchUpInside];

//    UIButton *presentModalButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 90, 200, 30)];
//    [presentButton addTarget:self action:@selector(didTapPresentButton:) forControlEvents:UIControlEventTouchUpInside];x`
    
    [self.view addSubview:presentButton];
}

- (void)didTapPresentButton:(id)sender
{
    [self presentViewController:self.secondViewController animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
