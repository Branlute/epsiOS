//
//  Album.h
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 23/12/2015.
//  Copyright © 2015 Thomas Lanquetin. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@class EPSCategory;
@protocol EPSUser;

@interface EPSAlbum : JSONModel

@property(nonatomic, strong) NSNumber* idAlbum;
@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSDate* date;
@property(nonatomic, strong) NSString* thumb;
@property(nonatomic, strong) NSString* access;
@property(nonatomic, strong) NSNumber* visitCount;
@property(nonatomic, strong) NSNumber* likeCount;
@property(nonatomic, strong) EPSCategory* category;
@property(nonatomic, strong) NSArray<EPSUser>* reporters;


- (NSString *) urlThumb;

@end
