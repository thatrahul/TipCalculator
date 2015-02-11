//
//  TipPreference.h
//  TipCalculator
//
//  Created by Rahul Phadnis on 2/9/15.
//  Copyright (c) 2015 Rahul Phadnis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TipPreference : NSObject
@property (nonatomic, readonly) BOOL generous;
@property (nonatomic, readonly) NSInteger tipPercentage;
@property (nonatomic, strong, readonly) NSArray* percentages;

-(instancetype) initWithPercentages: (NSArray*) percentages defaulTipPercentage: (NSInteger) defaultTipPercentage;

@end
