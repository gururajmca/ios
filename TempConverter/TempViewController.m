//
//  TempViewController.m
//  TempConverter
//
//  Created by Gururaj Naik on 8/11/13.
//  Copyright (c) 2013 Gururaj Naik. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()

//Define all the variables needed for the temp conversion
@property   (nonatomic, weak)   IBOutlet    UITextField *cTemp;
@property   (nonatomic, weak)   IBOutlet    UITextField *fTemp;
@property   (nonatomic, weak) IBOutlet UIButton *tempController;
-(void) onDoneButton;

-(IBAction)convertToCelsius:(id)sender;

@end

@implementation TempViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature Converter";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //[self.TempController addTarget:self action:@selector(convertToCelsius) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(float)faren2celsius:(int) faren
{
    return (faren-32)/1.8;
}

-(IBAction) convertToCelsius:(id)sender
{
    float c=[self.cTemp.text floatValue];
    self.fTemp.text=[NSString stringWithFormat:@"%0.2f", (c * 9/5 + 32)];
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
    //[self convertToCelsius];
    
}
@end
