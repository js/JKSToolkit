//
//  JKSMacros.h
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/3/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#ifdef DEBUG
#define LOG(...) NSLog(__VA_ARGS__)
#define DLOG(fmt, ...) NSLog((@"(%s line:%i) " fmt), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__)
#else
#define LOG(args...) while(0){}
#define DLOG(args...) while(0){}
#endif

#define JKSDegreesToRadians(deg) ((deg * M_PI) / 180.0f)
#define JKSRadiansToDegrees(rad) ((rad * 180.0f) / M_PI)

#define UICOLOR(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define NSCOLOR(r, g, b, a) [NSColor colorWithCalibratedRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define NSDEVICECOLOR(r, g, b, a) [NSColor colorWithDeviceRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
