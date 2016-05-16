//
//  Calculator.h
//  Fraction_Calculator
//
//  Created by KoJunil on 2016. 5. 13..
//  Copyright © 2016년 Test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface Calculator : NSObject {
    Fraction *operand1;
    Fraction *operand2;
    Fraction *accumulator;
}

@property (retain, nonatomic) Fraction *operand1, *operand2, *accumulator;

-(Fraction *) performOperation: (char) op; // 연산자
-(void) clear;

@end
