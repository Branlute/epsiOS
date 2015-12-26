//
//  RestClient.m
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 26/12/2015.
//  Copyright © 2015 Thomas Lanquetin. All rights reserved.
//

#import "RestClient.h"

#import "AFNetworking.h"

@interface RestClient()

@property(nonatomic, strong) AFHTTPSessionManager* sessionManager;

@end

@implementation RestClient



#pragma mark - Init

- (id) initWithBaseURL:(NSString *) baseUrl {
    self = [super init];
    if (self) {
        //        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://eps.assos.efrei.fr/webservice/"]];
//        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://localhost/app_dev.php/webservice/"]];
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
        
    }
    return self;
}


- (void) dictionaryForURL:(NSString *) url withSuccess:(void (^)(NSDictionary * _Nullable))successBlock andFailure:(void (^)(NSError * _Nonnull))failureBlock {
    NSDictionary * parameters = @{@"Accept":@"application/json"};
    [self.sessionManager GET:url parameters:parameters
                    progress:nil
                     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                         NSLog(@"Webservice %@ Success", url);
                         if (![responseObject isKindOfClass:[NSDictionary class]]) {
                             if (failureBlock) {
                                 ///TODO propre
                                 failureBlock([NSError errorWithDomain:@"RestClient" code:-1 userInfo:nil]);
                             }
                         }
                         else if (successBlock) {
                             successBlock(responseObject);
                         }
                     }
                     failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                         NSLog(@"Webservice %@ Error", url);
                         if (failureBlock) {
                             failureBlock(error);
                         }
                     }];
    
//    AFHTTPRequestOperation *op = [self HTTPRequestOperationWithRequest:request
//                                                               success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                                                                   NSString *response = [operation responseString];
//                                                                   if([self executeRequestWithId:requestId]) {
//                                                                       if(self.logServerResponses)
//                                                                           [self logResponse:responseObject forRequest:request error:nil];
//                                                                       completionBlock(response, nil);
//                                                                   }
//                                                               } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                                                                   if([self executeRequestWithId:requestId]) {
//                                                                       NSMutableDictionary *userInfo = [error.userInfo mutableCopy];
//                                                                       if(operation.responseObject) {
//                                                                           // Add in the (parsed) response body.
//                                                                           userInfo[SWGResponseObjectErrorKey] = operation.responseObject;
//                                                                       }
//                                                                       FDJWebServiceError *augmentedError = [[FDJWebServiceError alloc] initWithDomain:error.domain code:error.code userInfo:userInfo];
//                                                                       [augmentedError setRetryBlock:^{
//                                                                           [self stringWithCompletionBlock:path method:method queryParams:queryParams body:body headerParams:headerParams requestContentType:requestContentType responseContentType:responseContentType completionBlock:completionBlock];
//                                                                       }];
//                                                                       
//                                                                       if(self.logServerResponses)
//                                                                           [self logResponse:nil forRequest:request error:augmentedError];
//                                                                       completionBlock(nil, augmentedError);
//                                                                   }
//                                                               }];
    
//    [self.operationQueue addOperation:op];
}
@end
