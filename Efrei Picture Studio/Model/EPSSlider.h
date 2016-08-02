//
//  EPSSlider.h
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 29/07/2016.
//  Copyright © 2016 Thomas Lanquetin. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol EPSUser;
@class EPSAlbum, EPSUser;

@interface EPSSlider : JSONModel

@property(nonatomic, strong) NSNumber* idSlider;
@property(nonatomic, strong) EPSAlbum* album;
@property(nonatomic, strong) EPSUser* user;
@property(nonatomic, strong) NSString* photo;
@property(nonatomic, assign) BOOL actif;


- (NSString *) urlPhoto;

@end
