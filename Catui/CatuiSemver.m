//
//  CatuiSemver.m
//  Catui
//
//  Created by Nicholas Gulachek on 3/28/25.
//

#import <Foundation/Foundation.h>

#import <Catui/CatuiSemver.h>

@implementation CatuiSemver

- (id)initWithMajor:(unsigned int)major minor:(unsigned int)minor patch:(unsigned int)patch {
    self->_major = major;
    self->_minor = minor;
    self->_patch = patch;
    return self;
}

- (BOOL)canUse:(CatuiSemver *)api {
    if (!api) return NO;
    return YES;
}

- (BOOL)canSupport:(CatuiSemver *)consumer {
    if (!consumer) return NO;
    return [consumer canUse:self];
}

@end
