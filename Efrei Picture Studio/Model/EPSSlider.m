//
//  EPSSlider.m
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 29/07/2016.
//  Copyright © 2016 Thomas Lanquetin. All rights reserved.
//

#import "EPSSlider.h"

//Network
#import "ApiService.h"

#define DIRECTORY_SLIDER_PHOTO @"img/slider"

@implementation EPSSlider

#pragma mark - KeyMapper

+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"idSlider",
                                                       }];
}

#pragma mark - Utils

- (NSString *) urlPhoto {
    NSString * urlString = [NSString stringWithFormat:@"%@%@/%@", BASE_URL, DIRECTORY_SLIDER_PHOTO, self.photo];
    return [urlString stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
}
@end
