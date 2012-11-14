//
//  mySprite.h
//  成语杀
//
//  Created by lcy on 12-11-10.
//
//

#import <Foundation/Foundation.h>
#import "CCSprite.h"

@interface mySprite : CCSprite
{
    NSString *_word;
}
@property(nonatomic,retain)NSString*word;
@end
