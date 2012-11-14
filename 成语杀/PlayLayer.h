//
//  PlayLayer.h
//  成语杀
//
//  Created by lcy on 12-11-7.
//
//

#import <Foundation/Foundation.h>

#import "cocos2d.h"
#import "mySprite.h"
#import "SceneManager.h"
#import "sqlite3.h"

@interface PlayLayer : CCLayer<GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    CCLabelTTF *_label;
    CCSprite *button1;
    mySprite *_sprite;
    CCAction *_walkAction;
    CCAction *_moveAction;
    sqlite3* database_;
    bool  bFirstCreate_;
    NSString *databaseFilePath;    



}
@property(nonatomic,retain)CCSprite*sprite;
@property(nonatomic,retain)CCAction*walkAction;
@property(nonatomic,retain)CCAction*moveAction;
    -(BOOL) openDatabase;


-(void) back:(id)sender;

@end
