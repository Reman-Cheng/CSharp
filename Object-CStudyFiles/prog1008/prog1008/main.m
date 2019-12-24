//
//  main.m
//  prog1008
//
//  Created by SWQT on 2019/10/8.
//  Copyright © 2019 remanroom. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "Fraction.h"
#define PI 3.14
//@interface RemanFun:NSObject
//-(void) print;
//-(int) setNumerator1;
//-(int) setDeniminator1;
//-(void) setNumerator:(int) n;
//-(void) setDenominator:(int) d;
//@end
//
//@implementation RemanFun{
//    int numerator;
//    int denominator;
//}
//-(void) print{
//    NSLog(@"%i/%i",numerator,denominator);
//}
//-(int) setNumerator1{
//    numerator = 2;
//    return numerator;
//}
//-(int) setDeniminator1{
//    denominator = 2;
//    return denominator;
//}
//-(void) setNumerator:(int)n{
//    numerator = n;
//}
//-(void) setDenominator:(int)d{
//    denominator = d;
//}
//@end

////@interface Calculator:NSObject
////-(void) setAccumulator:(double) value;
////-(void) clear;
////-(double) getaccumlator;
////
////-(void) add:(double) value;
////-(void) subtract:(double) value;
////-(void) multiply:(double) value;
////-(void) divide:(double) value;
////@end
//

//@implementation Calculator{
//    double accumulator;
//}
//-(void) setAccumulator:(double)value{
//    accumulator = value;
//}
//-(double) getaccumlator{
//    return accumulator;
//}
//-(void) clear{
//    accumulator = 0;
//}
//-(void)add:(double)value{
//    accumulator = accumulator + value;
//}
//-(void)subtract:(double)value{
//    accumulator = accumulator - value;
//}
//-(void)multiply:(double)value{
//    accumulator = accumulator * value;
//}
//-(void)divide:(double)value{
//    if(value != 0 && value != NAN){
//    accumulator = accumulator / value;
//    }else{
//        NSLog(@"the value is 0");
//    }
//}
//@end


@implementation Fraction
@synthesize num,denum;
-(void)print{
    NSLog(@"%i/%f",num,denum);
}
-(double)divide{
    return num/denum;
}
-(void)setTo:(int)n over:(int) d{
    self.num = n;
    self.denum = d;
}
-(void)set: (int)n : (double)d{
    num = n;
    denum = d;
}
-(void)add:(Fraction *)f{
    num = f.num + num;
    denum = denum + f.denum;
    [self print];//当前方法的调用者
}
-(Fraction *)add1:(Fraction *) d{
    Fraction *result = [[Fraction alloc]init];
    result.num = num + d.num;
    result.denum = denum + d.denum;
    [result print];
    return result;
}
@end
@implementation Fraction (MathOps)
-(Fraction *) add2:(Fraction *) f{
    Fraction *result = [[Fraction alloc]init];
    result.num = num + f.num;
    result.denum = denum + f.denum;
    return result;
}
-(Fraction *) sub:(Fraction *) f{
    Fraction *result = [[Fraction alloc]init];
    result.num = num - f.num;
    result.denum = denum - f.denum;
    return result;
}
-(Fraction *) mul:(Fraction *) f{
    Fraction *result = [[Fraction alloc]init];
    result.num = num * f.num;
    result.denum = denum * f.denum;
    return result;
}
-(Fraction *) div:(Fraction *) f{
    Fraction *result = [[Fraction alloc]init];
    result.num = num / f.num;
    result.denum = denum / f.denum;
    return result;
}
@end


@implementation XYPoint
@synthesize X,Y;
-(void)setX:(int)a setY: (int) b{
    X = a;
    Y = b;
}
@end

@implementation Rectangle
@synthesize width,height;
-(double) area{
    return width * height;
}
-(int) per{
    return 2*width + 2*height;
}
-(void)setWidth:(int)a setHeight: (int) b{
    width = a;
    height = b;
}
-(XYPoint *)setOrigin:(XYPoint *)pt{
    return pt;
}
@end

@implementation Square
@synthesize side;
-(int) area{
    return side * side;
}
-(int) squarearea{
    return side * side;
}
-(int) squareper{
    return 2*side + 2*side;
}
-(void)setside:(int)a{
    side = a;
}
@end

