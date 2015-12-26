//
//  Category.h
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 26/12/2015.
//  Copyright © 2015 Thomas Lanquetin. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface EPSCategory : JSONModel

@property(nonatomic, strong) NSNumber* idCategory;
@property(nonatomic, strong) NSString* title;

@end
