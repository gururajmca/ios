//
//  TSViewController.h
//  tipster
//
//  Created by Gururaj Naik on 8/10/13.
//  Copyright (c) 2013 Gururaj Naik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSViewController : UIViewController
// Define all the UI elements which are used in the program
@property   (nonatomic, weak) IBOutlet  UITextField *billTextField;
@property   (nonatomic, weak) IBOutlet  UILabel *tipLabel;
@property   (nonatomic, weak) IBOutlet  UILabel *total;
@property   (nonatomic, weak) IBOutlet UISegmentedControl *tipController;

@end
