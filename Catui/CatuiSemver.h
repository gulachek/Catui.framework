//
//  CatuiSemver.h
//  Catui
//
//  Created by Nicholas Gulachek on 3/28/25.
//

#ifndef CatuiSemver_h
#define CatuiSemver_h

FOUNDATION_EXPORT NSString *const _Nonnull CatuiSemverErrorDomain;

typedef NS_ENUM(NSInteger, CatuiSemverErrorCode) {
    CatuiSemverErrorCodeInvalidSemverString = 1001
};

/**
 * Represents a semantic version as applied in the catui protocol
 */
@interface CatuiSemver : NSObject

/**
 * The major version component
 */
@property (readonly) uint16_t major;

/**
 * The minor version component
 */
@property (readonly) uint16_t minor;

/**
 * The patch version component
 */
@property (readonly) uint32_t patch;

/**
 * Initialize with numeric version components
 * @param major The majoor version component
 * @param minor The minor version component
 * @param patch The patch version component
 * @returns The initialized instance
 */
- (nonnull instancetype)initWithMajor:(uint16_t)major minor:(uint16_t)minor patch:(uint32_t)patch;

/**
 * Initialize with a formatted semver string
 * @param str The semver formatted string of the format "major.minor.patch"
 * @returns The initialized instance
 */
- (nullable instancetype)initWithString:(NSString *_Nonnull)str error:(NSError *_Nullable *_Nullable)error;

/**
 * Check if the instance's desired version can use another API's version according to semantic versioning conventions
 * @param api The other API's version potentially supporting this instance's desired version
 * @returns YES if this instance's desired version can use the API's version
 */
- (BOOL)canUse:(CatuiSemver *_Nonnull)api;

/**
 * Check if the instance's version can support another consumer's desired API version according to semantic versioning conventions
 * @param consumer The other consumer's desired API version potentially being supported by this instance's API version
 * @returns YES if this instance's API version can support the consumer's desired API version
 */
- (BOOL)canSupport:(CatuiSemver *_Nonnull)consumer;

@end

#endif /* CatuiSemver_h */
