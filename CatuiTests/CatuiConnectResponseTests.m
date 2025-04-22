//
//  CatuiConnectResponseTests.m
//  CatuiTests
//
//  Created by Nicholas Gulachek on 4/22/25.
//

#import <XCTest/XCTest.h>
#import <Catui/Catui.h>

@interface CatuiConnectResponseTests : XCTestCase

@end

@implementation CatuiConnectResponseTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testCanConstructWithErrorMsg {
    CatuiConnectResponse *resp = [[CatuiConnectResponse alloc] initWithErrorMsg:@"hello"];
    
    XCTAssertEqual(resp.errorMsg, @"hello");
}

- (void)testCanConstructWithoutErrorMsg {
    CatuiConnectResponse *resp = [[CatuiConnectResponse alloc] init];
    
    XCTAssertNil(resp.errorMsg);
}

@end
