//
//  main.m
//  1120_lianxi
//
//  Created by SWQT on 2019/11/20.
//  Copyright © 2019 remanroom. All rights reserved.
//
#define True 1
#define False 0
#import "Fraction.h"
int gGlobalVal = 5;
@implementation Fraction
@synthesize numerator,denominator,fra11 = _fra11;
-(void) print{
    NSLog(@"%i/%i",numerator,denominator);
}
-(double)convertToNum{
    if(denominator != 0){
        return (double) numerator/denominator;
    }else{
        return NAN;
    }
}
-(void)add:(Fraction *)f{
    numerator = numerator * f.denominator + denominator*f.numerator;
    denominator = denominator * f.denominator;
}
-(void) setgGlobalVal:(int)val{
//    extern int gGlobalVal;  //如果其他文件要访问这个变量就要把这个变量设置为外部变量
    gGlobalVal = val;
}
@end
@implementation Fraction(Comparison)
-(BOOL) isEqualTo:(Fraction *)f{
    return TRUE;
}
-(int) compare:(Fraction *)f{
    return 1;
}
@end

@implementation Fraction1
{
    int numerator;
    int denominator;
}
//@synthesize numerator,denominator;
-(void) print{
    NSLog(@"%i/%i",numerator,denominator);
}
-(double)convertToNum{
    if(denominator != 0){
        return (double) numerator/denominator;
    }else{
        return NAN;
    }
}
-(void)add:(Fraction *)f{
    numerator = numerator * f.denominator + denominator*f.numerator;
    denominator = denominator * f.denominator;
}
@end


@implementation ClassA
@synthesize x;
-(void)initVar{
    x=100;
}
@end


@implementation ClassB:ClassA
-(void)printVar{
    NSLog(@"the x is:%i",self.x);
    //取值方法时继承父类的可以访问父类中的实例变量self.x 与[self x](这个是父类方法)相同
}
@end


@implementation NSSet(printing)
-(void)print{
    printf("{");
    for (NSNumber *element in self){
        printf(" %li ",(long)[element integerValue]);
    }
    printf("}\n");
}

@end

