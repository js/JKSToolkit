//
//  JKSPathUtilities.h
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/1/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKSPathUtilities : NSObject

/** Returns the application support path for this application based on its bundle identifier
 */
+ (NSString *)applicationSupportDirectoryPath;

/** Returns the Documents directory for the current user
 */
+ (NSString *)documentsDirectoryPath;

/** Returns the Cache directory for this application based on its bundle identifier
 */
+ (NSString *)applicationCachePath;

/** Returns a unique directory/filename in the tmp directory. File/Directory doesn't exist yet
 */
+ (NSString *)uniqueTemporaryFilename;

@end