static int gGlobalVar1 = 15;
@implementation Complex
@synthesize real,imaginary;
-(void) print{
    NSLog(@"%f + %f i",real,imaginary);
}
-(void) setReal:(double)a setImaginary:(double)b{
    extern int gGlobalVar;
    real = gGlobalVar;
    imaginary = b;
}
-(Complex *)add: (Complex *)f{
    Complex *result = [[Complex alloc]init];
    result.real = real + f.real;
    result.imaginary = imaginary + f.imaginary;
    return result;
}
@end

@implementation AddressCard
@synthesize name,email,_citynum;
-(void)print{
    NSLog(@"============================");
    NSLog(@"|                          |");
    NSLog(@"| %-31s |",[name UTF8String]);
    NSLog(@"| %-31s |",[email UTF8String]);
    NSLog(@"|                          |");
    NSLog(@"============================");
}
-(void)setName:(NSString *)name setEmail:(NSString *)email{
    self.name = name;
    self.email = email;
}
@end

@implementation AddressBook
@synthesize name,email;
-(void)print{
    NSLog(@"============================");
    NSLog(@"|                          |");
    NSLog(@"| %-31s |",[name UTF8String]);
    NSLog(@"| %-31s |",[email UTF8String]);
    NSLog(@"|                          |");
    NSLog(@"============================");
}
-(void)setName:(NSString *)name setEmail:(NSString *)email{
    self.name = name;
    self.email = email;
}
-(void)AddAdress:(NSString *)str{
    self.name = str;
}
@end

int gGlobalVar = 5;
enum day{
    one,two,three,four,five,six,seven
};
int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        NSLog(@"\nProgramming is fun!\nAnd programming in Objective-C is even more fun!");
//        int a = 10;
//        int b = 20;
//        NSLog(@"\n%d + %d := %d",a,b,a+b);
//
//        RemanFun *reman = [[RemanFun alloc]init];
//
//        [reman setNumerator:1];
////        [reman setNumerator1];
//        [reman setDenominator:4];
//        NSLog(@"\nThe value of reman is:");
//        NSLog(@"\nThe value of reman is:%i",[reman setNumerator1]);
//        NSLog(@"a %% b = %i",25%2);
//        [reman print];
        
//        Calculator *cal = [[Calculator alloc]init];
////        [cal setAccumulator:1.2];
////        [cal add:1.3];
//        cal.accumulator = 3;
//        NSLog(@"the accumlator is %f",cal.getaccumlator);
        
//        int target,number;
//        target = 0;
//        NSLog(@"what target number do you want");
//        scanf("%i",&number);//c风格不用加@
//        for(int n=1;n<=number;n++){
//            if(n>5){
//                NSLog(@"n>5 :%i",n);
//            }
//            target += n;
//        }
//        NSLog(@"the target is %6i",target);
        NSLog(@"the gGlobalVar is %i",gGlobalVar);
        NSLog(@"the gGlobalVar1 is %i",gGlobalVar1);
        enum day day1=two;
//        day1 = one;
        NSLog(@"the day is %i",day1);
        
        Fraction *fra1 = [[Fraction alloc]init];
        Fraction *fra2 = [[Fraction alloc]init];
        Fraction *fra3 = [[Fraction alloc]init];
//        fra.num = 1;
//        fra.denum = 2;
        [fra1 setTo:100 over: 200];
        [fra2 set:12:30];
        [fra1 add:fra2];
        [fra1 print];
        
        fra3 = [fra1 add1:fra2];
        [fra3 print];
        NSLog(@"----------------1-----------------");
        fra3 = [fra3 add2:fra2];
        [fra3 print];
        
        Rectangle *rec1 = [[Rectangle alloc]init];
