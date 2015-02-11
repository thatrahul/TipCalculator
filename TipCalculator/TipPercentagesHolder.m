//
//  TipPercentagesHolder.m
//  TipCalculator
//
//  Created by Rahul Phadnis on 2/8/15.
//  Copyright (c) 2015 Rahul Phadnis. All rights reserved.
//

#import "TipPercentagesHolder.h"

@interface TipPercentagesHolder()
-(instancetype) initPrivate;
@property (strong, nonatomic) NSArray* regular;
@property (strong, nonatomic) NSArray* generous;
@end

@implementation TipPercentagesHolder

+(instancetype)singletonInstance {
    static TipPercentagesHolder* instance;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^ {
        if (instance == nil) {
            instance = [[TipPercentagesHolder alloc] initPrivate];
        }
    });
    return instance;
}

-(instancetype) initPrivate {
    self = [super init];
    if (self) {
        _regular = @[@10, @15, @20];
        _generous = @[@12, @18, @24];
    }
    return self;
}

-(instancetype) init {
    [NSException raise:@"TipPercentagesHolder is a singleton" format:@"Use singletonInstance method"];
    return nil;
}

-(NSArray *)regularPercentages {
    return self.regular;
}

-(NSArray*) generousPercentages {
    return self.generous;
}

@end
