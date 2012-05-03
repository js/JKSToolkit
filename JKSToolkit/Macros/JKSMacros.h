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
#end

#define JKSDegreesToRadians(deg) (deg * M_PI * 180.0f)
#define JKSRadiansToDegrees(rad) (rad * 180.0f / M_PI)