//        rec1.width = 2;
//        rec1.height = 3;
        [rec1 setWidth:2 setHeight: 3];
        double recarea = [rec1 area];
        int perarea = [rec1 per];
        NSLog(@"recarea is: %f,perarea is: %i",recarea,perarea);
        
        Square *square1 = [[Square alloc]init];
        [square1 setside:3];
        NSLog(@"the earea is: %i",[square1 area]);
        NSLog(@"square1area is: %i,square1per is: %i",[square1 squarearea],[square1 squareper]);
        
        XYPoint *xypoint1 = [[XYPoint alloc]init];
        [xypoint1 setX:5 setY:6];
        XYPoint *xypoint2 = [rec1 setOrigin:xypoint1];
        NSLog(@"the x is: %i,the y is: %i",xypoint2.X,xypoint2.Y);
        
        Complex *complex1 = [[Complex alloc]init];
        Complex *complex2 = [[Complex alloc]init];
        [complex1 setReal:1.1 setImaginary:2.2];
        [complex2 setReal:3.3 setImaginary:4.4];
        complex1 = [complex1 add:complex2];
        id datavalue;
        datavalue = complex1;
        NSLog(@"%f + %fi",complex1.real,complex1.imaginary);
        [datavalue print];
//        NSLog(@"%f + %fi",datavalue.real,datavalue.imaginary);
        id datavalue1;
        datavalue1 = [[Complex alloc]init];
        [datavalue1 setReal:5.5 setImaginary:6.6];
        [datavalue1 print];
        
        BOOL isOrNot = [complex1 isKindOfClass:[Complex class]];
        if(isOrNot == YES){
            NSLog(@"the isOrNot is true");
        }
        
//        @try{
//            [datavalue1 noSuchMethod];
//        }
//        @catch(NSException *exception){
//            NSLog(@"Caught %@%@",[exception name],[exception reason]);
//        }
        NSLog(@"----------------2-----------------");
        NSLog(@"%f",PI);
        
        NSNumber *intbnumber1 = [NSNumber numberWithInt:100];
        NSLog(@"the intnumber1 is:%i",[intbnumber1 intValue]);
        
        NSNumber *doubnumber1 = [NSNumber numberWithDouble:100.12];
        NSLog(@"the doubnumber1 is:%f",[doubnumber1 doubleValue]);
        
        NSNumber *integernumber1 = [NSNumber numberWithInteger:100];
        //整型用long
        NSLog(@"the integernumber1 is:%li",[integernumber1 integerValue]);
        NSLog(@"the integernumber1 is:%@",integernumber1);//%@ 几乎可以显示除number的类型,主要是对象
        
        if([intbnumber1 isEqualToNumber:integernumber1]){
            NSLog(@"the intnumber1 is equal integernumber1");
        }
        
        NSString *string1 = @"programming is fun";
        NSLog(@"%@",string1);
        
        
        NSString *str1 = @"This is string A";
        NSString *str2 = @"This is string B";
        NSString *res1;
        
        NSLog(@"Length of str1:%lu",[str1 length]);
        
        res1 = [NSString stringWithString:str1];
        NSLog(@"copy: %@",res1);
        
        if([str1 isEqualToString: res1]){
            NSLog(@"the str1 is equal res1");
        }
        
        res1 = [str1 uppercaseString];//返回值是对象
        NSLog(@"Uppercase conversion: %@",res1);
        NSLog(@"Uppercase conversion: %s",[res1 UTF8String]);//返回值是string
        
        str2 = res1;
        NSLog(@"%@",str2);
        
        NSArray *monthNames = [NSArray arrayWithObjects:@"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December",nil];
        for(int i=0;i<12;i++){
            NSLog(@"%2i   %@",i+1,[monthNames objectAtIndex:i]);
        }
        
        //不能将整数这样基本类型存储在数组中，要转成对象
        NSMutableArray *mutablearr = [NSMutableArray array];
        NSNumber *numberarr;
//        NSNumber *numarr1 = [[NSNumber alloc]init];
        for(int i=0;i<10;i++){
            numberarr = [NSNumber numberWithInt:i];
            [mutablearr addObject:numberarr];
        }
        
        NSString *aname = @"reman cheng";
        NSString *email = @"www@163.com";
        
        AddressCard *address1 = [[AddressCard alloc]init];
        [address1 setName:aname setEmail:email];
        [address1 print];
        
        
        for(int i=0;i<10;i++){
            NSLog(@"%@",[mutablearr objectAtIndex:i]);
        }
        NSLog(@"============NSNumber===========");
        for(NSNumber *numarr1 in mutablearr){
            NSLog(@"%@",numarr1);
        }
        
