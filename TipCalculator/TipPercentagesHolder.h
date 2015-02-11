//
//  TipPercentagesHolder.h
//  TipCalculator
//
//  Created by Rahul Phadnis on 2/8/15.
//  Copyright (c) 2015 Rahul Phadnis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TipPercentagesHolder : NSObject
+(instancetype) singletonInstance;

-(NSArray*) generousPercentages;

-(NSArray*) regularPercentages;

@end
