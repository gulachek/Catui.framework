//
//  CatuiSemver.m
//  Catui
//
//  Created by Nicholas Gulachek on 3/28/25.
//

#import <Foundation/Foundation.h>

#import <Catui/CatuiSemver.h>

#include <vendor/include/catui.h>

NSString *const CatuiSemverErrorDomain = @"com.gulachek.CatuiSemver";

@implementation CatuiSemver {
    catui_semver _v;
}

- (instancetype)initWithMajor:(uint16_t)major minor:(uint16_t)minor patch:(uint32_t)patch {
    _v.major = major;
    _v.minor = minor;
    _v.patch = patch;
    return self;
}

- (nullable instancetype)initWithString:(NSString*)str error:(NSError *_Nullable *_Nullable)error {
    const char *cstr = [str cStringUsingEncoding:NSUTF8StringEncoding];
    int success = catui_semver_from_string(cstr, strlen(cstr), &self->_v);
    if (!success) {
        if (error != nil) {
            *error = [NSError errorWithDomain:CatuiSemverErrorDomain
                                         code:CatuiSemverErrorCodeInvalidSemverString
                                     userInfo:@{NSLocalizedDescriptionKey: NSLocalizedString(@"Invalid semver string", @"")}
            ];
        }
        return nil;
    }
    
    return self;
}

- (uint16_t)major {
    return _v.major;
}

- (uint16_t)minor {
    return _v.minor;
}

- (uint32_t)patch {
    return _v.patch;
}

- (BOOL)canUse:(CatuiSemver *)api {
    if (!api) return NO;
    return catui_semver_can_use(&self->_v, &api->_v);
}

- (BOOL)canSupport:(CatuiSemver *)consumer {
    if (!consumer) return NO;
    return catui_semver_can_support(&self->_v, &consumer->_v);
}

- (NSString*)description {
    char buf[CATUI_VERSION_SIZE];
    if (!catui_semver_to_string(&self->_v, buf, CATUI_VERSION_SIZE)) {
        return @"(Failed to serialize semver)";
    }
    
    return [NSString stringWithCString:buf encoding:NSUTF8StringEncoding];
}

@end