@implementation Test
-(void)print{
    NSLog(@"the function return is: %i",self.num);
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int sum;
        sum = 25 + 37 - 19;
        float float1 = -.001;
        float fsum2 = 2.2;
        NSLog(@"the sum is: %f",float1);
        NSLog(@"sum: %i / fsum2: %f, the value is: %f",sum,fsum2,sum/fsum2);
        NSLog(@"sum: %i / fsum2: %f, the value is: %i",sum,fsum2,sum/(int)fsum2);
        
        Fraction1 *fractionf1 = [[Fraction1 alloc]init];
//        fractionf1.numerator = 2;//如果没有设置和取值方法是无法点出来的，
//        //fractionf1.numerator与[fractionf1 numerator]相同只是形式不一样而已
//        NSLog(@"the fractionf1.numerator value is:%i",fractionf1.numerator);
        
        Fraction *fraction1 = [[Fraction alloc]init];
        Fraction *fraction2 = [[Fraction alloc]init];
        [fraction1 setNumerator:1];
        //这种模式下会自动为numerator和denominator生成设置方法setNumerator setDenominator
        //和取值方法numerator denominator
        [fraction1 setDenominator:3];
        NSLog(@"the numerator is: %i",fraction1.numerator);
        fraction1.numerator = 2;
        NSLog(@"numerator: %i,denominator: %i",[fraction1 numerator],[fraction1 denominator]);
        [fraction1 print];
        fraction2.numerator = 3;
        fraction2.denominator = 4;
        [fraction1 add:fraction2];
        [fraction1 print];
        
//        ClassA *classa = [[ClassA alloc]init];
        ClassB *classb = [[ClassB alloc]init];
        [classb initVar];
        [classb printVar];
        NSLog(@"%@  %hhd",[classb class],[ClassB instancesRespondToSelector:@selector(printVar)]);
        SEL action;
        action = @selector(printVar);
        if([classb respondsToSelector: action] == YES){
            [classb performSelector: action];
        }
        @try{
            [fraction1 noSuchMethod];
        }
        @catch(NSException *exception){
            NSLog(@"Caught %@%@",[exception name],[exception reason]);
        }
//    initWithArray:
//    initWithArray:copyItems:
//    initWithContentsOfFile:
//    initWihtContentsOfURL:
//    initWithObjects:
//    initWithObjects:count:
        NSLog(@"the value of gGlobalVal is: %i",gGlobalVal);
        [fraction1 setgGlobalVal:100];
        NSLog(@"the value of gGlobalVal is: %i",gGlobalVal);
        NSLog(@"the value is: %hhd",[fraction1 isEqualTo:fraction1]);
        NSLog(@"the value is: %i",[fraction1 compare:fraction1]);
        if([fraction1 conformsToProtocol:@protocol(NSCopying)] == YES){
            NSLog(@"the fraction1 is conformsto NSCopying");
        }
        NSLog(@"%i",True);
        NSLog(@"%i",False);
        NSLog(@"%@",fraction1);
        
        //removeObjectIdenticalTo
        
        NSLog(@"------====---------");
        NSMutableSet *set1 = [NSMutableSet setWithObjects:INTOBJ(1),INTOBJ(3),INTOBJ(5),INTOBJ(10), nil];
        NSMutableSet *set2 = [NSMutableSet setWithObjects:INTOBJ(-5),INTOBJ(100),INTOBJ(3),INTOBJ(5), nil];
        NSMutableSet *set3 = [NSMutableSet setWithObjects:INTOBJ(12),INTOBJ(200),INTOBJ(5),INTOBJ(10), nil];
        NSCountedSet *countSet1 = [NSCountedSet setWithObjects:INTOBJ(12),INTOBJ(200),INTOBJ(5),INTOBJ(12), nil];
        [set1 print];
        [set2 print];
        if([set1 containsObject:INTOBJ(10)] == YES){
            NSLog(@"set1 contains 10");
        }
        [set3 addObject:INTOBJ(4)];
        [set3 print];
        
        [set1 intersectSet:set2];//交集
        [set1 print];
        
        [set2 unionSet:set3];//并集
        [set2 print];
        
        //NSSet  NSMutableSet  NSIndexSet  NSCountedSet
        NSLog(@"------==NSCountedSet==---------");//可做单词计数器
        NSLog(@"%lu",[countSet1 countForObject:INTOBJ(12)]);
        
        //NSIndexSet 没看
        NSFileManager *fm1 = [NSFileManager defaultManager];
        NSData *data1 =[fm1 contentsAtPath:@"/Users/swqt/Desktop/ObjC-Test/Scorpius_failures.csv"];
        NSLog(@"%@",data1);//编码方式不一样
//        NSLog(@"%@",[NSString stringWithContentsOfFile:@"/Users/swqt/Desktop/ObjC-Test/Scorpius_failures.csv" encoding:NSUTF8StringEncoding error:NULL]);
        if([fm1 createFileAtPath:@"/Users/swqt/Desktop/ObjC-Test/Scorpius_failures2.csv" contents:data1 attributes:nil] == NO){
            NSLog(@"couldn't create the copy");
        }
        //目录
        NSLog(@"%@",[fm1 currentDirectoryPath]);
        [fm1 changeCurrentDirectoryPath:@"/Users/swqt/Desktop/ObjC-Test"];//更改当前工作路径为“”
        NSLog(@"%@",[fm1 currentDirectoryPath]);
        
        //枚举目录
        NSString *path1;
        NSDirectoryEnumerator *dirEnum = [fm1 enumeratorAtPath:@"/Users/swqt/Desktop/ObjC-Test"];
        while((path1 = [dirEnum nextObject]) != nil){
            NSLog(@"%@",path1);
        }
        
        NSArray *dirArray1 = [fm1 contentsOfDirectoryAtPath:[fm1 currentDirectoryPath] error:NULL];
        for(path1 in dirArray1){
            NSLog(@"%@",path1);
        }
        
        NSLog(@"my home directory is %@",NSHomeDirectory());//用户主目录
        NSLog(@"the load name is %@",NSUserName());
        NSLog(@"the full load name is %@",NSFullUserName());
        //拆分
        for(path1 in [NSHomeDirectory() pathComponents]){
            NSLog(@"%@",path1);
        }
        
        NSProcessInfo *proc1 = [NSProcessInfo processInfo];//当前进程信息
        NSLog(@"%@",proc1);
        NSArray *args1 = [proc1 arguments];//当前进程参数
        NSLog(@"%@",args1);
        NSLog(@"%lu",[args1 count]);
        NSLog(@"%@",[args1 objectAtIndex:0]);
        
//        NSURL *myURL = [NSURL URLWithString:@"http://classroomM.com"];
//        NSString *myHomePage = [NSString stringWithContentsOfURL:myURL encoding:NSASCIIStringEncoding error:NULL];
//        NSLog(@"%@",myHomePage);
        
        NSLog(@"----====++++====----");
        NSLog(@"%i/%i",fraction1.numerator,fraction1.denominator);
        NSLog(@"%i/%i",fraction2.numerator,fraction2.denominator);
//        fraction1 = [fraction2 mutableCopy];
        NSLog(@"%i/%i",fraction1.numerator,fraction1.denominator);
        NSLog(@"%i/%i",fraction2.numerator,fraction2.denominator);
        
        //dictionaryWithContentsOfFile
        //arrayWithContentsOfFile
        //stringWithContentsOfFile
        //dataWithContentsOfFile
        
        NSLog(@"date: %@",[NSDate date]);
        NSLog(@"datesincenow: %@",[NSDate dateWithTimeIntervalSinceNow:0]);
        NSLog(@"datesincedate: %@",[NSDate dateWithTimeInterval:100 sinceDate:[NSDate date]]);
        NSLog(@"datereference: %@",[NSDate dateWithTimeIntervalSinceReferenceDate:10]);
        NSLog(@"datesince1970: %@",[NSDate dateWithTimeIntervalSince1970:2]);
        
        NSDate *date1 = [NSDate date];
        NSLog(@"the init date is: %@",[date1 init]);
        NSLog(@"datesincenow: %@",[date1 initWithTimeIntervalSinceNow:0]);
        NSLog(@"datesincedate: %@",[date1 initWithTimeInterval:100 sinceDate:[NSDate date]]);
        NSLog(@"datereference: %@",[date1 initWithTimeIntervalSinceReferenceDate:10]);
        NSLog(@"datesince1970: %@",[date1 initWithTimeIntervalSince1970:2]);
        
        NSDateFormatter *formatter1 = [[NSDateFormatter alloc]init];
        [formatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//先要知道时间格式
        NSString *dateString = @"2019-11-25 14:47:57";//解析这个格式的时间
        NSLog(@"the datefromstring is: %@",[formatter1 dateFromString:dateString]);
        [formatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSLog(@"the formatter date is: %@",[formatter1 stringFromDate:date1]);
        
        NSLog(@"the fra11 is:%i",fraction1.fra11);
//        NSLog(@"the _fra11 is:%i",fraction1._fra11);//没有设置和取值方法
        
        Test *test1 = [[Test alloc]init];
        test1.num = 33;
        [test1 print];
        
        
    }
    return 0;
}
