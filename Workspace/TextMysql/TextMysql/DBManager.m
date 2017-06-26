//
//  DBManager.m
//  TextMysql
//
//  Created by 金亮齐 on 2017/6/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "DBManager.h"
#import "Person.h"
#import "mysql.h"

/* 本地的主机名字默认是localhost */
static const char *host_name = "localhost";
/* 本地mysql数据库用户名默认root */
static const char *user_name = "root";
/* 本地mysql链接的密码 */
static const char *password = "123456";
/*  创建数据库 “库”的名字 */
static const char *db_name = "text";

@interface DBManager(){
    
    MYSQL *_myconnect;
}
@end


@implementation DBManager


+(DBManager *)sharedManager {
    static DBManager *sharedSingleton = nil;
    static dispatch_once_t onceToken;
        dispatch_once(&onceToken,^(void) {
               sharedSingleton = [[self alloc] init];
            });
        return sharedSingleton;
}

- (instancetype)init {
    if (self = [super init]) {
        //初始化工作
        _myconnect = mysql_init(_myconnect);
        _myconnect = mysql_real_connect(_myconnect,host_name,user_name,password,db_name,MYSQL_PORT,NULL,0);
            mysql_set_character_set(_myconnect, "utf8");
                if (_myconnect != NULL) {
                        NSLog(@"连接成功");
                    } else {
                NSLog(@"连接失败");
            }
        }
    return self;
}

- (NSArray *)getAllPersons {
    if (_myconnect == NULL) {
        return nil;
    }
    //status=0，表示query成功
    int status = mysql_query(_myconnect, "select * from students");
      if (status != 0) {
                 NSLog(@"查询数据失败");
        }
        //拿到结果集
        MYSQL_RES *result = mysql_store_result(_myconnect);
        //一共查询到多少行
        long long rows =result->row_count;
        //创建数组保存数据
        NSMutableArray *rowArray = [NSMutableArray arrayWithCapacity:rows];
        //字段个数
        unsigned int fieldCount = mysql_field_count(_myconnect);
        //用于保存一行的结果，其实就是一个字符串数组
        MYSQL_ROW col;
        for (int row = 0; row < rows; row++) {
            NSMutableString *strM = [NSMutableString string];
                 if((col = mysql_fetch_row(result))){
                    for(int i = 0; i < fieldCount; i++){
                        //这里为了方便看结果,只返回字符串，而不是返回模型数组
                        [strM appendString:[NSString stringWithUTF8String:col[i]]];                        [strM appendString:@" "];
                    }
                }
            [rowArray addObject:strM];
        }
    return rowArray;
}


- (void)addPerson:(Person *)p {
    NSString *sql = [NSString stringWithFormat:@"insert into students (name, sex, age, tel) values('%@', '%@', '%@','%@')",p.name,p.sex,p.age,p.tel];
    int status = mysql_query(_myconnect, [sql UTF8String]);
    
        if (status == 0) {
                NSLog(@"插入数据成功");
            } else {
                NSLog(@"插入数据失败");
        }
}

- (void)deletaPerson:(Person *)p {
     NSString *sql = [NSString stringWithFormat:@"delete from students where id=%@",p.ID];
     int status = mysql_query(_myconnect, [sql UTF8String]);
    
            if (status == 0) {
                    NSLog(@"删除数据成功");
            } else {
                    NSLog(@"删除数据失败");
            }
}

@end
