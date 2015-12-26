//
//  Album.m
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 23/12/2015.
//  Copyright © 2015 Thomas Lanquetin. All rights reserved.
//

#import "EPSAlbum.h"

@implementation EPSAlbum



#pragma mark - KeyMapper

+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"idAlbum",
                                                       @"visit_count": @"visitCount",
                                                       @"like_count": @"likeCount"
                                                       }];
}

@end
