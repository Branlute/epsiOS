//
//  ApiService.m
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 23/12/2015.
//  Copyright © 2015 Thomas Lanquetin. All rights reserved.
//

#import "ApiService.h"

#import "RestClient.h"

#import "HomeResponse.h"
#import "SliderResponse.h"

#define PATH_WS_HOME @"webservice/home"
#define PATH_WS_SLIDER @"webservice/slider"

static ApiService * _sharedApiService;

@interface ApiService ()

@property(nonatomic, strong) RestClient* restClient;


@end

@implementation ApiService

#pragma mark - Singleton


- (id) initApiService {
    self = [super init];
    if (self) {
        _restClient = [[RestClient alloc] initWithBaseURL:BASE_URL];
    }
    return self;
}

+ (ApiService *)sharedApiService {
    @synchronized(self) {
        if(_sharedApiService == nil) {
            _sharedApiService = [[ApiService alloc] initApiService];

        }
    }
    return _sharedApiService;
}



#pragma mark - WebService Call

- (void) getHomeWithSuccess:(void (^)(HomeResponse *))successBlock andFailure:(void (^)(NSError *))failureBlock {
    [self.restClient dictionaryForURL:PATH_WS_HOME withSuccess:^(NSDictionary *responseObject) {
        NSError * error;
        HomeResponse * homeResponse = [[HomeResponse alloc] initWithDictionary:responseObject error:&error];
        if (error) {
            if (failureBlock) {
                failureBlock(error);
            }
            return;
        }
        if (successBlock) {
            successBlock(homeResponse);
        }
        
    } andFailure:^(NSError *error) {
        if (failureBlock) {
            failureBlock(error);
        }
    }];
}



- (void) getSliderWithSuccess:(void (^)(SliderResponse *))successBlock andFailure:(void (^)(NSError *))failureBlock {
    [self.restClient dictionaryForURL:PATH_WS_SLIDER withSuccess:^(NSDictionary *responseObject) {
        NSError * error;
        SliderResponse * sliderResponse = [[SliderResponse alloc] initWithDictionary:responseObject error:&error];
        if (error) {
            if (failureBlock) {
                failureBlock(error);
            }
            return;
        }
        if (successBlock) {
            successBlock(sliderResponse);
        }
        
    } andFailure:^(NSError *error) {
        if (failureBlock) {
            failureBlock(error);
        }
    }];
}

@end
