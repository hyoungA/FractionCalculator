//
//  Calculator.m
//  Fraction_Calculator
//
//  Created by KoJunil on 2016. 5. 13..
//  Copyright © 2016년 Test. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator
@synthesize operand1, operand2, accumulator;

-(id) init
{
    self = [super init];
    
    operand1 = [[Fraction alloc] init];
    operand2 = [[Fraction alloc] init];
    accumulator = [[Fraction alloc] init];
    
    return self;
}

-(Fraction *) performOperation: (char) op
{
    Fraction *result;
    
    switch (op) {
        case '+':
            result = [operand1 add: operand2];
            break;
        case '-':
            result = [operand1 subtract: operand2];
            break;
        case '*':
            result = [operand1 multiply: operand2];
            break;
        case '/':
            result = [operand1 divide: operand2];
            break;
    }
    
    accumulator.numerator = result.numerator;
    accumulator.denominator = result.denominator;
    
    return accumulator;
}
-(void) clear
{
    if (accumulator) {
        accumulator.numerator = 0;
        accumulator.denominator = 0;
    }
}

@end
