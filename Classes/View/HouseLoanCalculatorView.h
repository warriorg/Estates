//
//  HouseLoanCalculatorView.h
//  Estates
//
//  Created by warrior gao on 13-11-9.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HouseLoanCalculatorView : UIView<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtUnitPrice;
@property (weak, nonatomic) IBOutlet UITextField *txtArea;
@property (weak, nonatomic) IBOutlet UITextField *txtMortgageRate;
@property (weak, nonatomic) IBOutlet UITextField *txtMortgageYear;
@property (weak, nonatomic) IBOutlet UITextField *txtBankRate;
@property (weak, nonatomic) IBOutlet UILabel *totalPrices;
@property (weak, nonatomic) IBOutlet UILabel *totalLoan;
@property (weak, nonatomic) IBOutlet UILabel *totalRepayment;
@property (weak, nonatomic) IBOutlet UILabel *totalInterest;
@property (weak, nonatomic) IBOutlet UILabel *fristPay;
@property (weak, nonatomic) IBOutlet UILabel *monthPay;
- (IBAction)calculator:(UIButton *)sender;
@end