//        citynum = 100;
//        NSLog(@"%i",citynum);
        
        
        NSLog(@"============AdressBook===========");
        AddressBook *addressbook1 = [[AddressBook alloc]init];
        [addressbook1 setName:@"reman_cheng" setEmail:@"123@126.com"];
        [addressbook1 print];
        
        [addressbook1 AddAdress:@"remanCheng"];
        [addressbook1 print];
        
        NSMutableArray *bookArray = [NSMutableArray array];
        [bookArray addObject:@"reman1"];
        [bookArray addObject:@"reman2"];
        [bookArray addObject:@"reman3"];
        for(NSString *dd in bookArray){
            NSLog(@"--%@",dd);
        }
        //查看这个对象是不是遵循这个NSAdd1协议
        if([addressbook1 conformsToProtocol:@protocol(NSAdd1)] == YES){
            NSLog(@"the addressbook conformsToProtocol addadress");
        }
        NSLog(@"%@",[addressbook1 class]);
        NSLog(@"%@",[addressbook1 superclass]);
        if([str1 isEqual: str2] == NO){
            NSLog(@"the str1 is not equal with str2");
        }
        
        NSMutableString *mstr1 = [[NSMutableString alloc]init];
        [mstr1 setString:@"This is an example of something"];
        NSRange substr1;
        substr1 = [mstr1 rangeOfString: @"This"];
        if(substr1.location != NSNotFound){
             NSLog(@"found the \"this\"");
        }
        
        NSLog(@"%@",[bookArray self]);
        
        NSString *mutabstr1 = @"finding the way go home!";
        NSLog(@"%@",[mutabstr1 substringToIndex:3]);
        NSLog(@"%@",[mutabstr1 substringFromIndex:3]);
        NSLog(@"%@",[[mutabstr1 substringFromIndex:3] substringToIndex:3]);
        NSLog(@"%@",[mutabstr1 substringWithRange:NSMakeRange(3, 5)]);
        
        NSRange range1 = [mutabstr1 rangeOfString:@"the"];
        NSLog(@"%lu %lu",range1.location,range1.length);
        
        NSString *mstring1 = @"fingding the way go home2";//NSString 都是不可变类型 要NSMutableString变成可bian
        NSMutableString *mstr2 = [NSMutableString stringWithString:mstring1];
        [mstr2 insertString:@" mutable" atIndex:8];
        NSLog(@"%@",mstr2);
        [mstr2 insertString:@" and string B" atIndex:[mstr2 length]];
        NSLog(@"%@",mstr2);
        [mstr2 appendString:@" and string C"];
        NSLog(@"%@",mstr2);
        NSRange substr = [mstr2 rangeOfString:@"and string C"];
        NSLog(@"%@",mstr2);
        [mstr2 deleteCharactersInRange:substr];
        NSLog(@"%@",mstr2);
        [mstr2 setString:@"THIS IS String A"];
        NSLog(@"%@",mstr2);
        [mstr2 replaceCharactersInRange:NSMakeRange(4, 0) withString:@" a mutable string"];
        NSLog(@"%@",mstr2);
        [mstr2 replaceOccurrencesOfString:@"a" withString:@"B" options:1 range:NSMakeRange(0, [mstr2 length])];
        NSLog(@"%@",mstr2);
        
        
        NSMutableString *mstrtest = [NSMutableString stringWithString:@"fingding the way go home2"];
        [mstrtest insertString:@" mutable" atIndex:8];
        NSLog(@"%@",mstrtest);
        
        if([fra1 isKindOfClass:[Fraction class]] == YES){
            NSLog(@"fra1 iskindofclass fraction");
        }
        
        NSLog(@"%@",[fra1 description]);//显示类名和内存地址
        
        NSLog(@"===========NSArray============");
        NSArray *monthname = [NSArray arrayWithObjects:@"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December",nil];
        NSLog(@"====  ====");
        for(int i=0;i<12;i++){
            NSLog(@" %2i    %@",i+1,[monthname objectAtIndex:i]);
        }
        NSLog(@"====  ====");
        
        
        
       
        
        
        

        
        
    }
    return 0;
}
