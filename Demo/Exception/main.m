//
//  main.m
//  Exception
//

#import <Foundation/Foundation.h>
#import "MyObjective_C_File.h"
#import "MyObjective_CPP_File.h"
#import "OC_Lock_Best.h"

int main(int argc, const char * argv[]) {
    [MyObjective_C_File test];
    [MyObjective_CPP_File test];
    
    NSLog(@"\n--------------------------------------------------------------\n");
    [OC_Lock_Best lockTest];
//    [OC_Lock_Best deadlockTest];
    
    sleep(5);
    return 0;
}


