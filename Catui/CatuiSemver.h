//
//  CatuiSemver.h
//  Catui
//
//  Created by Nicholas Gulachek on 3/28/25.
//

#ifndef CatuiSemver_h
#define CatuiSemver_h

@interface CatuiSemver : NSObject

@property (readonly) uint16_t major;
@property (readonly) uint16_t minor;
@property (readonly) uint32_t patch;

- (id)initWithMajor:(uint16_t)major minor:(uint16_t)minor patch:(uint32_t)patch;

- (BOOL)canUse:(CatuiSemver *)api;
- (BOOL)canSupport:(CatuiSemver *)consumer;

@end

#endif /* CatuiSemver_h */
