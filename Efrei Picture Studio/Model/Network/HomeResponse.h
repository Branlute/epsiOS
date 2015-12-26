//
//  HomeResponse.h
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 23/12/2015.
//  Copyright © 2015 Thomas Lanquetin. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol EPSAlbum;

@interface HomeResponse : JSONModel

@property(nonatomic, strong) NSArray<EPSAlbum>* albums;

@end
