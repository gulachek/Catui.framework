//
//  CatuiConnectResponse.m
//  Catui
//
//  Created by Nicholas Gulachek on 4/22/25.
//

#import <Catui/CatuiConnectResponse.h>
#include <vendor/include/catui.h>

@implementation CatuiConnectResponse

-(nonnull instancetype)initWithErrorMsg:(NSString*_Nullable)errMsg {
    self->_errorMsg = errMsg;
    return self;
}

-(BOOL)encodeBytes:(void *_Nonnull)buf bufSize:(size_t)bufSize msgSize:(size_t *_Nonnull)msgSize error:(NSError *_Nullable *_Nullable)error {
    if (!msgSize) {
        if (error) {
            *error = [NSError errorWithDomain:CatuiErrorDomain
                                       code:CatuiErrorCodeInvalidParam
                                   userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"msgSize was nil", @"")}];
        }
        return NO;
    }
    
    if (self->_errorMsg) {
        int16_t ret = catui_server_encode_nack(buf, bufSize, [self->_errorMsg cStringUsingEncoding:NSUTF8StringEncoding], nil);
        if (ret < 0) {
            if (error) {
            *error = [NSError errorWithDomain:CatuiErrorDomain
                                         code:CatuiErrorCodeFailure
                                     userInfo:@{NSLocalizedDescriptionKey: NSLocalizedString(@"Failed to encode message. This is likely because the encoded message is larger than the given buffer.", @"")}
            ];
            }
            return NO;
        }
        
        *msgSize = ret;
        return YES;
    } else {
        int16_t ret = catui_server_encode_ack(buf, bufSize, nil);
        if (ret < 0) {
            if (error) {
            *error = [NSError errorWithDomain:CatuiErrorDomain
                                         code:CatuiErrorCodeFailure
                                     userInfo:@{NSLocalizedDescriptionKey: NSLocalizedString(@"Failed to encode message. This is likely because the encoded message is larger than the given buffer.", @"")}
            ];
            }
            return NO;
        }
        
        *msgSize = ret;
        return YES;
    }
}

@end
