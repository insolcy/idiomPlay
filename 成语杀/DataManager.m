//
//  DataManager.m
//  成语杀
//
//  Created by lcy on 12-11-11.
//
//

#import "DataManager.h"

#define dicData @"dictdb.sqlite3"

@implementation DataManager



-(BOOL) openDatabase
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"mydb.sql"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL find = [fileManager fileExistsAtPath:path];
    //找到数据库文件mydb.sql
    if (find) {
        NSLog(@"Database file have already existed.");
        if(sqlite3_open([path UTF8String], &database_) != SQLITE_OK) {
            sqlite3_close(database_);
            NSLog(@"Error: open database file.");
            return NO;
        }
        return YES;
    }
    if(sqlite3_open([path UTF8String], &database_) == SQLITE_OK) {
        bFirstCreate_ = YES;
        [self createChannelsTable:database_];//在后面实现函数createChannelsTable
        return YES;
    } else {
        sqlite3_close(database_);
        NSLog(@"Error: open database file.");
        return NO;
    }
    return NO;
}


@end
