//
//  CatuiConnectRequest.h
//  Catui
//
//  Created by Nicholas Gulachek on 4/1/25.
//

#ifndef CatuiConnectRequest_h
#define CatuiConnectRequest_h

#import <Foundation/Foundation.h>
#import <Catui/CatuiSemver.h>

@interface CatuiConnectRequest : NSObject

@property (readonly) NSString *_Nonnull protocol;
@property (readonly) CatuiSemver *_Nonnull version;
@property (readonly) CatuiSemver *_Nonnull catuiVersion;

-(nonnull instancetype)initWithProtocol:(NSString*_Nonnull)proto version:(CatuiSemver*_Nonnull)protoVersion catuiVersion:(CatuiSemver*_Nonnull)catuiVersion;

@end

#endif /* CatuiConnectRequest_h */
