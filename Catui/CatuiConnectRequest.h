//
//  CatuiConnectRequest.h
//  Catui
//
//  Created by Nicholas Gulachek on 4/1/25.
//

#ifndef CatuiConnectRequest_h
#define CatuiConnectRequest_h

#import <Foundation/Foundation.h>
#import <Catui/CatuiError.h>
#import <Catui/CatuiSemver.h>

/**
 * Maximum size needed to contain an encoded connect request message
 */
static const NSInteger CatuiConnectRequestBufSize = 1024;

/**
 * Represents a connect request
 */
@interface CatuiConnectRequest : NSObject

/**
 * The reverse DNS formatted protocol for which the connection should be established
 */
@property (readonly) NSString *_Nonnull protocol;
/**
 * The protocol version for which the connection should be established
 */
@property (readonly) CatuiSemver *_Nonnull version;
/**
 * The catui protocol version over which this connect request will be made
 */
@property (readonly) CatuiSemver *_Nonnull catuiVersion;

/**
 * Initialize a connect request from semantic properties
 * @param proto The protocol being requested
 * @param protoVersion The version of the protocol being requested
 * @param catuiVersion The catui version over which the request will be made
 * @return The initialized instance
 */
-(nonnull instancetype)initWithProtocol:(NSString*_Nonnull)proto version:(CatuiSemver*_Nonnull)protoVersion catuiVersion:(CatuiSemver*_Nonnull)catuiVersion;

/**
 * Initialize a connect request from an encoded buffer
 * @param[in] bytes A pointer to the buffer holding the encoded bytes
 * @param[in] length The number of bytes in the encoded message
 * @param[out] error (Optional) Points to an error object which, upon encountering an error, will be set
 * @return The initialized instance or nil
 */
-(nullable instancetype)initWithBytes:(const void*_Nonnull)bytes length:(size_t)length error:(NSError *_Nullable *_Nullable)error;

@end

#endif /* CatuiConnectRequest_h */
