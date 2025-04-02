//
//  CatuiConnectRequestTests.m
//  CatuiTests
//
//  Created by Nicholas Gulachek on 4/1/25.
//

#import <XCTest/XCTest.h>
#import <Catui/Catui.h>

@interface CatuiConnectRequestTests : XCTestCase

@end

@implementation CatuiConnectRequestTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testCanConstruct {
    NSString *proto = @"com.example.test";
    CatuiSemver *pv = [[CatuiSemver alloc] initWithString:@"1.2.3" error:nil];
    CatuiSemver *cv = [[CatuiSemver alloc] initWithString:@"0.1.0" error:nil];
    
    CatuiConnectRequest *req = [[CatuiConnectRequest alloc] initWithProtocol:proto version:pv catuiVersion:cv];
    
    XCTAssertNotNil(req);
    XCTAssertEqual(req.protocol, proto);
    XCTAssertEqual(req.version, pv);
    XCTAssertEqual(req.catuiVersion, cv);
}

@end
