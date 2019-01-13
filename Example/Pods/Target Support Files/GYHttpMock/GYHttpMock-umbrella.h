#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "GYHttpMock.h"
#import "GYMatcher.h"
#import "NSString+mock.h"
#import "NSURLRequest+GYURLRequestProtocol.h"
#import "GYHttpClientHook.h"
#import "GYNSURLSessionHook.h"
#import "GYMockRequest.h"
#import "GYMockRequestDSL.h"
#import "GYMockResponse.h"
#import "GYMockResponseDSL.h"

FOUNDATION_EXPORT double GYHttpMockVersionNumber;
FOUNDATION_EXPORT const unsigned char GYHttpMockVersionString[];

