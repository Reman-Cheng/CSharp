//
//  main.m
//  1015_1055
//
//  Created by SWQT on 2019/10/15.
//  Copyright © 2019 remanroom. All rights reserved.
//

#import "Fraction.h"
#import "Header.h"
@implementation AddressCard1
-(void)print{
    NSLog(@"fjldfja;");
}
@end
@implementation AddressCard
@synthesize name,email;
@synthesize name1;
@synthesize bookarr,bookname;
-(void)print{
    NSLog(@"============================");
    NSLog(@"|                          |");
    NSLog(@"| %-31s |",[name UTF8String]);
    NSLog(@"| %-31s |",[email UTF8String]);
    NSLog(@"|                          |");
    NSLog(@"============================");
}
-(void) print1{
    name1 = @"20191016";
    NSLog(@"%@",name1);
}
-(void)setName:(NSString *)thename setEmail:(NSString *)theemail{
    self.name = thename;
    self.email = theemail;
}
-(id) initWithName:(NSString *)name{
    self = [super init];
    if(self){
        bookname = [NSString stringWithString:name];
        bookarr = [NSMutableArray array];
    }
    return self;
}
-(id)init{
    return [self initWithName:@"NOName"];
}
-(void) addCard:(AddressCard *)thecard{
    [bookarr addObject:thecard];
}
-(void) removeCard:(AddressCard *)thecard{
    [bookarr removeObject:thecard];
}
-(void) remove:(NSString *)thename{
    for(AddressCard *thecard1 in bookarr){
        if([thecard1.name caseInsensitiveCompare:thename] == NSOrderedSame){
            [bookarr removeObjectIdenticalTo:thecard1];
        }
    }
}
-(int) entries{
    return (int)[bookarr count];
}
-(void) list{
    NSLog(@"======Contents of: %@ ======",bookname);
    for(AddressCard *thecard in bookarr){
        NSLog(@"%-20s  %-32s",[thecard.name UTF8String],[thecard.email UTF8String]);
    }
    NSLog(@"============================");
}
-(AddressCard *) lookup:(NSString *) thename{
    for(AddressCard *nextcard in bookarr){
        //不区分大小写的比较
        if([nextcard.name caseInsensitiveCompare:thename] == NSOrderedSame){
            return nextcard;
        }
    }
    return nil;
}
-(void) sort{
    [bookarr sortUsingSelector:@selector(compareNames:)];
}
-(NSComparisonResult) compareNames:(id)element{
    return [name compare:[element name]];
}
-(void) sort1{
    [bookarr sortUsingComparator:^(id obj1, id obj2){
        return [[obj1 name] compare:[obj2 name]];
    }];
}
-(id) copyWithZone:(NSZone *)zone{
    AddressCard *newCard = [[AddressCard allocWithZone:zone]init];
    [newCard setName:name setEmail:email];
    return newCard;
}
//对象存储 要加键
-(void) encodeWithCoder:(NSCoder *) encoder{
    [encoder encodeObject:name forKey:@"AddressCardName"];
    [encoder encodeObject:email forKey:@"AddressCardEmail"];
}
-(id) initWithCoder:(NSCoder *) decoder{
    name = [decoder decodeObjectForKey:@"AddressCardName"];
    email = [decoder decodeObjectForKey:@"AddressCardEmail"];
    return self;
}
//

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AddressCard * card1 = [[AddressCard alloc]init];
        AddressCard * card2 = [[AddressCard alloc]init];
        AddressCard * card3 = [[AddressCard alloc]init];
        AddressCard * card4 = [[AddressCard alloc]init];
        [card1 setName:@"Julia" setEmail:@"jewls@axlc.com"];
        [card2 setName:@"Tony" setEmail:@"tony@tech.com"];
        [card3 setName:@"stephen" setEmail:@"steve@tech.com"];
        [card4 setName:@"jamie" setEmail:@"jamie@tech.com"];
        
        [card1 print];
        [card2 print];
        
        NSLog(@"%@",card1.name);
        
//        NSString *fName = [NSString stringWithContentsOfFile:@"/Users/swqt/Desktop/testBundle.txt" encoding:NSUTF8StringEncoding error:nil];
//        NSLog(@"%@",fName);
        AddressCard *mybook =[[AddressCard alloc]initWithName:@"reman's Address Book"];
        [mybook addCard:card1];
        [mybook addCard:card2];
        [mybook addCard:card3];
        [mybook addCard:card4];
        NSLog(@"after adding cards:%i",[mybook entries]);
        [mybook list];
        
        AddressCard *mycard = [mybook lookup:@"juLiA"];
        if(mycard != nil){
            [mycard print];
        }else{
            NSLog(@"Not found!");
        }
        
        //remove
