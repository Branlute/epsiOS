//
//  ViewController.m
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 11/12/2015.
//  Copyright © 2015 Thomas Lanquetin. All rights reserved.
//

#import "EPSViewController.h"

#import "ApiService.h"
#import "HomeResponse.h"

@interface EPSViewController ()

@end

@implementation EPSViewController


#pragma mark - Init

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [APISERVICE getHomeWithSuccess:^(HomeResponse *homeResponse) {
        NSLog(@"%@", [homeResponse description]);
    } andFailure:^(NSError *error) {
        NSLog(@"%@", [error description]);
        
    }];
}


#pragma mark - Memory Manager

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
