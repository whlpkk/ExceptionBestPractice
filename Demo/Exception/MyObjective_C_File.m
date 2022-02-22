//
//  MyObjective_C_File.m
//  Exception
//
//

#import "MyObjective_C_File.h"
#import "TestObject.h"

@implementation MyObjective_C_File

+ (void)test {
    NSLog(@"begin in objective-c. -fobjc-arc-exceptions is disabled by default.");
    @try {
        TestObject *obj = [[TestObject alloc] init];
        @throw [NSException exceptionWithName:@"123" reason:nil userInfo:nil];
        //这里，这个obj对象内存泄漏
    } @catch (NSException *exception) {
        
    }
    NSLog(@"end in objective-c");
}

@end