//        [mybook removeCard:card2];
//        [mybook remove:@"julia"];
//        [mybook sort1];
        [mybook sort];
        [mybook list];
        
        //Dictionary
        NSMutableDictionary *glossary = [NSMutableDictionary dictionary];
        [glossary setObject:@"A class defined so other classes can inherit from it" forKey:@"bbstract class"];
        [glossary setObject:@"To implement all the methods defined in a protocol" forKey:@"adopt"];
        [glossary setObject:@"Storing an object for later use" forKey:@"crchiving"];
        NSLog(@"====dictionarycount==== %u",(unsigned int)[glossary count]);
        NSLog(@"====dictionary==== %@",glossary);
        NSArray *gloKeys = [glossary allKeys];
        NSLog(@"====gloKeys==== %@",gloKeys);
        gloKeys = [gloKeys sortedArrayUsingComparator:^(id obj1,id obj2){
            return [obj1 compare:obj2];
        }];
        NSLog(@"====sortgloKeys==== %@",gloKeys);
        for(NSString *key in gloKeys){
             NSLog(@"%@ : %@",key,[glossary objectForKey:key]);
        }
        
        //NSSet  NSMutableSet  NSIndexSet  NSCountedSet
        
        //define
        NSLog(@"%f",PI1);
        int limit = MAXVALUE(4, 6);
        NSLog(@"%i",limit);
        
        //File
        NSFileManager *fm1 = [NSFileManager defaultManager];
        if([fm1 fileExistsAtPath:@"/Users/swqt/Desktop/ObjC-Test/testBundle 3.txt"] == NO){
            NSLog(@"File doesn't exist!");
        }
        NSString *data1 = [NSString stringWithContentsOfFile:@"/Users/swqt/Desktop/ObjC-Test/testBundle 3.txt" encoding:NSUTF8StringEncoding error:NULL];
//        NSArray *data1 = [NSArray arrayWithContentsOfFile:@"/Users/swqt/Desktop/testBundle 3.txt"];
        NSLog(@"%@",fm1);
        NSLog(@"%@",data1);
        
