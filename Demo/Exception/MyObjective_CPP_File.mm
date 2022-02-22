//
//  MyObjective_CPP_File.m
//  Exception
//

#import "MyObjective_CPP_File.h"
#import "TestObject.h"

@implementation MyObjective_CPP_File

+ (void)test {
    NSLog(@"begin in objective-c++. -fobjc-arc-exceptions is enabled by default.");
    @try {
        TestObject *obj = [[TestObject alloc] init];
        @throw [NSException exceptionWithName:@"123" reason:nil userInfo:nil];
        //这里，这个obj对象内存可以被正常释放
    } @catch (NSException *exception) {
    }
    NSLog(@"end in objective-c++ \n");
}


@end
