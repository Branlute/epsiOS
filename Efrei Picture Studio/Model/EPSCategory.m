//
//  Category.m
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 26/12/2015.
//  Copyright © 2015 Thomas Lanquetin. All rights reserved.
//

#import "EPSCategory.h"

@implementation EPSCategory



#pragma mark - KeyMapper

+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"idCategory"
                                                       }];
}

@end
