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

void assertCanUse(CatuiSemver *consumer, CatuiSemver *api) {
    XCTAssertTrue([consumer canUse:api]);
    XCTAssertTrue([api canSupport:consumer]);
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
    assertCanUse(consumer, api);
}

- (void)testSemverCantUseNil {
    CatuiSemver *api = mkSemver(1, 2, 3);
    CatuiSemver *consumer = mkSemver(1, 2, 3);
    XCTAssertFalse([api canSupport:nil]);
    XCTAssertFalse([consumer canUse:nil]);
}

@end
