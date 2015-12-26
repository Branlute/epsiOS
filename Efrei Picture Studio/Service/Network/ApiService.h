//
//  ApiService.h
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 23/12/2015.
//  Copyright © 2015 Thomas Lanquetin. All rights reserved.
//

#import <Foundation/Foundation.h>


#define APISERVICE [ApiService sharedApiService]

#if __DEBUG__
//#define BASE_URL @"http://localhost/app_dev.php/"
//#define BASE_URL @"http://localhost/EPSV2/www/app_dev.php/"
#define BASE_URL @"http://eps.assos.efrei.fr/"
#else /// Prod
#define BASE_URL @"http://eps.assos.efrei.fr/"
#endif

@class HomeResponse;

@interface ApiService : NSObject

#pragma mark - Singleton
-(instancetype) init __attribute__((unavailable("init not available, use sharedApiService")));

/*!
 * @brief Permet de récupérer le singleton de la classe ApiService
 * @return Le singleton de la classe
 */
+ (ApiService*)sharedApiService;

#pragma mark - WebService Call

- (void) getHomeWithSuccess:(void (^)(HomeResponse *homeResponse))successBlock andFailure:(void (^)(NSError *error))failureBlock;
@end
