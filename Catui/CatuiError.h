//
//  CatuiError.h
//  Catui
//
//  Created by Nicholas Gulachek on 4/13/25.
//

#ifndef CatuiError_h
#define CatuiError_h

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString *const _Nonnull CatuiErrorDomain;

typedef NS_ENUM(NSInteger, CatuiErrorCode) {
    CatuiErrorCodeInvalidSemverString = 1001,
    CatuiErrorCodeInvalidConnectRequestString = 1002
};

#endif /* CatuiError_h */
