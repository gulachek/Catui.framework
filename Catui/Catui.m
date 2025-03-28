//
//  Catui.m
//  Catui
//
//  Created by Nicholas Gulachek on 3/27/25.
//

#import <Foundation/Foundation.h>
#import <Catui/Catui.h>

// Need vendor/include to disambiguate from Catui/Catui.h
#include <vendor/include/catui.h>

int CatuiFoo(void) {
    return catui_connect("com.example.foo", "1.2.3", NULL);
}
