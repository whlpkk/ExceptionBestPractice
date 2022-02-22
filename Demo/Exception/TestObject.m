//
//  TestObject.m
//  Exception
//
//

#import "TestObject.h"
#include <pthread.h>

@interface TestObject ()
@property (nonatomic, assign) pthread_mutex_t mutex_lock;
@end

@implementation TestObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        pthread_mutex_init(&_mutex_lock, NULL);
    }
    return self;
}

- (void)dealloc {
    NSLog(@"dealloc TestObject : %@", self);
    pthread_mutex_destroy(&_mutex_lock);
}

- (void)lock {
    pthread_mutex_lock(&_mutex_lock);
}

- (void)unlock {
    pthread_mutex_unlock(&_mutex_lock);
}

@end
