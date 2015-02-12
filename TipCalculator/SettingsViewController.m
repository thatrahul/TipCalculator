//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Rahul Phadnis on 2/7/15.
//  Copyright (c) 2015 Rahul Phadnis. All rights reserved.
//

#import "SettingsViewController.h"
#import "TipPercentagesHolder.h"


@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *settingPercentageSegmentedControl;
@property (weak, nonatomic) IBOutlet UISwitch *generousModeSwitch;

/**
 * Handle the switch to or from generous mode.
 */
- (IBAction)generousModeSwitch:(UISwitch *)sender;

/**
 * Save the user selected TipPreference.
 * We use preferences to stop the TipPreference.
 */
-(void) saveSetting;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Settings";
    NSLog(@"View did load");
    
}

- (void)viewWillAppear:(BOOL)animated {
    //Read existing setting values
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id  tipValue = [defaults objectForKey:@"kTipPercentage"];
    id  possibleValues = [defaults objectForKey:@"kPossibleTipPercentage"];
    NSString* generousMode = [defaults objectForKey:@"kGenerousMode"];
    NSArray* percentages;
    NSInteger defaultTipPercentage = NSNotFound;
    
    if (possibleValues) {
        percentages = (NSArray*) possibleValues;
        defaultTipPercentage = [tipValue integerValue];
    } else {
        percentages = [[TipPercentagesHolder singletonInstance] regularPercentages];
    }
    [self setupPercentageSegmentControlWithPercentages:percentages selectedValue:defaultTipPercentage];
    if (generousMode) {
        if ([generousMode isEqualToString:@"YES"]) {
            [self.generousModeSwitch setOn:YES];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)finishSetting:(UITapGestureRecognizer *)sender {
    [self saveSetting];
}

// save the settings when user clicks on the back button
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self saveSetting];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)generousModeSwitch:(UISwitch *)sender {
    TipPercentagesHolder* holder = [TipPercentagesHolder singletonInstance];
    NSArray* percentages;
    if ([sender isOn]) {
        //generous mode
        percentages = [holder generousPercentages];
    } else {
        //regular mode
        percentages = [holder regularPercentages];
    }
    [self setupPercentageSegmentControlWithPercentages:percentages selectedValue:NSNotFound];
}

-(void) saveSetting {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray* percentages;
    TipPercentagesHolder* holder = [TipPercentagesHolder singletonInstance];
    if (self.generousModeSwitch.isOn) {
        percentages = [holder generousPercentages];
    } else {
        percentages = [holder regularPercentages];
    }
    NSInteger index = [self.settingPercentageSegmentedControl selectedSegmentIndex];
    
    [defaults setObject:[self.generousModeSwitch isOn] ? @"YES":@"NO" forKey:@"kGenerousMode"];
    [defaults setObject:percentages[index]  forKey:@"kTipPercentage"];
    [defaults setObject:percentages forKey:@"kPossibleTipPercentage"];
    [defaults synchronize];
}

-(void) setupPercentageSegmentControlWithPercentages:(NSArray*) percentages selectedValue:(NSInteger) value{
    int index = 0;
    for (id percentage in percentages) {
        [self.settingPercentageSegmentedControl setTitle:[NSString stringWithFormat:@"%lu%%", [percentage integerValue]] forSegmentAtIndex:index];
        if (value != NSNotFound && value == [percentage integerValue]) {
            [self.settingPercentageSegmentedControl setSelectedSegmentIndex:index];
        }
        index++;
    }
}
@end
