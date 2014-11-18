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

#define MOCKITO_SHORTHAND
#import "OCMockito/OCMockito.h"

#import "ConverterController.h"

@interface ConverterController (Test)
@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
- (IBAction)buttonTouched:(id)sender;
@end

@interface ConverterControllerTest : XCTestCase

@end

@implementation ConverterControllerTest{
    ConverterController *controller;
    id displayLabel;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    controller = [[ConverterController alloc] init];
    displayLabel = mock([UILabel class]);
    controller.displayLabel = displayLabel;
}
//
//- (void)tearDown {
//    // Put teardown code here. This method is called after the invocation of each test method in the class.
//    [super tearDown];
//}

- (UIButton *)buttonWithTag:(NSInteger)tag{
    
    id button = mock([UIButton class]);
    [given([button tag]) willReturnInteger:tag];
    return button;
}
- (void)testZahlDesButtonsErscheintImDisplay{
    //arrange
    
    
    //act
    [controller buttonTouched:[self buttonWithTag:1]];
    
    //assert
    
//    assertThat(displayLabel.text, is(@"1"));
    
    [verify(displayLabel) setText:@"1"];
}

//- (void)testStory2{ //Eingabe einer ganzen Zahl
//    [controller buttonTouched:[self buttonWithTag:1]];
//    [controller buttonTouched:[self buttonWithTag:2]];
//    [controller buttonTouched:[self buttonWithTag:4]];
//    
//    assertThat(displayLabel.text, is(@"124"));
//}
//
//- (void)testStory3{ //Beschränke die Länge
//    /* // first but bad readable
//    [controller buttonTouched:[self buttonWithTag:1]];
//    [controller buttonTouched:[self buttonWithTag:2]];
//    [controller buttonTouched:[self buttonWithTag:3]];
//    [controller buttonTouched:[self buttonWithTag:4]];
//    [controller buttonTouched:[self buttonWithTag:5]];
//    [controller buttonTouched:[self buttonWithTag:6]];
//    [controller buttonTouched:[self buttonWithTag:7]];
//    [controller buttonTouched:[self buttonWithTag:8]];
//    [controller buttonTouched:[self buttonWithTag:9]];
//    [controller buttonTouched:[self buttonWithTag:0]];
//    [controller buttonTouched:[self buttonWithTag:1]];
//    
//    assertThatInt(displayLabel.text.length, equalToInt(10));
//     
//     */
//    
//    displayLabel.text = @"123456789";
//    [controller buttonTouched:[self buttonWithTag:1]];
//    assertThatInt(displayLabel.text.length, equalToInt(10));
//
//}
//
//- (void)testNurEineFuehrendeNull{ //Story 4
//    displayLabel.text = @"";
//    [controller buttonTouched:[self buttonWithTag:0]];
//    
//    assertThat(displayLabel.text, is(@"0"));
//}
//
//- (void)testEingabeVonMehrerenNullNachAndererZahl{ //Story 4
//    displayLabel.text = @"1";
//    [controller buttonTouched:[self buttonWithTag:0]];
//    [controller buttonTouched:[self buttonWithTag:0]];
//    
//    assertThat(displayLabel.text, is(@"100"));
//}

@end
