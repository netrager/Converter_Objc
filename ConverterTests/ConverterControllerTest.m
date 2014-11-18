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
#import "NumberPad.h"

@interface ConverterController (Test)
@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
@property (nonatomic) NumberPad *numberPad;
- (IBAction)buttonTouched:(id)sender;
@end

@interface ConverterControllerTest : XCTestCase

@end

@implementation ConverterControllerTest{
    ConverterController *controller;
    id displayLabel;
    id numberPad;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    controller = [[ConverterController alloc] init];
    displayLabel = mock([UILabel class]);
    controller.displayLabel = displayLabel;
    numberPad = mock([NumberPad class]);
    controller.numberPad = numberPad;
   
}
//
//- (void)tearDown {
//    // Put teardown code here. This method is called after the invocation of each test method in the class.
//    [super tearDown];
//}

- (id)buttonWithTag:(NSInteger)tag{
    
    id button = mock([UIButton class]);
    [given([button tag]) willReturnInteger:tag];
    return button;
}

- (void)testControllerHatNumberPad{
    [controller viewDidLoad];
    assertThat(controller.numberPad, is(notNilValue()));
}

- (void)testButtonTouchWerdenAnNumberPadWeitergeleitet{
    
    id button = [self buttonWithTag:1];
    [controller buttonTouched:button];
    [verify(numberPad) buttonTouched:button];
}

- (void)testZahlERscheintImDisplay{
    [given([numberPad currentValue]) willReturn:@"42"];
    [controller buttonTouched:nil];
    [verify(displayLabel) setText:@"42"];
}



- (void)testStory3{ //Beschränke die Länge
    /* // first but bad readable
    [controller buttonTouched:[self buttonWithTag:1]];
    [controller buttonTouched:[self buttonWithTag:2]];
    [controller buttonTouched:[self buttonWithTag:3]];
    [controller buttonTouched:[self buttonWithTag:4]];
    [controller buttonTouched:[self buttonWithTag:5]];
    [controller buttonTouched:[self buttonWithTag:6]];
    [controller buttonTouched:[self buttonWithTag:7]];
    [controller buttonTouched:[self buttonWithTag:8]];
    [controller buttonTouched:[self buttonWithTag:9]];
    [controller buttonTouched:[self buttonWithTag:0]];
    [controller buttonTouched:[self buttonWithTag:1]];
    
    assertThatInt(displayLabel.text.length, equalToInt(10));
     
     */
    
//    displayLabel.text = @"1234567890";
//    [controller buttonTouched:[self buttonWithTag:1]];
//    assertThatInt(displayLabel.text.length, equalToInt(10));
    
    [given(controller.displayLabel.text) willReturn:@"1234567890"];
    [controller buttonTouched:[self buttonWithTag:1]];
    assertThatInt(controller.displayLabel.text.length, equalToInt(10));

}
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
