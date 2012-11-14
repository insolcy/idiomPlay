//
//  SceneManager.h
//  成语杀
//
//  Created by lcy on 12-10-23.
//
//

#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "PlayLayer.h"
#import "CreditLayer.h"

@interface SceneManager : NSObject{
    
}
+(void) goPlay;
+(void) goMenu;
+(void) goCredits;
@end
