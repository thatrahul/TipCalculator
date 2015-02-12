//
//  SettingsViewController.h
//  TipCalculator
//
//  Created by Rahul Phadnis on 2/7/15.
//  Copyright (c) 2015 Rahul Phadnis. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 * SettingsView controller controls the settings screen.
 * Using the settings screen the user can set
 * 1. Tip mode : Standard vs Generous
 * 2. Tip Percentage.
 * Tip percentages available change based on the mode selection
 * 
 * Choices made by the user are saved in NSUserDefaults when user touches the screen
 * or navigates back to the Tip Calculator screen.
 */
@interface SettingsViewController : UIViewController

@end
