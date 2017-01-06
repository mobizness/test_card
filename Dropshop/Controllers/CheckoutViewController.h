//
//  CheckoutViewController.h
//  Dropshop
//
//  Created by scs on 1/6/17.
//  Copyright © 2017 Robert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseItemViewController.h"

@interface CheckoutViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *textfieldName;
@property (strong, nonatomic) IBOutlet UITextField *textfieldPhone;
@property (strong, nonatomic) IBOutlet UITableView *tblCard;
@property (strong, nonatomic) IBOutlet NSMutableArray *arrThemeData;
@property (strong, nonatomic) IBOutlet NSMutableArray *arrSelected;
@property (strong, nonatomic) IBOutlet NSMutableArray *arrPaid;
@property (assign, nonatomic) IBOutlet ChooseItemViewController *chooseitemVC;

- (IBAction)OnBack:(id)sender;
- (IBAction)OnReload:(id)sender;
- (IBAction)OnPay:(id)sender;
@end
