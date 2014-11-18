#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import "OCHamcrest/OCHamcrest.h"

@interface SmokeUnitTest : XCTestCase

@end

@implementation SmokeUnitTest

- (void)testItShouldSmoke {
//	XCTAssertFalse(FALSE);
    
    //arrange
    NSString *foo = @"foo";
    NSString *bar = @"bar";
    NSString *foobar = @"foobar";
    
    //act
//    NSString *upper = [foo uppercaseString];
    NSArray *array = @[foo, bar];
    
    //assert
//    XCTAssertEqualObjects(upper, @"FOO");
    
    XCTAssert(array.count > 0);
//    XCTAssert([array containsObject:foobar]);
    
    assertThat(array, hasItem(foo));
    assertThat(foo, is(@"foo"));
}
@end
