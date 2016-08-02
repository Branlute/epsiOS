//
//  SliderResponse.h
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 29/07/2016.
//  Copyright © 2016 Thomas Lanquetin. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol EPSSlider;

@interface SliderResponse : JSONModel

@property(nonatomic, strong) NSArray<EPSSlider>* sliders;

@end
