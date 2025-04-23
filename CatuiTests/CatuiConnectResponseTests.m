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
    
    XCTAssertEqualObjects(resp.errorMsg, @"hello");
}

- (void)testCanConstructWithoutErrorMsg {
    CatuiConnectResponse *resp = [[CatuiConnectResponse alloc] init];
    
    XCTAssertNil(resp.errorMsg);
}

- (void)testEncodingHasErrorWithNilMsgSize {
    CatuiConnectResponse *resp = [[CatuiConnectResponse alloc] init];
    NSError *err;
    uint8_t buf[CatuiConnectResponseBufSize];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    BOOL ret = [resp encodeBytes:buf bufSize:sizeof(buf) msgSize:nil error:&err];
#pragma clang diagnostic pop
    
    XCTAssertFalse(ret);
    XCTAssertNotNil(err);
    XCTAssertEqual(err.domain, CatuiErrorDomain);
    XCTAssertEqual(err.code, CatuiErrorCodeInvalidParam);
}

- (void)testEncodingWithoutErrorMsgResultsInZeroSizedMessage {
    CatuiConnectResponse *resp = [[CatuiConnectResponse alloc] init];
    NSError *err;
    uint8_t buf[CatuiConnectResponseBufSize];
    size_t msgSize;
    
    BOOL ret = [resp encodeBytes:buf bufSize:sizeof(buf) msgSize:&msgSize error:&err];
    
    XCTAssertTrue(ret);
    XCTAssertNil(err);
    XCTAssertEqual(msgSize, 0);
}

- (void)testEncodingWithErrorMsgEncodesJsonWithErrorProperty {
    CatuiConnectResponse *resp = [[CatuiConnectResponse alloc] initWithErrorMsg:@"Hello!"];
    
    NSError *err;
    uint8_t buf[CatuiConnectResponseBufSize];
    size_t msgSize;
    
    BOOL ret = [resp encodeBytes:buf bufSize:sizeof(buf) msgSize:&msgSize error:&err];
    
    XCTAssertTrue(ret);
    XCTAssertNil(err);
    
    NSData *data = [NSData dataWithBytes:buf length:msgSize];
    NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
    
    XCTAssertNotNil(data);
    XCTAssertNil(err);
    XCTAssertEqualObjects(obj[@"error"], @"Hello!");
}

- (void)testEncodingHasErrorWhenBufferNotLargeEnough {
    CatuiConnectResponse *resp = [[CatuiConnectResponse alloc] initWithErrorMsg:@"Hello!"];
    
    NSError *err;
    uint8_t buf[2];
    size_t msgSize;
    
    BOOL ret = [resp encodeBytes:buf bufSize:sizeof(buf) msgSize:&msgSize error:&err];
    
    XCTAssertFalse(ret);
    XCTAssertNotNil(err);
    XCTAssertEqual(err.domain, CatuiErrorDomain);
    XCTAssertEqual(err.code, CatuiErrorCodeFailure);
    XCTAssertEqual(msgSize, 0);
}

@end
