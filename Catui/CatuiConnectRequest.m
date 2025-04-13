//
//  CatuiConnectRequest.m
//  Catui
//
//  Created by Nicholas Gulachek on 4/1/25.
//

#import <Catui/CatuiConnectRequest.h>
#include <vendor/include/catui.h>

@implementation CatuiConnectRequest

-(nonnull instancetype)initWithProtocol:(NSString*_Nonnull)proto version:(CatuiSemver*_Nonnull)protoVersion catuiVersion:(CatuiSemver*_Nonnull)catuiVersion {
    self->_protocol = proto;
    self->_version = protoVersion;
    self->_catuiVersion = catuiVersion;
    return self;
}

-(nullable instancetype)initWithBytes:(const void*)bytes length:(size_t)length error:(NSError *_Nullable *_Nullable)error {
    catui_connect_request req;
    if (!catui_decode_connect(bytes, length, &req)) {
        if (error != nil) {
            *error = [NSError errorWithDomain:CatuiErrorDomain
                                         code:CatuiErrorCodeInvalidConnectRequestString
                                     userInfo:@{NSLocalizedDescriptionKey: NSLocalizedString(@"Invalid connect request string", @"")}
            ];
        }
        return nil;
    }
    
    self->_protocol = [NSString stringWithCString:req.protocol encoding:NSUTF8StringEncoding];
    self->_version = [[CatuiSemver alloc]
                      initWithMajor:req.version.major
                      minor:req.version.minor
                      patch:req.version.patch
    ];
    self->_catuiVersion = [[CatuiSemver alloc] 
                           initWithMajor:req.catui_version.major
                           minor:req.catui_version.minor
                           patch:req.catui_version.patch
    ];
    return self;
}

@end
