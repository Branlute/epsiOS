//
//  User.h
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 26/12/2015.
//  Copyright © 2015 Thomas Lanquetin. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface EPSUser : JSONModel

@property(nonatomic, strong) NSNumber* idUser;
@property(nonatomic, strong) NSString* username;
@property(nonatomic, strong) NSString* firstname;
@property(nonatomic, strong) NSString* lastname;
@property(nonatomic, strong) NSString* promo;

@end
