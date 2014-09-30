//
//  ViewController.m
//  UINavigationControllerDemo
//
//  Created by Edgar Allan Fojas on 9/30/14.
//  Copyright (c) 2014 Edgar Allan Fojas. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) UIToolbar *toolbar;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"Demo"];
}

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44)];
    UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithTitle:@"Send" style:UIBarButtonItemStyleDone target:self action:nil];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *button2=[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:nil];
    [self.toolbar setItems:[[NSArray alloc] initWithObjects:button1,spacer,button2,nil]];
    
    UILabel *hidesBarsOnTapLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    hidesBarsOnTapLabel.font = [UIFont fontWithName:@"Helvetica" size:14.0f];
    hidesBarsOnTapLabel.translatesAutoresizingMaskIntoConstraints = NO;
    hidesBarsOnTapLabel.text = @"HidesBarsOnTap";
    
    UILabel *hidesBarsWhenVerticallyCompactLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    hidesBarsWhenVerticallyCompactLabel.font = [UIFont fontWithName:@"Helvetica" size:14.0f];
    hidesBarsWhenVerticallyCompactLabel.translatesAutoresizingMaskIntoConstraints = NO;
    hidesBarsWhenVerticallyCompactLabel.text = @"HidesBarsWhenVerticallyCompact";
    
    UILabel *hidesBarsOnSwipeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    hidesBarsOnSwipeLabel.font = [UIFont fontWithName:@"Helvetica" size:14.0f];
    hidesBarsOnSwipeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    hidesBarsOnSwipeLabel.text = @"HidesBarsOnSwipe";
    
    UILabel *hidesBarsWhenKeyboardAppearsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    hidesBarsWhenKeyboardAppearsLabel.font = [UIFont fontWithName:@"Helvetica" size:14.0f];
    hidesBarsWhenKeyboardAppearsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    hidesBarsWhenKeyboardAppearsLabel.text = @"HidesBarsWhenKeyboardAppears";
    
    UISwitch *hidesBarsOnTapSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    hidesBarsOnTapSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    [hidesBarsOnTapSwitch addTarget:self action:@selector(changehidesBarsOnTapSwitch:) forControlEvents:UIControlEventValueChanged];

    UISwitch *hidesBarsWhenVerticallyCompactSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    hidesBarsWhenVerticallyCompactSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    [hidesBarsWhenVerticallyCompactSwitch addTarget:self action:@selector(changehidesBarsWhenVerticallyCompactSwitch:) forControlEvents:UIControlEventValueChanged];
    
    UISwitch *hidesBarsOnSwipeSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    hidesBarsOnSwipeSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    [hidesBarsOnSwipeSwitch addTarget:self action:@selector(changehidesBarsOnSwipeSwitch:) forControlEvents:UIControlEventValueChanged];
    
    UISwitch *hidesBarsWhenKeyboardAppearsSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    hidesBarsWhenKeyboardAppearsSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    [hidesBarsWhenKeyboardAppearsSwitch addTarget:self action:@selector(changehidesBarsWhenKeyboardAppearsSwitch:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:hidesBarsOnTapLabel];
    [self.view addSubview:hidesBarsWhenVerticallyCompactLabel];
    [self.view addSubview:hidesBarsWhenKeyboardAppearsLabel];
    [self.view addSubview:hidesBarsOnSwipeLabel];
    
    [self.view addSubview:hidesBarsOnTapSwitch];
    [self.view addSubview:hidesBarsWhenVerticallyCompactSwitch];
    [self.view addSubview:hidesBarsWhenKeyboardAppearsSwitch];
    [self.view addSubview:hidesBarsOnSwipeSwitch];
    
    NSArray *labelVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[hidesBarsOnTapLabel(30)]-10-[hidesBarsWhenVerticallyCompactLabel(30)]-10-[hidesBarsOnSwipeLabel(30)]-10-[hidesBarsWhenKeyboardAppearsLabel(30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(hidesBarsOnTapLabel, hidesBarsWhenVerticallyCompactLabel, hidesBarsOnSwipeLabel, hidesBarsWhenKeyboardAppearsLabel)];
    
    NSArray *switchVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[hidesBarsOnTapSwitch(30)]-10-[hidesBarsWhenVerticallyCompactSwitch(30)]-10-[hidesBarsOnSwipeSwitch(30)]-10-[hidesBarsWhenKeyboardAppearsSwitch(30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(hidesBarsOnTapSwitch, hidesBarsWhenVerticallyCompactSwitch, hidesBarsOnSwipeSwitch, hidesBarsWhenKeyboardAppearsSwitch)];
    
    NSArray *label1HorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[hidesBarsOnTapLabel(250)][hidesBarsOnTapSwitch(30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(hidesBarsOnTapLabel, hidesBarsOnTapSwitch)];
    NSArray *label2HorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[hidesBarsWhenVerticallyCompactLabel(250)][hidesBarsWhenVerticallyCompactSwitch(30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(hidesBarsWhenVerticallyCompactLabel, hidesBarsWhenVerticallyCompactSwitch)];
    NSArray *label3HorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[hidesBarsOnSwipeLabel(250)][hidesBarsOnSwipeSwitch(30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(hidesBarsOnSwipeLabel, hidesBarsOnSwipeSwitch)];
    NSArray *label4HorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[hidesBarsWhenKeyboardAppearsLabel(250)][hidesBarsWhenKeyboardAppearsSwitch(30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(hidesBarsWhenKeyboardAppearsLabel, hidesBarsWhenKeyboardAppearsSwitch)];
    
    [self.view addSubview:self.toolbar];
    [self.view addSubview:hidesBarsOnTapLabel];
    [self.view addSubview:hidesBarsWhenVerticallyCompactLabel];
    [self.view addSubview:hidesBarsOnSwipeLabel];
    [self.view addSubview:hidesBarsWhenKeyboardAppearsLabel];
    
    [self.view addConstraints:switchVerticalConstraints];
    [self.view addConstraints:labelVerticalConstraints];
    [self.view addConstraints:label1HorizontalConstraints];
    [self.view addConstraints:label2HorizontalConstraints];
    [self.view addConstraints:label3HorizontalConstraints];
    [self.view addConstraints:label4HorizontalConstraints];
}

- (void)changehidesBarsWhenKeyboardAppearsSwitch:(id)sender{
    if([sender isOn]){
        self.navigationController.hidesBarsWhenKeyboardAppears = YES;
    } else{
        self.navigationController.hidesBarsWhenKeyboardAppears = NO;
    }
}

- (void)changehidesBarsOnSwipeSwitch:(id)sender{
    if([sender isOn]){
        self.navigationController.hidesBarsOnSwipe = YES;
    } else{
        self.navigationController.hidesBarsOnSwipe = NO;
    }
}

- (void)changehidesBarsWhenVerticallyCompactSwitch:(id)sender{
    if([sender isOn]){
        self.navigationController.hidesBarsWhenVerticallyCompact = YES;
    } else{
        self.navigationController.hidesBarsWhenVerticallyCompact = NO;
    }
}

- (void)changehidesBarsOnTapSwitch:(id)sender{
    if([sender isOn]){
        self.navigationController.hidesBarsOnTap = YES;
    } else{
        self.navigationController.hidesBarsOnTap = NO;
    }
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    self.toolbar.frame = CGRectMake(0, size.height - 44, size.width, 44);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
