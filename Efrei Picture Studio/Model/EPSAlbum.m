//
//  Album.m
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 23/12/2015.
//  Copyright © 2015 Thomas Lanquetin. All rights reserved.
//

#import "EPSAlbum.h"

//Network
#import "ApiService.h"

#define DIRECTORY_THUMB @"miniatures"

@implementation EPSAlbum



#pragma mark - KeyMapper

+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"idAlbum",
                                                       @"visit_count": @"visitCount",
                                                       @"like_count": @"likeCount"
                                                       }];
}


- (NSString *) urlThumb {
    NSString * urlString = [NSString stringWithFormat:@"%@/%@/%@/%@", BASE_URL, DIRECTORY_THUMB, self.idAlbum, self.thumb];
    return [urlString stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
}

@end
