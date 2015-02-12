//
//  TipPercentagesHolder.h
//  TipCalculator
//
//  Created by Rahul Phadnis on 2/8/15.
//  Copyright (c) 2015 Rahul Phadnis. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * TipPercentagesHolder is singleton that provides the 
 * tip percentages for standard and generous modes.
 * This can be further enhanced to support more modes.
 */
@interface TipPercentagesHolder : NSObject

/**
 * Get the singleton instance of TipPercentagesHolder
 */
+(instancetype) singletonInstance;

/**
 * Get generous mode percentages
 */
-(NSArray*) generousPercentages;

/**
 * Get regular mode percentages
 */
-(NSArray*) regularPercentages;

@end
