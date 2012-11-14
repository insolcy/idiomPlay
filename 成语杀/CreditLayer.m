//
//  CreditLayer.m
//  成语杀
//
//  Created by lcy on 12-11-7.
//
//

#import "CreditLayer.h"

@implementation CreditLayer
-(id) init{
    self = [super init];
    if (!self) {
        return nil;
    }
    CGSize winSize =[[CCDirector sharedDirector]winSize];
    
    CCMenuItemFont *back = [CCMenuItemFont itemFromString:@"back" target:self selector: @selector(back:)];
    CCMenu *menu = [CCMenu menuWithItems: back, nil];
    CCLabelTTF *NameShow = [CCLabelTTF labelWithString:@"Done by inChuan" fontName:@"Marker Felt" fontSize:48];
    
    menu.position = ccp(winSize.width/2, 50);
    NameShow.position = ccp(winSize.width/2,winSize.height/2);
    [self addChild:NameShow];
    [self addChild: menu];
    
    return self;
}

-(void) back: (id) sender{
    [SceneManager goMenu];
}


@end
