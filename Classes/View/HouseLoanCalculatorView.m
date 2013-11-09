//
//  HouseLoanCalculatorView.m
//  Estates
//
//  Created by warrior gao on 13-11-9.
//  Copyright (c) 2013年 warriorg. All rights reserved.
//

#import "HouseLoanCalculatorView.h"

@implementation HouseLoanCalculatorView


- (IBAction)calculator:(UIButton *)sender {
    NSLog(@"计算");
    float unitPrice = [_txtUnitPrice.text floatValue];
    float area = [_txtArea.text floatValue];
    float mortgageRate = [_txtMortgageRate.text floatValue];
    float mortgageYear = [_txtMortgageYear.text floatValue];
    float bankRate = [_txtBankRate.text floatValue];
    float totalMonth = mortgageYear * 12;
    //月利率
    float monthRate = bankRate / (12 * 100);
    
    
    
    float totalPrices = unitPrice * area;
    float totalLoan = totalPrices * mortgageRate / 10;
        //每月还款
    float monthInterest = totalLoan * monthRate * pow((monthRate + 1), totalMonth) / (pow((monthRate + 1), totalMonth) - 1);
    //利息
    float interest = monthInterest * totalMonth - totalLoan;
    
    _totalPrices.text = [NSString stringWithFormat:@"%.2f", totalPrices];
    _totalLoan.text = [NSString stringWithFormat:@"%.2f", totalLoan];
    _totalRepayment.text = [NSString stringWithFormat:@"%.2f", totalLoan + interest];
    _totalInterest.text = [NSString stringWithFormat:@"%.2f", interest];
    _fristPay.text = [NSString stringWithFormat:@"%.2f", totalPrices - totalLoan];
    _monthPay.text = [NSString stringWithFormat:@"%.2f", monthInterest];
}

@end
