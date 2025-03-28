//
//  CatuiSemver.h
//  Catui
//
//  Created by Nicholas Gulachek on 3/28/25.
//

#ifndef CatuiSemver_h
#define CatuiSemver_h

@interface CatuiSemver : NSObject

@property (readonly) unsigned int major;
@property (readonly) unsigned int minor;
@property (readonly) unsigned int patch;

- (id)initWithMajor:(unsigned int)major minor:(unsigned int)minor patch:(unsigned int)patch;

@end

#endif /* CatuiSemver_h */
