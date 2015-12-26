//
//  RestClient.h
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 26/12/2015.
//  Copyright © 2015 Thomas Lanquetin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestClient : NSObject

#pragma mark - Init

- (id) initWithBaseURL:(NSString *) baseUrl;


#pragma mark - Get

- (void) dictionaryForURL:(NSString *) url withSuccess:(void (^)(NSDictionary *responseObject))successBlock andFailure:(void (^)(NSError *error))failureBlock;

@end
