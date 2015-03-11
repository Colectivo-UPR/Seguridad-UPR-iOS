//
//  Constants.h
//  seguridad-upr
//
//  Created by Xiomara on 3/10/15.
//  Copyright (c) 2015 Colectivo-UPR. All rights reserved.
//

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

static inline BOOL isPad() {
    return UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad;
}

// ALog always displays output regardless of the DEBUG setting
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);


