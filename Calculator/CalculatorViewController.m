//
//  CalculatorViewController.m
//  Calculator
//
//  Created by almakaev iliyas on 15.06.15.
//  Copyright (c) 2015 almakaev iliyas. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController () <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *mkField;
@property (weak, nonatomic) IBOutlet UITextField *sectionField;
@property (weak, nonatomic) IBOutlet UITextField *dimensionsField;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *modeField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UISwitch *switcher;
- (IBAction)switcherMode:(id)sender;

@property (strong, nonatomic) UIPickerView *pickerView;
@property (strong, nonatomic) NSArray *mkContent;
@property (strong, nonatomic) NSDictionary *element;

@end

@implementation CalculatorViewController

#pragma mark - Load

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    // Show PickerView
    CGRect pickerFrame = CGRectZero;
    
    self.pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
    
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
}

#pragma mark - Switcher

- (IBAction)switcherMode:(id)sender
{
}

#pragma mark - TextField

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    if (textField == self.mkField)
    {
     /*   if ([self.repeatField.text isEqual: self.notRepeat] || self.repeatField.placeholder == [self.repeatOptions objectAtIndex:0])
        {
            self.repeatField.placeholder = nil;
            self.repeatField.text = self.notRepeat;
            [self.pickerView selectRow:0 inComponent:0 animated:NO];
        }
        else if ([self.repeatField.text isEqual: self.everyMinute])
            [self.pickerView selectRow:1 inComponent:0 animated:NO];
        
        else if ([self.repeatField.text isEqual: self.everyHour])
            [self.pickerView selectRow:2 inComponent:0 animated:NO];
        
        else if ([self.repeatField.text isEqual: self.everyDay])
            [self.pickerView selectRow:3 inComponent:0 animated:NO];
        
        else if ([self.repeatField.text isEqual: self.everyWeek])
            [self.pickerView selectRow:4 inComponent:0 animated:NO];
        
        self.repeatField.inputView = self.pickerView;*/
    }
    else if (textField == self.sectionField)
    {
 /*       self.notifyDate = [self.datePickerView date];
        [self dateFormatter:self.notifyDate];
        
        self.dateField.inputView = self.datePickerView;
        
        [self.datePickerView addTarget:self action:@selector(didChangeDate:) forControlEvents:UIControlEventValueChanged];*/
    }
}

#pragma mark - PickerView

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.mkContent.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.mkContent objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.mkField.text = [self.mkContent objectAtIndex:row];
}

@end
