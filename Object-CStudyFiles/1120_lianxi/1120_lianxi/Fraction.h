//
//  Fraction.m
//  1120_lianxi
//
//  Created by SWQT on 2019/11/20.
//  Copyright © 2019 remanroom. All rights reserved.
//

#define INTOBJ(v) [NSNumber numberWithInteger:v]
#import <Foundation/Foundation.h>
@interface Fraction:NSObject
@property int numerator,denominator,fra11;
-(void) print;
-(double) convertToNum;
-(void) add:(Fraction *)f;
-(void) noSuchMethod;
-(void) setgGlobalVal:(int)val;
@end
@interface Fraction (Comparison)
-(BOOL) isEqualTo:(Fraction *)f;
-(int) compare:(Fraction *)f;
@end

@interface Fraction1:NSObject
//@property int numerator,denominator;
-(void) print;
-(double) convertToNum;
-(void) add:(Fraction *)f;
@end


@interface ClassA:NSObject
//{
//    //继承的实例变量放这，子类可以访问，否则就是父类的私有实例变量
//    int x;
//}
@property int x;
-(void) initVar;
@end

@interface ClassB:ClassA
-(void) printVar;
@end

@interface NSSet (printing)
-(void) print;
@end

@interface Test:NSObject
@property int num;
-(void) print;
@end
