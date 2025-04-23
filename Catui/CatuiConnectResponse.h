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

/**
 * Represents a catui connect response
 */
@interface CatuiConnectResponse : NSObject

/**
 * If an error is reported by the server, this is set to the error message
 */
@property (readonly) NSString *_Nullable errorMsg;

/**
 * Initializes an instance with an error message
 * @param errMsg (Optional) The error message
 * @return The initialized instance
 */
-(nonnull instancetype)initWithErrorMsg:(NSString*_Nullable)errMsg;

/**
 * Encode the connect resonse into a buffer
 * @param[out] buf A pointer to the buffer which will hold the encoded message
 * @param[in] bufSize The number of bytes that @p buf can hold
 * @param[out] msgSize On success, is set to the number of bytes of the encoded message in @p buf
 * @param[out] error (Optional) Points to an error object which, upon encountering an error, will be set
 * @return Whether or not the encoding was successful
 */
-(BOOL)encodeBytes:(void *_Nonnull)buf bufSize:(size_t)bufSize msgSize:(size_t *_Nonnull)msgSize error:(NSError *_Nullable *_Nullable)error;

@end

#endif /* CatuiConnectResponse_h */
