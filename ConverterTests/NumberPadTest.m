//
//  NumberPadTest.m
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

#import "NumberPad.h"

@interface NumberPadTest : XCTestCase

@end

@implementation NumberPadTest{
    NumberPad *numberPad;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    numberPad = [[NumberPad alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (id)buttonWithTag:(NSInteger)tag{
    id button = mock([UIButton class]);
    [given([button tag]) willReturnInteger:tag];
    return button;
}

- (void)testMehrFachEingabe{ //Eingabe einer ganzen Zahl
    [numberPad buttonTouched:[self buttonWithTag:1]];
    [numberPad buttonTouched:[self buttonWithTag:2]];
    [numberPad buttonTouched:[self buttonWithTag:4]];
    
    assertThat(numberPad.currentValue, is(@"124"));
}

@end
