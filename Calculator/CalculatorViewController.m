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
    /*self.sectionContent = [DataModel sharedInstance].sectionComponentsForMk;
    self.dimensionsContent = [DataModel sharedInstance].dimensionsComponentsForSection;*/
    
    
    NSLog(@"%@", self.dimensionsContent);
    CGRect pickerFrame = CGRectZero;
    
    self.pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
    
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    self.mkField.delegate = self;
    self.sectionField.delegate = self;
    self.dimensionsField.delegate = self;
    self.inputField.delegate = self;
}

#pragma mark - Switcher

- (IBAction)switcherMode:(id)sender
{
    if (self.switcher.on)
    {
        self.modeField.text = @"Расчёт массы по длине";
        self.inputField.text = @"Укажите длину";
    }
    else
    {
        self.modeField.text = @"Расчёт длины по массе";
        self.inputField.text = @"Укажите вес";
    }
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
        self.currentContent = self.mkContent;
    }
    else if (textField == self.sectionField)
    {
   //     self.currentContent = self.sectionContent;
 /*       self.notifyDate = [self.datePickerView date];
        [self dateFormatter:self.notifyDate];
        
  
        
        [self.datePickerView addTarget:self action:@selector(didChangeDate:) forControlEvents:UIControlEventValueChanged];*/
        self.sectionField.inputView = self.pickerView;
        self.pickerView.tag = 2;
        self.currentContent = self.sectionContent;
    }
    else if (textField == self.dimensionsField)
    {
        //     self.currentContent = self.sectionContent;
        /*       self.notifyDate = [self.datePickerView date];
         [self dateFormatter:self.notifyDate];
         
         
         
         [self.datePickerView addTarget:self action:@selector(didChangeDate:) forControlEvents:UIControlEventValueChanged];*/
        self.dimensionsField.inputView = self.pickerView;
        self.pickerView.tag = 3;
        self.currentContent = self.dimensionsContent;
    }

    [self.pickerView reloadAllComponents];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    float weightNumber = [[self.inputField.text stringByReplacingCharactersInRange:range withString:string] floatValue];
    NSString *convertComma = [self.weightLabel.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    float lengthNumber = [convertComma floatValue];
    float result;
    if (self.switcher.on)
    {
        result = weightNumber * lengthNumber;
    }
    else
    {
        result = weightNumber/lengthNumber;
    }
    NSLog(@"%f", result);
    self.resultLabel.text = [NSString stringWithFormat:@"%.3f", result];
    return YES;
}

#pragma mark - PickerView

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.currentContent.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.currentContent objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (self.pickerView.tag == 1)
    {
        self.mkField.text = [self.currentContent objectAtIndex:row];
        self.sectionContent = [[DataModel sharedInstance] sectionComponentsForMk:row];
    }
    else if (self.pickerView.tag == 2)
    {
        self.sectionField.text = [self.currentContent objectAtIndex:row];
        self.dimensionsContent = [[DataModel sharedInstance] dimensionsComponentsForSection:row];
    }
    else if (self.pickerView.tag == 3)
    {
        self.dimensionsField.text = [self.currentContent objectAtIndex:row];
        self.weightContent = [DataModel sharedInstance].weightForDimensions;
        self.weightLabel.text = [self.weightContent objectAtIndex:row];
    }
}

@end
