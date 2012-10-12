//
//  JKSObserving.h
//  Frames
//
//  Created by Johan Sørensen on 10/11/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^JKSObservingHandlerBlock)(id observedObject, NSDictionary *change);

@interface JKSObserving : NSObject
@property (strong, readonly) NSString *keyPath;
@property (weak, readonly) id observable;

+ (JKSObserving *)observingWithObject:(id)object
                              keyPath:(NSString *)keyPath
                              options:(NSKeyValueObservingOptions)options
                              handler:(JKSObservingHandlerBlock)handlerBlock;
- (instancetype)initWithObject:(id)object
                       keyPath:(NSString *)keyPath
                       options:(NSKeyValueObservingOptions)options
                       handler:(JKSObservingHandlerBlock)handlerBlock;
@end


@interface NSObject (JKSObservingAdditions)
/** Adds an observer for the keyPath
 *
 * @discussion The caller is responsible for controlling the lifetime of the observing, eg. deallocate
 * the returned JKSObserving when the observing is no longer needed/wanted
 */
- (JKSObserving *)jks_observingForKeyPath:(NSString *)keyPath
                                  options:(NSKeyValueObservingOptions)options
                                  handler:(JKSObservingHandlerBlock)handlerBlock;
@end
