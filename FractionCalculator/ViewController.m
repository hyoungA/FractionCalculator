//
//  ViewController.m
//  FractionCalculator
//
//  Created by KimHyoung on 2016. 5. 16..
//  Copyright © 2016년 KimHyoung. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()

@end

@implementation ViewController
{
    char op; // 연산자
    int currentNumber;
    BOOL firstOperand, isNumerator; //
    Calculator *myCalculator;
    NSMutableString *displayString; // 변경가능한 문자열
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 숫자판을 누르면 호출된다.
- (IBAction)clickDigit:(id)sender {
    int digit = (int)[sender tag];
    [self processDigit:digit];
}

- (IBAction)clickOver:(id)sender {
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString: @"/"];
    _display.text = displayString;
}

- (IBAction)clickClear:(id)sender
{
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString:@""];
    _display.text = displayString;
}

- (IBAction)clickEqual:(id)sender {
    if(firstOperand == NO){
        [self storeFracPart];
        [myCalculator performOperation: op];
        
        [displayString appendString: @" = "];
        [displayString appendString: [myCalculator.accumulator convertToString]];
        _display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [displayString setString: @""];
    }
    
}

- (IBAction)clickMultiply:(id)sender {
    [self processOp:'*'];
}

- (IBAction)clickDivide:(id)sender {
    [self processOp:'/'];
}

- (IBAction)clickMinus:(id)sender {
    [self processOp:'-'];
}

- (IBAction)clickPlus:(id)sender {
    [self processOp:'+'];
}

// currentNumber : 현재 입력한 숫자
// 숫자버튼을 누르면, 호출된다.
-(void) processDigit:(int)digit {
    //
    currentNumber = currentNumber * 10 + digit;
    
    // digit 을 문자열 형태로 바꿔서 displayString 에 붙여 넣는다.
    [displayString appendString:[NSString stringWithFormat:@"%i", digit]];
    _display.text = displayString;
}

// 연산자 버튼을 눌렀을 때 호출되는 함수
// 멤버변수 op 에 값을 문자열로 할당해서,
-(void) processOp:(char)theOp {
    NSString *opStr;
    op = theOp;
    
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
        default:
            break;
    }
    
    [self storeFracPart]; //
    firstOperand = NO; // 첫번째 피연산자 여부
    isNumerator = YES; // 분자값이 될 수 있음.
    [displayString appendString: opStr];
    _display.text = displayString;
    
}

// 사용자가 입력한 값을 가지고, Fraction 클래스가 가지는 분수 연산을 처리하는 방식으로 분모, 분자를 할당해준다.
// 분수형태가 아니라면, denominator 를 1로 둔다.
-(void) storeFracPart {
    // 첫번째 인자인지
    if(firstOperand){
        // 분자인지
        if(isNumerator){
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }
        
        else {
            myCalculator.operand1.denominator = currentNumber;
        }
    }
    
    else if (isNumerator) {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    }
    else {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    
    currentNumber = 0;
}

@end
