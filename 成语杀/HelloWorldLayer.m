//
//  HelloWorldLayer.m
//  wordCraft
//
//  Created by lcy on 12-9-29.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "SceneManager.h"
// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "cocos2d.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void)labelShow
{
    CGSize winSize =[[CCDirector sharedDirector]winSize];
    
    
  	
	CCMenuItemFont *startNew = [CCMenuItemFont itemFromString:@"新游戏" target:self selector: @selector(onNewGame:)];
	CCMenuItemFont *credits = [CCMenuItemFont itemFromString:@"Credits" target:self selector: @selector(onCredits:)];
	CCMenu *menu = [CCMenu menuWithItems:startNew, credits, nil];
	

	
	menu.position = ccp(winSize.width/2, 200);
	[menu alignItemsVerticallyWithPadding: 40.0f];
	[self addChild:menu z: 2];
}

-(void)onNewGame:(id)sender{
    [SceneManager goPlay];
}
-(void)onCredits:(id)sender{
    [SceneManager goCredits];
}

-(void)background
{
    CCParticleSystem* emitter = [CCParticleRain node];
    [self addChild:emitter];
}
// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        [self background];
        
        [self labelShow];
        
        
        
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
