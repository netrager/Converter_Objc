//
//  ConverterControllerTest.m
//  Converter
//
//  Created by Alexander Vogel on 18.11.14.
//  Copyright (c) 2014 it-agile GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import "OCHamcrest/OCHamcrest.h"

#import "ConverterController.h"

@interface ConverterController (Test)
@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
- (IBAction)buttonTouched:(id)sender;
@end

@interface ConverterControllerTest : XCTestCase

@end

@implementation ConverterControllerTest{
    ConverterController *controller;
    UILabel *displayLabel;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    controller = [[ConverterController alloc] init];
    displayLabel = [[UILabel alloc] init];
    controller.displayLabel = displayLabel;
}
//
//- (void)tearDown {
//    // Put teardown code here. This method is called after the invocation of each test method in the class.
//    [super tearDown];
//}

- (UIButton *)buttonWithTag:(NSInteger)tag{
    
    UIButton *button = [[UIButton alloc] init];
    button.tag = tag;
    return button;
}
- (void)testZahlDesButtonsErscheintImDisplay{
    //arrange
    
    
    //act
    [controller buttonTouched:[self buttonWithTag:1]];
    
    //assert
    
    assertThat(displayLabel.text, is(@"1"));
}

@end
