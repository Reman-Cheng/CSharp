//
//  main.m
//  1210_Test
//
//  Created by SWQT on 2019/12/10.
//  Copyright © 2019 remanroom. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface AndShell : NSObject
-(id) InvokingShellScriptAtPath :(NSString*) shellScriptPath;

@end
@implementation AndShell
-(id) InvokingShellScriptAtPath :(NSString*) shellScriptPath
{
    NSTask *shellTask = [[NSTask alloc]init];
    [shellTask setLaunchPath:@"/bin/sh"];
    NSString *shellStr = [NSString stringWithFormat:@"sh %@",shellScriptPath];
    NSLog(@">>>>>---------%@",shellStr);
    [shellTask setArguments:[NSArray arrayWithObjects:@"-c",shellStr, nil]];
    NSPipe *pipe = [[NSPipe alloc]init];
    [shellTask setStandardOutput:pipe];
    [shellTask launch];
    NSFileHandle *file = [pipe fileHandleForReading];
    NSData *data =[file readDataToEndOfFile];
    NSString *strReturnFromShell = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"The return content from shell script is: %@",strReturnFromShell);
    return strReturnFromShell;
    
}

@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
         NSLog(@"test");
       AndShell * andShell = [[AndShell alloc]init];
       [andShell InvokingShellScriptAtPath:@"/Users/swqt/Desktop/test.sh"];
       NSLog(@"test");
    }
    return 0;
}
