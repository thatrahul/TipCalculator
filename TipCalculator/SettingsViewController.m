//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Rahul Phadnis on 2/7/15.
//  Copyright (c) 2015 Rahul Phadnis. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;
-(void) saveSetting;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"Settings";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)finishSetting:(UITapGestureRecognizer *)sender {
    [self saveSetting];
}

// save the settings when user clicks on the back button
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self saveSetting];
//    if ([self isMovingFromParentViewController]) {
//        //specific stuff for being popped off stack
//    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) saveSetting {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.tipPercentageTextField.text forKey:@"kTipPercentage"];
    [defaults synchronize];
}



@end
