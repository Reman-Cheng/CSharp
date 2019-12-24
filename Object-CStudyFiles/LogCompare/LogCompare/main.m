//
//  main.m
//  LogCompare
//
//  Created by SWQT on 2019/12/4.
//  Copyright © 2019 remanroom. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        NSFileManager *fm1 = [[NSFileManager alloc]init];
        NSData *datareadfromcsv = [fm1 contentsAtPath:@"/Users/swqt/Desktop/myTestFile/ARUBA_TP0v5-ENG_RTOS_ONLY_MEMDOE2.csv"];
        NSString *strread1 = [NSString stringWithContentsOfFile:@"/Users/swqt/Desktop/myTestFile/J307 SOC Test Plan V01.numbers" encoding:NSUTF8StringEncoding error:NULL];
        NSLog(@"%@",strread1);
        NSRegularExpression *regularexp = [NSRegularExpression regularExpressionWithPattern:@"\n" options:nil error:nil];
        
        
    }
    return 0;
}
