//
//  TSViewController.m
//  tipster
//
//  Created by Gururaj Naik on 8/10/13.
//  Copyright (c) 2013 Gururaj Naik. All rights reserved.
//

#import "TSViewController.h"

@interface TSViewController ()

-(void) onDoneButton;

@property   (nonatomic, strong) NSArray *tipAmt;

-(void)updateValues;

@end

@implementation TSViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"My Tip Ster";
        self.tipAmt = @[@(0.1), @(0.15), @(0.20)];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.billTextField.delegate = self;
    
    self.tipController.selectedSegmentIndex  = 1;
    [self.tipController addTarget:self action:@selector(updateValues) forControlEvents:UIControlEventValueChanged];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Mark - UITextField Delegate
-(BOOL)textFieldShouldBeginEditing:(UITextField *) textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *) textField {
    self.navigationItem.rightBarButtonItem = nil;
    return YES;
}

#pragma Mark - My all private Methods
-(void)onDoneButton {
    [self.view endEditing:YES];
    [self updateValues];

}
#pragma  Mark - All my Public Methods
-(void)updateValues{
    // Grap the values.
    float tipPercentage = [self.tipAmt[self.tipController.selectedSegmentIndex] floatValue];
    float bill = [self.billTextField.text floatValue];
   
    // compute the values
    float tip = tipPercentage * bill;
    float total = bill + tip;
   
    // Set the labels 
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tip];
    self.total.text = [NSString stringWithFormat:@"$%0.2f", total];
    
}

@end
