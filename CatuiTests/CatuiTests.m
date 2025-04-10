//
//  CatuiTests.m
//  CatuiTests
//
//  Created by Nicholas Gulachek on 3/27/25.
//

#import <XCTest/XCTest.h>
#import <Catui/Catui.h>

CatuiSemver *mkSemver(unsigned int major, unsigned int minor, unsigned int patch) {
    return [[CatuiSemver alloc] initWithMajor:major minor:minor patch:patch];
}

@interface CatuiTests : XCTestCase

@end

@implementation CatuiTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testCanConstructSemver {
    CatuiSemver *semver = [[CatuiSemver alloc] initWithMajor:1 minor:2 patch:3];
    XCTAssertEqual(semver.major, 1);
    XCTAssertEqual(semver.minor, 2);
    XCTAssertEqual(semver.patch, 3);
}

- (void)testSemverCanUseSameVersion {
    CatuiSemver *api = mkSemver(1, 2, 3);
    CatuiSemver *consumer = mkSemver(1, 2, 3);
    XCTAssertTrue([api canSupport:consumer]);
    XCTAssertTrue([consumer canUse:api]);
}

- (void)testSemverCantUseNil {
    CatuiSemver *api = mkSemver(1, 2, 3);
    CatuiSemver *consumer = mkSemver(1, 2, 3);
    XCTAssertFalse([api canSupport:(id _Nonnull)nil]);
    XCTAssertFalse([consumer canUse:(id _Nonnull)nil]);
}

- (void)testSemverCanUseCompatibleVersion {
    CatuiSemver *api = mkSemver(1, 5, 0);
    CatuiSemver *consumer = mkSemver(1, 2, 3);
    XCTAssertTrue([api canSupport:consumer]);
    XCTAssertTrue([consumer canUse:api]);
}

- (void)testSemverCantUseIncompatibleVersion {
    CatuiSemver *api = mkSemver(2, 0, 0);
    CatuiSemver *consumer = mkSemver(1, 2, 3);
    XCTAssertFalse([api canSupport:consumer]);
    XCTAssertFalse([consumer canUse:api]);
}

- (void)testSemverCanUseCompatibleZeroBasedVersion {
    CatuiSemver *api = mkSemver(0, 5, 1);
    CatuiSemver *consumer = mkSemver(0, 5, 0);
    XCTAssertTrue([api canSupport:consumer]);
    XCTAssertTrue([consumer canUse:api]);
}

- (void)testSemverCantUseIncompatibleZeroBasedVersion {
    CatuiSemver *api = mkSemver(0, 2, 0);
    CatuiSemver *consumer = mkSemver(0, 1, 3);
    XCTAssertFalse([api canSupport:consumer]);
    XCTAssertFalse([consumer canUse:api]);
}

- (void)testCanInitWithString {
    CatuiSemver *v = [[CatuiSemver alloc] initWithString:@"1.2.3" error:nil];
    XCTAssertEqual(v.major, 1);
    XCTAssertEqual(v.minor, 2);
    XCTAssertEqual(v.patch, 3);
}

- (void)testInitErrorsWithInvalidString {
    NSError *err = nil;
    CatuiSemver *v = [[CatuiSemver alloc] initWithString:@"hello" error:&err];
    XCTAssertNil(v);
    XCTAssertNotNil(err);
    XCTAssertEqual(err.domain, CatuiSemverErrorDomain);
    XCTAssertEqual(err.code, CatuiSemverErrorCodeInvalidSemverString);
}

- (void)testDescriptionRepresentsSemverAsString {
    CatuiSemver *v = [[CatuiSemver alloc] initWithString:@"1.2.3" error:nil];
    XCTAssertNotNil(v);
    
    NSString *str = v.description;
    XCTAssertTrue([str isEqual:@"1.2.3"]);
}

@end
