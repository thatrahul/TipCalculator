//
//  TipPreference.m
//  TipCalculator
//
//  Created by Rahul Phadnis on 2/9/15.
//  Copyright (c) 2015 Rahul Phadnis. All rights reserved.
//

#import "TipPreference.h"

@implementation TipPreference

-(instancetype) initWithPercentages:(NSArray *)percentages defaulTipPercentage:(NSInteger)defaultTipPercentage {
    self = [super init];
    if (self) {
        _tipPercentage = defaultTipPercentage;
        _percentages = percentages;
    }
    return self;
    
}

@end
