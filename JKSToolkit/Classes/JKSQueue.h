//
//  JKSQueue.h
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/4/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A simple implementation of a queue
 */
@interface JKSQueue : NSObject

/** Initializes a new empty JKSQueue object
 */
- (instancetype)init;

/** Initializes a new JKSQueue object with the contents of the array
 * The order of the supplied array is maintained in the returned JKSQueue
 *
 * @param array The array whose contents should be added to the queue
 */
- (instancetype)initWithContentsOfArray:(NSArray *)array;


/** @section Enqueing and dequeing */

/** Enqueues a new object on the receivers queue
 *
 * @param object The object to add to the queue. Cannot be nil.
 */
- (void)enqueue:(id)object;

/** Dequeues an object from the queue
 * The first object in the queue is removed from the queue and returned to the caller
 *
 * @returns The object that was dequeued
 */
- (id)dequeue;

/** Removes all enqueued objects from the queue
 */
- (void)removeAllEnquedObjects;
 

/** @section Inspecting the queue */

/** Returns the number of objects enqueued on the receiver */
- (NSUInteger)count;

/** "Peeks" at the top object in the queue, returning it without removing it
 *
 * @returns The top object in the queue
 */
- (id)peek;

/** Checks whether an object is enqueued or not
 *
 * @returns YES of the object is enqueued on the receiver, NO otherwise
 */
- (BOOL)containsObject:(id)object;

@end
