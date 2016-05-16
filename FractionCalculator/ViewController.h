//
//  ViewController.h
//  FractionCalculator
//
//  Created by KimHyoung on 2016. 5. 16..
//  Copyright © 2016년 KimHyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;

- (IBAction)clickDigit:(id)sender;
- (IBAction)clickOver:(id)sender;  // over : 숫자를 누른 후 over 를 누르면, 분자로 올라가서 분모를 입력할 수 있다.
- (IBAction)clickClear:(id)sender;
- (IBAction)clickEqual:(id)sender;
- (IBAction)clickMultiply:(id)sender;
- (IBAction)clickDivide:(id)sender;
- (IBAction)clickMinus:(id)sender;
- (IBAction)clickPlus:(id)sender;

-(void) processDigit:(int)digit;
-(void) processOp:(char)theOp;
-(void) storeFracPart;

@end

