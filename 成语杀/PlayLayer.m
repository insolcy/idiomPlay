//
//  PlayLayer.m
//  成语杀
//
//  Created by lcy on 12-11-7.
//
//

#import "PlayLayer.h"
#import "cocos2d.h"
#import "mySprite.h"
#import "sqlite3.h"




#define dicData @"dictdb.sqlite3"
#define myData @"mydatabase.sqlite3"

@implementation PlayLayer

@synthesize sprite=_sprite;
@synthesize moveAction=_moveAction;
@synthesize walkAction=_walkAction;



-(void)getIdiom
//获取成语
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    databaseFilePath = [documentsDirectory stringByAppendingPathComponent:dicData];
    NSLog(@"%@",databaseFilePath);
    //打开或创建数据库
    sqlite3 *database;
    int n = sqlite3_open([databaseFilePath UTF8String] , &database);
    NSLog(@"%i",n);
    NSLog(@"%i",SQLITE_OK);
    if (n != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"打开数据库失败！");
    }
    
    //执行查询
    const char *query = "select * from IDIOM";
    /*const char *query = "SELECT * FROM idiom";
    char *errorMsg; 
    sqlite3_exec(database, query, NULL, NULL, &errorMsg);
    NSLog(errorMsg);*/
    sqlite3_stmt *statement;
    NSLog(@"%d",(sqlite3_prepare_v2(database, query, -1, &statement, nil)));
    NSAssert1(0,@"Error:%s",sqlite3_errmsg(database));
    if (sqlite3_prepare_v2(database, query, -1, &statement, nil) == SQLITE_OK) {
        NSLog(@"wa");
        //依次读取数据库表格FIELDS中每行的内容，并显示在对应的TextField
        while (sqlite3_step(statement) == SQLITE_ROW) {
            //获得数据
            int tag = sqlite3_column_int(statement, 0);
            NSLog(@"%i",tag);
            char *rowData = (char *)sqlite3_column_text(statement, 1);
            //根据tag获得TextField
            NSLog(rowData);
        }
        sqlite3_finalize(statement);
    }
    //关闭数据库
    sqlite3_close(database);
}

-(void)playScore
{
    CCLabelTTF *play1Score=[CCLabelTTF labelWithString:@"play1 score:" fontName:@"Marker Felt" fontSize:24];
    //CGSize winSize =[[CCDirector sharedDirector]winSize];
    play1Score.position=ccp(60, 20);
    [self addChild:play1Score];
    CCLabelTTF *play2Score=[CCLabelTTF labelWithString:@"play2 score:" fontName:@"Marker Felt" fontSize:24];
    play2Score.position=ccp(860, 20);
    [self addChild:play2Score];
}

- (void)starButtonTapped:(id)sender
{
    [_label setString:@"Last button: *"];
}

-(void)gameButton:(int)x:(int)y:(NSString *)wordName
{
    CGSize winSize =[[CCDirector sharedDirector]winSize];
    [[CCSpriteFrameCache sharedSpriteFrameCache]addSpriteFramesWithFile:@"button.plist"];
    CCSpriteBatchNode *spriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"button.png"];
    [self addChild:spriteSheet];
    _sprite=[mySprite spriteWithSpriteFrameName:@"button2.png"];
   
    _sprite.position=ccp(x , y);
    _sprite.word=wordName;
    //NSLog(_sprite.word);
    CCLabelTTF *wordPos=[CCLabelTTF labelWithString:_sprite.word fontName:@"Marker Felt" fontSize:19];
    wordPos.position=ccp(x , y);
    [self addChild:wordPos];
    [spriteSheet addChild:_sprite];
    
}



-(void)goBackButton
{
    
    CGSize winSize =[[CCDirector sharedDirector]winSize];
    CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"back" target:self selector:@selector(back:)];
    CCMenu *menu = [CCMenu menuWithItems: back, nil];
    menu.position = ccp(winSize.width/2,50);
    [self addChild:menu];
}
-(void)buttonfun
{
    CGSize winSize =[[CCDirector sharedDirector]winSize];
    _label=[CCLabelTTF labelWithString:@"Last button:None" dimensions:CGSizeMake(320, 50) hAlignment:UITextAlignmentCenter fontName:@"Marker Felt" fontSize:32];
    _label.position=ccp(winSize.width/2, winSize.height-(_label.contentSize.height/2));
    [self addChild:_label];
    [CCMenuItemFont setFontName:@"Marker Felt"];
    [CCMenuItemFont setFontSize:30];
    CCSprite *color = [CCSprite spriteWithFile:@"button.png"];
    color.color=ccRED;
    CCSprite *pItm = [CCMenuItemFont itemWithString:@"神"];
    
    
    
    CCSprite* normal = [CCSprite spriteWithFile:@"button.png"];
    normal.color = ccRED;
    CCSprite* pressed = [CCSprite spriteWithFile:@"button.png"];
    pressed.color = ccGREEN;
    CCMenuItemSprite *item2 = [CCMenuItemSprite itemWithNormalSprite:pressed selectedSprite:normal target:self selector:@selector(starButtonTapped:)];
    
    [item2 addChild:pItm z:1 tag:22];
    item2.position = ccp(300, 50);
    CCMenu *starMenu = [CCMenu menuWithItems:item2, nil];
    starMenu.position = CGPointZero;
    [self addChild:starMenu];
}

-(id) init
{
    self = [super init];
    if (!self)
    {
        
        
    }
    //[self hero];
    for (int i=0;i<100;i++)
    {
        int xx,yy;
        xx = i / 10;
        yy = i % 10;
        
        if (i<50) {
        [self gameButton:(200 + xx*64):(100 + yy*64):@"正"];
        }
        else
            [self gameButton:(200 + xx*64):(100 + yy*64):@"晓"];
    }
    [self getIdiom];
    [self goBackButton];
    [self playScore];
    //[self buttonfun];
    return self;
}

-(void) back:(id)sender
{
    [SceneManager goMenu];
}
@end
