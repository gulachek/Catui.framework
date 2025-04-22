//
//  CatuiConnectResponse.m
//  Catui
//
//  Created by Nicholas Gulachek on 4/22/25.
//

#import <Catui/CatuiConnectResponse.h>

@implementation CatuiConnectResponse

-(nonnull instancetype)initWithErrorMsg:(NSString*_Nullable)errMsg {
    self->_errorMsg = errMsg;
    return self;
}

@end
