//
//  OC_Lock_Best.m
//  Exception
//
//

#import "OC_Lock_Best.h"
#import "TestObject.h"

void TestObjectCleanUp(__strong TestObject **obj) {
    [*obj unlock];
    NSLog(@"lockTest:已经解锁");
}

@implementation OC_Lock_Best

+ (void)lockTest {
    
    TestObject *obj __attribute__((cleanup(TestObjectCleanUp))) = [TestObject new];
    @try {
        [obj lock];
        NSLog(@"lockTest:已经上锁");
        @throw [NSException exceptionWithName:@"123" reason:nil userInfo:nil];
    } @catch (NSException *exception) {
        
    } @finally {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [obj lock];
            NSLog(@"lockTest:已经上锁");
            [obj unlock];
            NSLog(@"lockTest:已经解锁");
        });
    }
}

+ (void)deadlockTest {
    //与上面的对比，少了  __attribute__((cleanup(TestObjectCleanUp)))，其他都一样
    TestObject *obj = [TestObject new];
    @try {
        [obj lock];
        NSLog(@"deadlockTest:已经上锁");
        @throw [NSException exceptionWithName:@"123" reason:nil userInfo:nil];
    } @catch (NSException *exception) {
    } @finally {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            // 这里陷入死锁，下面的log永远不会输出
            [obj lock];
            NSLog(@"lockTest:已经上锁");
            [obj unlock];
            NSLog(@"lockTest:已经解锁");
        });
    }
}

@end
