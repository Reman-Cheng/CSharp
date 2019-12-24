//
//  Fraction.m
//  1015_1055
//
//  Created by SWQT on 2019/10/15.
//  Copyright © 2019 remanroom. All rights reserved.
//
#define MAXVALUE(a,b) ((a)>(b)?(a):(b))
#define PI 3.14
#ifdef PI
#define PI1 3.1415926
#else
#define PI1 3.14
#endif

#import <Foundation/Foundation.h>

@interface AddressCard: NSObject <NSCopying,NSCoding>
@property (copy,nonatomic)NSString *name,*email,*bookname;
@property NSString *name1;
@property (copy,nonatomic)NSMutableArray *bookarr;
-(void) print;
-(void) print1;
-(void) setName:(NSString *)thename setEmail:(NSString *)theemail;
-(id) initWithName: (NSString *) name;
-(id) init;
-(void) addCard: (AddressCard *) thecard;
-(void) removeCard: (AddressCard *) thecard;
-(void) remove:(NSString *)thename;
-(int) entries;
-(void) list;
-(AddressCard *) lookup:(NSString *) thename;
-(void) sort;
-(NSComparisonResult) compareNames:(id)element;
-(void) sort1;
//-(void) assignName: (NSString *) theName andEmail:(NSString *) theEmail;
@end
