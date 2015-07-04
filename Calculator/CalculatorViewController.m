//
//  CalculatorViewController.m
//  Calculator
//
//  Created by almakaev iliyas on 15.06.15.
//  Copyright (c) 2015 almakaev iliyas. All rights reserved.
//

#import "CalculatorViewController.h"
#import "DataModel.h"

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
@property (strong, nonatomic) NSArray *sectionContent;
@property (strong, nonatomic) NSArray *dimensionsContent;
@property (strong, nonatomic) NSArray *weightContent;
@property (strong, nonatomic) NSArray *currentContent;
@property (strong, nonatomic) NSDictionary *element;

@end

@implementation CalculatorViewController

#pragma mark - Load

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Калькулятор металлопроката";
    
    // Do any additional setup after loading the view from its nib.
    // Show PickerView
    self.mkContent = [DataModel sharedInstance].mkComponents;
    self.sectionContent = [DataModel sharedInstance].sectionComponentsForMk;
    self.dimensionsContent = [DataModel sharedInstance].dimensionsComponentsForSection;
    self.weightContent = [DataModel sharedInstance].weightForDimensions;
    
    NSLog(@"%@", self.dimensionsContent);
    CGRect pickerFrame = CGRectZero;
    
    self.pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
    
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    self.mkField.delegate = self;
    self.sectionField.delegate = self;
    self.dimensionsField.delegate = self;
}

#pragma mark - Switcher

- (IBAction)switcherMode:(id)sender
{
}

#pragma mark - TextField

// Hide Keyboard
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    if (textField == self.mkField)
    {
  //      self.currentContent = self.mkContent;
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
        */
        self.mkField.inputView = self.pickerView;
        self.pickerView.tag = 1;
    }
    else if (textField == self.sectionField)
    {
   //     self.currentContent = self.sectionContent;
 /*       self.notifyDate = [self.datePickerView date];
        [self dateFormatter:self.notifyDate];
        
  
        
        [self.datePickerView addTarget:self action:@selector(didChangeDate:) forControlEvents:UIControlEventValueChanged];*/
        self.sectionField.inputView = self.pickerView;
        self.pickerView.tag = 2;
    }
    else if (textField == self.dimensionsField)
    {
        //     self.currentContent = self.sectionContent;
        /*       self.notifyDate = [self.datePickerView date];
         [self dateFormatter:self.notifyDate];
         
         
         
         [self.datePickerView addTarget:self action:@selector(didChangeDate:) forControlEvents:UIControlEventValueChanged];*/
        self.dimensionsField.inputView = self.pickerView;
        self.pickerView.tag = 3;
    }
    [self.pickerView reloadAllComponents];
}

#pragma mark - PickerView

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (self.pickerView.tag == 1)
    {
        self.currentContent = self.mkContent;
    }
    else if (self.pickerView.tag == 2)
    {
        self.currentContent = self.sectionContent;
    }
    else if (self.pickerView.tag == 3)
    {
        self.currentContent = self.dimensionsContent;
    }
    return self.currentContent.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (self.pickerView.tag == 1)
    {
        self.currentContent = self.mkContent;
    }
    else if (self.pickerView.tag == 2)
    {
        self.currentContent = self.sectionContent;
    }
    else if (self.pickerView.tag == 3)
    {
        self.currentContent = self.dimensionsContent;
    }
    return [self.currentContent objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (self.pickerView.tag == 1)
    {
        self.mkField.text = [self.currentContent objectAtIndex:row];
    }
    else if (self.pickerView.tag == 2)
    {
        self.sectionField.text = [self.currentContent objectAtIndex:row];
    }
    else if (self.pickerView.tag == 3)
    {
        self.dimensionsField.text = [self.currentContent objectAtIndex:row];
        self.weightLabel.text = [self.weightContent objectAtIndex:row];
    }
}

@end