//        [fm1 createFileAtPath:@"/Users/swqt/Desktop/testBundle 2.txt" contents:NULL attributes:glossary];
        NSString *homedir1 = NSHomeDirectory();
        homedir1 = [homedir1 stringByAppendingString:@"/Desktop/ObjC-Test/testBundle 2.txt"];
        if([fm1 removeItemAtPath: homedir1 error:NULL] == YES){
            NSLog(@"the testBundle 2.txt remove success");
        }else{
            NSLog(@"the testBundle 2.txt maybe already remove or not exit");
        }
        NSLog(@"%@",fm1);
        
        if([fm1 copyItemAtPath:@"/Users/swqt/Desktop/ObjC-Test/testBundle 3.txt" toPath:@"/Users/swqt/Desktop/ObjC-Test/testBundle 3_3.txt" error:NULL] == YES){
            NSLog(@"copy the testBundle 3.txt success");
        }else{
            NSLog(@"copy the testBundle 3.txt fail or file is already equal");
        }
        
        if([fm1 contentsEqualAtPath:@"/Users/swqt/Desktop/ObjC-Test/testBundle 3.txt" andPath:@"/Users/swqt/Desktop/ObjC-Test/testBundle 3_3.txt"] == YES){
            NSLog(@"the testBundle 3.txt are equal with testBundle 3_3.txt");
        }else{
            NSLog(@"the testBundle 3.txt are not equal with testBundle 3_3.txt");
        }
        
        NSData *nsdata1;
        nsdata1 = [fm1 contentsAtPath:@"/Users/swqt/Desktop/ObjC-Test/testBundle 3.txt"];
        if(nsdata1 == nil){
            NSLog(@"File read failed!");
        }

        if([fm1 createFileAtPath:@"/Users/swqt/Desktop/ObjC-Test/testBundle 2.txt" contents:nsdata1 attributes:nil] == NO){
            NSLog(@"Counldn't create the copy!");
        }
        
        //对目录的操作
        NSLog(@"Current directory path is %@",[fm1 currentDirectoryPath]);
        NSArray *dirarray1 = [fm1 contentsOfDirectoryAtPath:@"/Users/swqt/Desktop/20191016/" error:NULL];//次级目录不会遍历
        for(NSString *path in dirarray1){
            NSLog(@"the path is:%@",path);
        }
        NSLog(@"====  enumeratorAtPath  ====");
        NSDirectoryEnumerator *dirEnum = [fm1 enumeratorAtPath:@"/Users/swqt/Desktop/20191016/"];
        NSLog(@"%@",dirEnum);
        NSString *path1;
        //次级目录也会遍历
        while((path1 = [dirEnum nextObject])!= nil){
            NSLog(@"%@",path1);
        }
        
        NSLog(@"====  NSPathUtilities.h  ====");
        //获取临时工作目录
        NSString *tempdir = NSTemporaryDirectory();
        NSLog(@"Temporary directory is %@",tempdir);
        //从当前目录提取基本目录
        NSString *path = [fm1 currentDirectoryPath];
        NSLog(@"base dir is %@",[path lastPathComponent]);//提取最后一个文件名
        //创建文件main.m在当前目录中的完整路径
        NSString *fullpath = [path stringByAppendingPathComponent:@"main.m"];
        NSLog(@"fullpath to %@ is %@",@"main.m",fullpath);
        //获取文件扩展名
        NSString *extension = [fullpath pathExtension];
        NSLog(@"extension for %@ is %@",fullpath,extension);
        //获取用户主目录
        NSString *homedir = NSHomeDirectory();
        NSLog(@"your home directory is %@",homedir);
        //拆分路径为各组成部分
        NSArray *components = [homedir pathComponents];
        for(NSString *path in components){
            NSLog(@"%@",path);
        }
        
        
        NSLog(@"====  NSFileHandle  ====");
        NSFileHandle *infile,*outfile;
        NSData *buffer;
        //打开文件并读取
        infile = [NSFileHandle fileHandleForReadingAtPath:@"/Users/swqt/Desktop/ObjC-Test/testBundle 2.txt"];
        if(infile != nil){
            NSLog(@"open of testfile for reading not failed: %@",infile);
        }
        //创建输出文件
        [[NSFileManager defaultManager] createFileAtPath:@"/Users/swqt/Desktop/ObjC-Test/testout.txt" contents:nil attributes:nil];
        //
        outfile = [NSFileHandle fileHandleForWritingAtPath:@"/Users/swqt/Desktop/ObjC-Test/testout.txt"];
        if(outfile != nil){
            NSLog(@"open of testfile for writing not failed: %@",outfile);
        }
        //从infile读取数据 写到outfile
        buffer = [infile readDataToEndOfFile];
        [outfile writeData:buffer];
        //关闭两个文件
        [infile closeFile];
        [outfile closeFile];
        
        NSLog(@"%@",[NSString stringWithContentsOfFile:@"/Users/swqt/Desktop/ObjC-Test/testout.txt" encoding:NSUTF8StringEncoding error:NULL]);
        
        
        //copy & mutableCopy
        NSLog(@"====  copy & mutableCopy  ====");
        NSMutableArray *dataArray = [NSMutableArray arrayWithObjects:@"one",@"two",@"three",@"four",nil];
        NSMutableArray *dataArray2;
        //1.copy
        dataArray2 = dataArray;
        [dataArray2 removeObjectAtIndex:0];
        NSLog(@"dataArray: ");
        for(NSString *elem in dataArray){
            NSLog(@"%@",elem);
        }
        NSLog(@"dataArray2: ");
        for(NSString *elem in dataArray2){
            NSLog(@"%@",elem);
        }
        //2.mutableCopy
        dataArray2 = [dataArray mutableCopy];
        [dataArray2 removeObjectAtIndex:0];
        NSLog(@"dataArray: %@",dataArray);
        for(NSString *elem in dataArray){
            NSLog(@"%@",elem);
        }
        NSLog(@"dataArray2: %@",dataArray2);
        for(NSString *elem in dataArray2){
            NSLog(@"%@",elem);
        }
        
        NSLog(@"====  浅复制  ====");
        NSMutableArray *dataArray11 = [NSMutableArray arrayWithObjects:[NSMutableString stringWithString:@"one"],[NSMutableString stringWithString:@"two"],[NSMutableString stringWithString:@"three"],nil];
        NSMutableString *mStr;
        
        dataArray2 = [dataArray11 mutableCopy];
        mStr = [dataArray11 objectAtIndex:0];
        [mStr appendString:@"ONE"];
        NSLog(@"dataArray11: %@",dataArray11);
        for(NSString *elem in dataArray11){
            NSLog(@"%@",elem);
        }
        NSLog(@"dataArray2: %@",dataArray2);
        for(NSString *elem in dataArray2){
            NSLog(@"%@",elem);
        }
        NSLog(@"====  change after  ====");
        //对单个数组中的对像进行修改的深复制
        mStr = [NSMutableString stringWithString:[dataArray11 objectAtIndex:0]];//单独复制出来这个arr[0]的对象
        [mStr appendString:@"TWO"];
        [dataArray11 replaceObjectAtIndex:0 withObject:mStr];
        NSLog(@"dataArray11: %@",dataArray11);
        for(NSString *elem in dataArray11){
            NSLog(@"%@",elem);
        }
        NSLog(@"dataArray2: %@",dataArray2);
        for(NSString *elem in dataArray2){
            NSLog(@"%@",elem);
        }
        NSLog(@"===============================");
        
        
        AddressCard *card5 = [[AddressCard alloc]init];
        AddressCard *card6;
        [card5 setName:@"reman5" setEmail:@"reman5@111.com"];
        card6 = card5;
        [card6 setName:@"reman6" setEmail:@"reman6@111.com"];
        [card5 print];
        [card6 print];
        
        [card5 setName:@"reman5" setEmail:@"reman5@111.com"];
        card6 = [card5 copy];
        [card6 setName:@"reman6" setEmail:@"reman6@111.com"];
        [card5 print];
        [card6 print];
        
        
        NSLog(@"========  XML guidang  ========");
        if([glossary writeToFile:@"/Users/swqt/Desktop/ObjC-Test/testBundle 2.txt" atomically:YES] == YES){
            NSLog(@"Save to file success");
        }
        glossary = [NSMutableDictionary dictionaryWithContentsOfFile:@"/Users/swqt/Desktop/ObjC-Test/testBundle 2.txt"];
        for(NSString *key in glossary){
            NSLog(@"%@: %@",key,[glossary objectForKey:key]);
        }
        //dictionaryWithContentsOfFile    arrayWithContentsOfFile   dataWithContentsOfFile  stringWithContentsOfFile
        
        NSArray *array1 = [NSArray arrayWithObjects:@"one",@"two",@"three",nil];
        if([array1 writeToFile:@"/Users/swqt/Desktop/ObjC-Test/testBundle 2.txt" atomically:YES] == YES){
            NSLog(@"Save Array to file success");
        }
        array1 = [NSArray arrayWithContentsOfFile:@"/Users/swqt/Desktop/ObjC-Test/testBundle 2.txt"];
        NSLog(@"%i",(int)[array1 count]);
        
        //写入后会成为其他形式文件
        [NSKeyedArchiver archiveRootObject:glossary toFile:@"/Users/swqt/Desktop/ObjC-Test/testBundle 3_3.txt"];
        glossary = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/swqt/Desktop/ObjC-Test/testBundle 3_3.txt"];
        for(NSString *key in glossary){
            NSLog(@"%@: %@",key,[glossary objectForKey:key]);
        }
        if([NSKeyedArchiver archiveRootObject:card1 toFile:@"/Users/swqt/Desktop/ObjC-Test/testBundle 3_3.txt"] == YES){
            NSLog(@"arrchiving success");
        }
        card1 = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/swqt/Desktop/ObjC-Test/testBundle 3_3.txt"];
        [card1 print];
        
        NSLog(@"====对象类型加码存储====");
        //设置数据类型
        NSMutableData *dataarea = [NSMutableData data];
        //数据区连接到NSKeyedArchiver对象
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:dataarea];
        //开始存档对象
        [archiver encodeObject:card2 forKey:@"myaddrbook"];
        [archiver finishEncoding];
        
        if([dataarea writeToFile:@"/Users/swqt/Desktop/ObjC-Test/testBundle 2.txt" atomically:YES] == YES){
            NSLog(@"Archiving Success!");
        }
        NSLog(@"====对象类型解码读取====");
        dataarea = [NSMutableData dataWithContentsOfFile:@"/Users/swqt/Desktop/ObjC-Test/testBundle 2.txt"];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:dataarea];
        card2 = [unarchiver decodeObjectForKey:@"myaddrbook"];
        [unarchiver finishDecoding];
        [card2 print];

        [card4 print1];
        //a new create dictionary function
        usleep(20*1e5);
        NSDictionary *testdic = @{@"key1":@{@"key2":@"keykeykey"}};
        NSLog(@"%@",testdic);
        NSLog(@"%@",[testdic objectForKey:@"key1"]);
        NSLog(@"%@",[[testdic objectForKey:@"key1"] objectForKey:@"key2"]);
        
//        NSLog(@"%i",'C'-'A');//char可以直接加减运算
        
        
        
        
        
    }
    return 0;
}
