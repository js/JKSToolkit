//
//  JKSObserving.m
//  Frames
//
//  Created by Johan Sørensen on 10/11/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import "NSObject+JKSObserving.h"
#import <objc/runtime.h>

static void *JKSObservingKVOContext = &JKSObservingKVOContext;

@interface JKSObserving ()
@property (copy) JKSObservingHandlerBlock handler;
@end

@implementation JKSObserving
+ (JKSObserving *)observingWithObject:(id)object
                              keyPath:(NSString *)keyPath
                              options:(NSKeyValueObservingOptions)options
                              handler:(JKSObservingHandlerBlock)handlerBlock
{
    return [[JKSObserving alloc] initWithObject:object keyPath:keyPath options:options handler:handlerBlock];
}


- (instancetype)initWithObject:(id)object keyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options handler:(JKSObservingHandlerBlock)handlerBlock
{
    NSParameterAssert(keyPath);
    NSParameterAssert(handlerBlock);

    if ((self = [super init])) {
        _keyPath = keyPath;
        _handler = [handlerBlock copy];
        _observable = object;
        [object addObserver:self forKeyPath:keyPath options:options context:JKSObservingKVOContext];
    }
    return self;
}


- (void)dealloc
{
    [_observable removeObserver:self forKeyPath:_keyPath context:JKSObservingKVOContext];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == JKSObservingKVOContext) {
        self.handler(self.observable, change);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end


//NSString *const kAssociatedObservingsKey = @"kAssociatedObservingsKey";
@implementation NSObject (JKSObservingAdditions)
- (JKSObserving *)jks_observingForKeyPath:(NSString *)keyPath
                                  options:(NSKeyValueObservingOptions)options
                                  handler:(JKSObservingHandlerBlock)handlerBlock
{
    JKSObserving *observing = [JKSObserving observingWithObject:self keyPath:keyPath options:options handler:handlerBlock];
    return observing;
}


//- (void)jks_observeKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options handler:(JKSObservingHandlerBlock)handlerBlock
//{
//    // TODO: raise if already added?
//    JKSObserving *observer = [JKSObserving observingWithObject:self keyPath:keyPath options:options handler:handlerBlock];
//    [[self jks_observings] addObject:observer];
//}
//
//// Big issue: associated objects area cleared after normal dealloc as part of object_dispose() (see WWDC 2011 session 322 (around 37:35))
//// Which means -[JKSObserving dealloc] is called too late and the KVO machinery spews a warning to the console
//- (NSMutableSet *)jks_observings
//{
//    NSMutableSet *observings = objc_getAssociatedObject(self, &kAssociatedObservingsKey);
//
//    if (!observings) {
//        observings = [[NSMutableSet alloc] init];
//        objc_setAssociatedObject(self, &kAssociatedObservingsKey, observings, OBJC_ASSOCIATION_RETAIN);
//    }
//
//    return observings;
//}
@end
