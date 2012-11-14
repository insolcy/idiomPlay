//
//  SceneManager.m
//  成语杀
//
//  Created by lcy on 12-10-23.
//
//

#import "SceneManager.h"
@interface SceneManager()
+(void) go:(CCLayer *)layer;
+(CCScene *) wrap : (CCLayer *)layer;
@end

@implementation SceneManager

+(void) goMenu
{
    CCLayer *layer = [HelloWorldLayer node];
    [SceneManager go: layer];
}


+(void) goPlay
{
    CCLayer *layer = [PlayLayer node];
    [SceneManager go: layer];
}

+(void) goCredits
{
    CCLayer *layer = [CreditLayer node];
    [SceneManager go :layer];
}

+(void) go: (CCLayer *)layer
{
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [SceneManager wrap:layer];
    if ([director runningScene]) {
        [director replaceScene:newScene];
    } else {
        [director runWithScene:newScene];
    }
}

+(CCScene *)wrap:(CCLayer *)layer{
    CCScene *newScene = [CCScene node];
    [newScene addChild:layer];
    return newScene;
}
@end