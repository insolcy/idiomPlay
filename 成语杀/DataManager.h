//
//  DataManager.h
//  成语杀
//
//  Created by lcy on 12-11-11.
//
//

#import <Foundation/Foundation.h>

#import "sqlite3.h"




@interface DataManager : NSObject {
    sqlite3* database_;
    bool  bFirstCreate_;

}
-(BOOL) openDatabase;

@end
