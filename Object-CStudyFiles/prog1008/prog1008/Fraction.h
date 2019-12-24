//
//  Fraction.h
//  prog1008
//
//  Created by SWQT on 2019/10/9.
//  Copyright © 2019 remanroom. All rights reserved.
//
#import <Foundation/Foundation.h>
//@interface Calculator:NSObject
//-(void) setAccumulator:(double) value;
//-(void) clear;
//-(double) getaccumlator;
//
//-(void) add:(double) value;
//-(void) subtract:(double) value;
//-(void) multiply:(double) value;
//-(void) divide:(double) value;
//@end

@interface Fraction:NSObject
@property int num;
@property double denum;
-(void) print;
-(double) divide;
-(void) setTo:(int)n over:(int)d;
-(void) set: (int)n :(double)d;
-(void) add: (Fraction *)f;
-(Fraction *) add1: (Fraction *) fra;
@end

@interface Fraction (MathOps)//若分类声明了与类中原有方法同名的函数，则分类中的方法会被调用。
//@property int num;
//@property double denum;
-(Fraction *) add2: (Fraction *) f;
-(Fraction *) mul: (Fraction *) f;
-(Fraction *) sub: (Fraction *) f;
-(Fraction *) div: (Fraction *) f;
@end

@interface XYPoint:NSObject
@property int X;
@property int Y;
-(void)setX : (int)a setY : (int)b;
@end

@interface Rectangle:NSObject
@property int width;
@property int height;
-(XYPoint *) setOrigin:(XYPoint *) pt;
-(double) area;
-(int) per;
-(void)setWidth : (int)a setHeight : (int)b;
@end

@interface Square:NSObject
@property int side;
-(int) area;
-(int) squarearea;
-(int) squareper;
-(void) setside : (int)a;
@end

@interface Complex:NSObject
@property double real,imaginary;
-(void) print;
-(void) setReal: (double)a setImaginary: (double)b;
-(Complex *)add: (Complex *)f;
@end

@interface AddressCard: NSObject
@property (copy,nonatomic) NSString *name,*email;//添加了copy(默认为assign)和nonatomic特性
@property int _citynum;
-(void)print;
-(void) setName:(NSString *)name setEmail:(NSString *)email;
@end

@protocol NSAdd1
//@property Drawing3d <NSAdd1>  //协议Drawing3d 遵循NSAdd1协议
//@required //表示必须实现的方法
@optional //表示可选的实现方法
-(void) AddAdress:(NSString *)str;
@end

@interface AddressBook:NSObject<NSAdd1>
@property NSString *name,*email;
//-(NSMutableArray *) addobj: (NSString *) name;
-(void) setName:(NSString *)name setEmail:(NSString *)email;
-(void)print;
@end














