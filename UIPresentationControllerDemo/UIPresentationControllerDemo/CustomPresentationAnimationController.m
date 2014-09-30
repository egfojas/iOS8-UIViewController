//
//  CustomPresentationAnimationController.m
//  UIPresentationControllerDemo
//
//  Created by Edgar Allan Fojas on 9/30/14.
//  Copyright (c) 2014 Edgar Allan Fojas. All rights reserved.
//

#import "CustomPresentationAnimationController.h"

@interface CustomPresentationAnimationController()

@property (nonatomic, assign) BOOL isPresenting;
@property (nonatomic, assign) NSTimeInterval duration;
@end

@implementation CustomPresentationAnimationController

- (instancetype)initWithIsPresenting:(BOOL)isPresenting
{
    self = [super init];
    if (self) {
        self.isPresenting = isPresenting;
        self.duration = 0.5;
    }
    return self;
}


- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    if (self.isPresenting) {
        [self animatePresentationWithTransitionContext:transitionContext];
    }
    else {
        [self animateDismissalWithTransitionContext:transitionContext];
    }
}

- (void)animatePresentationWithTransitionContext:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *presentedController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *presentedControllerView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    
    CGRect frame = [transitionContext finalFrameForViewController:presentedController];
    presentedControllerView.frame = frame;
    presentedControllerView.center = CGPointMake(presentedControllerView.center.x, presentedControllerView.center.y - containerView.bounds.size.height);
    [containerView addSubview:presentedControllerView];
    
    [UIView animateWithDuration:self.duration delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        presentedControllerView.center = CGPointMake(presentedControllerView.center.x, presentedControllerView.center.y + containerView.bounds.size.height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

- (void)animateDismissalWithTransitionContext:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *presentedControllerView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *containerView = [transitionContext containerView];

    [UIView animateWithDuration:self.duration delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        presentedControllerView.center = CGPointMake(presentedControllerView.center.x, presentedControllerView.center.y + containerView.bounds.size.height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

@end
