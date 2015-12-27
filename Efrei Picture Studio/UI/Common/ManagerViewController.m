//
//  ManagerViewController.m
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 27/12/2015.
//  Copyright © 2015 Thomas Lanquetin. All rights reserved.
//

#import "ManagerViewController.h"

#import "MEDynamicTransition.h"
#import "UIViewController+ECSlidingViewController.h"

@interface ManagerViewController ()
@property (nonatomic, strong) MEDynamicTransition * dynamicTransition;
@property (nonatomic, strong) UIPanGestureRecognizer *dynamicTransitionPanGesture;
@end

@implementation ManagerViewController

#pragma mark - Init

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dynamicTransition = [[MEDynamicTransition alloc] init];
    self.dynamicTransition.slidingViewController = self;
    self.delegate = self.dynamicTransition;
    self.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGestureCustom;
    self.customAnchoredGestures = @[self.dynamicTransitionPanGesture];
    [self.topViewController.view addGestureRecognizer:self.dynamicTransitionPanGesture];
}



- (UIPanGestureRecognizer *)dynamicTransitionPanGesture {
    if (_dynamicTransitionPanGesture) return _dynamicTransitionPanGesture;
    
    _dynamicTransitionPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.dynamicTransition action:@selector(handlePanGesture:)];
    
    return _dynamicTransitionPanGesture;
}

#pragma mark - Memory Manager

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
