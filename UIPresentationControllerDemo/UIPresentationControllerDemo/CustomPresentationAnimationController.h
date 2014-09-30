//
//  CustomPresentationAnimationController.h
//  UIPresentationControllerDemo
//
//  Created by Edgar Allan Fojas on 9/30/14.
//  Copyright (c) 2014 Edgar Allan Fojas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CustomPresentationAnimationController : NSObject <UIViewControllerAnimatedTransitioning>
- (instancetype)initWithIsPresenting:(BOOL)isPresenting;
@end
