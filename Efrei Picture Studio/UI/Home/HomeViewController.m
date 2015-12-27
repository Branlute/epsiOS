//
//  HomeViewController.m
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 23/12/2015.
//  Copyright © 2015 Thomas Lanquetin. All rights reserved.
//

#import "HomeViewController.h"

//Webservice
#import "ApiService.h"
#import "HomeResponse.h"

@interface HomeViewController()

@property(nonatomic, strong) HomeResponse* homeResponse;

@end

@implementation HomeViewController




#pragma mark - Init

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [APISERVICE getHomeWithSuccess:^(HomeResponse *homeResponse) {
//        NSLog(@"%@", [homeResponse description]);
        self.homeResponse = homeResponse;
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
