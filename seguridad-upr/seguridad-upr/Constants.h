//
//  constants.h
//  seguridad-upr
//
//  Created by Xiomara on 3/3/15.
//  Copyright (c) 2015 Colectivo-UPR. All rights reserved.
//



#ifdef UPRRP_SEG
#define UPRRPHost @"http://36.145.181.112:8080"
#endif

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

static inline BOOL IsEmpty(id thing) {
    return thing == nil
    || thing == [NSNull null]
    || ([thing respondsToSelector:@selector(length)]
        && [thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [thing count] == 0);
}