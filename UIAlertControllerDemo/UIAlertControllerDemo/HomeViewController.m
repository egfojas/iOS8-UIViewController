//
//  ViewController.m
//  UIAlertControllerDemo
//
//  Created by Edgar Allan Fojas on 9/30/14.
//  Copyright (c) 2014 Edgar Allan Fojas. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *alertStyleButton = [[UIButton alloc] initWithFrame:CGRectMake(35, 100, 300, 30)];
    [alertStyleButton setTitle:@"Alert Style UIAlert" forState:UIControlStateNormal];
    [alertStyleButton addTarget:self action:@selector(didTapAlertStyleButton) forControlEvents:UIControlEventTouchUpInside];
    alertStyleButton.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *actionSheetStyleButton = [[UIButton alloc] initWithFrame:CGRectMake(35, 140, 300, 30)];
    [actionSheetStyleButton setTitle:@"ActionSheet Style UIAlert" forState:UIControlStateNormal];
    [actionSheetStyleButton addTarget:self action:@selector(didTapActionSheetStyleButton) forControlEvents:UIControlEventTouchUpInside];
    actionSheetStyleButton.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *alertWithTextFieldButton = [[UIButton alloc] initWithFrame:CGRectMake(35, 180, 300, 30)];
    [alertWithTextFieldButton setTitle:@"UIAlert with UITextField" forState:UIControlStateNormal];
    [alertWithTextFieldButton addTarget:self action:@selector(didTapAlertWithTextFieldButton) forControlEvents:UIControlEventTouchUpInside];
    alertWithTextFieldButton.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:alertStyleButton];
    [self.view addSubview:actionSheetStyleButton];
    [self.view addSubview:alertWithTextFieldButton];
}

- (void)didTapAlertStyleButton
{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"UIAlert"
                                          message:@"Alert Style"
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel action");
                                   }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   NSLog(@"OK action");
                               }];
    
    UIAlertAction *resetAction = [UIAlertAction
                                  actionWithTitle:NSLocalizedString(@"Reset", @"Reset action")
                                  style:UIAlertActionStyleDestructive
                                  handler:^(UIAlertAction *action)
                                  {
                                      NSLog(@"Reset action");
                                  }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [alertController addAction:resetAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didTapActionSheetStyleButton
{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"UIAlert"
                                          message:@"Alert Style"
                                          preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel action");
                                   }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   NSLog(@"OK action");
                               }];
    
    UIAlertAction *resetAction = [UIAlertAction
                                  actionWithTitle:NSLocalizedString(@"Reset", @"Reset action")
                                  style:UIAlertActionStyleDestructive
                                  handler:^(UIAlertAction *action)
                                  {
                                      NSLog(@"Reset action");
                                  }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [alertController addAction:resetAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didTapAlertWithTextFieldButton
{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"UIAlert"
                                          message:@"Alert Style"
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel action");
                                   }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   UITextField *login = alertController.textFields.firstObject;
                                   UITextField *password = alertController.textFields.lastObject;
                                   NSString *username = login.text;
                                   NSString *passworkd = password.text;
                                   NSLog(@"OK action");
                               }];

    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"LoginPlaceholder", @"Login");
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"PasswordPlaceholder", @"Password");
         textField.secureTextEntry = YES;
     }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
