//
//  CatuiConnectRequest.m
//  Catui
//
//  Created by Nicholas Gulachek on 4/1/25.
//

#import <Catui/CatuiConnectRequest.h>

@implementation CatuiConnectRequest

-(nonnull instancetype)initWithProtocol:(NSString*_Nonnull)proto version:(CatuiSemver*_Nonnull)protoVersion catuiVersion:(CatuiSemver*_Nonnull)catuiVersion {
    self->_protocol = proto;
    self->_version = protoVersion;
    self->_catuiVersion = catuiVersion;
    return self;
}

@end
