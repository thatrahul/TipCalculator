//
//  TipViewController.m
//  TipCalculator
//
//  Created by Rahul Phadnis on 2/2/15.
//  Copyright (c) 2015 Rahul Phadnis. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"
#import "TipPercentagesHolder.h"
#import "TipPreference.h"

@interface TipViewController ()
- (IBAction)finishEditing:(UITapGestureRecognizer *)sender;

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLable;
@property (strong, nonatomic) NSArray* possibleTipPercentages;
//@property (strong, nonatomic) NSArray* defaultTipPercentages;
-(void) calculate;

- (IBAction)tipPercentageChanged:(UISegmentedControl *)sender;

@end

@implementation TipViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Tip Calculator";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(displaySettingsView)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id  tipValue = [defaults objectForKey:@"kTipPercentage"];
    id  possibleValues = [defaults objectForKey:@"kPossibleTipPercentage"];
    //NSArray* percentages;
    NSInteger defaultTipPercentage = NSNotFound;
    
    if (possibleValues) {
        self.possibleTipPercentages = (NSArray*) possibleValues;
        defaultTipPercentage = [tipValue integerValue];
    } else {
        self.possibleTipPercentages = [[TipPercentagesHolder singletonInstance] regularPercentages];
    }
    [self setupPercentageSegmentControlWithPercentages:self.possibleTipPercentages selectedValue:defaultTipPercentage];
    if (self.billTextField) {
        [self calculate];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)finishEditing:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self calculate];
}

-(void)calculate {
    float bill = [self.billTextField.text floatValue];
    
    //NSArray* tipPercentages = @[@(10), @(15), @(20)];
    
    NSInteger tipIndex = [self.tipPercentageControl selectedSegmentIndex];
    float tipAmount = bill * [self.possibleTipPercentages[tipIndex] floatValue] /100;
    self.tipAmountLable.text = [NSString stringWithFormat:@"$ %0.2f",tipAmount];
    float total = bill + tipAmount;
    self.totalLabel.text = [NSString stringWithFormat:@"$ %0.2f", total];
    
    NSLocale *theLocale = [NSLocale currentLocale];
    NSString *symbol = [theLocale objectForKey:NSLocaleCurrencySymbol];
    NSString *code = [theLocale objectForKey:NSLocaleCurrencySymbol];
    
    NSLog(@"Currency code:%@", code);
    
}

- (IBAction)tipPercentageChanged:(UISegmentedControl *)sender {
    [self calculate];
}

-(void) displaySettingsView {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

-(void) setupPercentageSegmentControlWithPercentages:(NSArray*) percentages selectedValue:(NSInteger) value {
    int index = 0;
    for (id percentage in percentages) {
        [self.tipPercentageControl setTitle:[NSString stringWithFormat:@"%lu%%", [percentage integerValue]] forSegmentAtIndex:index];
        
        if (value != NSNotFound && value == [percentage integerValue]) {
            [self.tipPercentageControl setSelectedSegmentIndex:index];
        }
        index++;
    }
    
}

@end
