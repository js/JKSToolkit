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

/** Returns the first object that passes the block, or nil */
- (id)jks_objectPassingTest:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))predicate;

/** Returns a array composed of every N object in the receiver
 *
 * @param nth Number of objects to skip, eg. if array is 0..10 and nth is 5, object at index 0, 5 and 10 will be returned
 */
- (NSArray *)jks_selectEvery:(NSUInteger)nth;

/** Returns a new array containing the objects returned from each predicateBlock
 *
 * @note Returning nil from the predicateBlock to not include the object (meaning the returned array will be of 
 * different size than the original)
 */
- (NSArray *)jks_mapUsingBlock:(id (^)(id obj, NSUInteger idx, BOOL *stop))predicateBlock;

@end
