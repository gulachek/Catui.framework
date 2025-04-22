//
//  CatuiConnectResponse.h
//  Catui
//
//  Created by Nicholas Gulachek on 4/22/25.
//

#ifndef CatuiConnectResponse_h
#define CatuiConnectResponse_h

#import <Foundation/Foundation.h>
#import <Catui/CatuiError.h>

@interface CatuiConnectResponse : NSObject

@property (readonly) NSString *_Nullable errorMsg;

-(nonnull instancetype)initWithErrorMsg:(NSString*_Nullable)errMsg;

@end

#endif /* CatuiConnectResponse_h */
