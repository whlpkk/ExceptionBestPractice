//
//  OC_Lock_Best.h
//  Exception
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OC_Lock_Best : NSObject

+ (void)lockTest;
+ (void)deadlockTest;

@end

NS_ASSUME_NONNULL_END
