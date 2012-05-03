//
//  NSArray+JKSToolkit.h
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/1/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (JKSToolkit)

/** Returns the first object in the receiver, or nil if the array is empty
 */
- (id)jks_firstObject;

/** Returns an array matching elements returning true from the block
 *
 * @param predicate The block evaluating the obj with an index (idx). Set the stop point to halt further iteration
 * @returns Array of objects matching the predicate block
 */
- (NSArray *)jks_objectsPassingTest:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))predicate;

@end
