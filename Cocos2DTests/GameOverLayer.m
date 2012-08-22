//
//  GameOverLayer.m
//  Cocos2DTests
//
//  Created by Zhenia on 08/21/12.
//  Copyright (c) 2012 111 Minutes. All rights reserved.
//

#import "GameOverLayer.h"
#import "MainPlayingLayer.h"

@implementation GameOverLayer

// Helper class method that creates a Scene with the MainPlayingLayer as the only child.
+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];

    // 'layer' is an autorelease object.
    GameOverLayer *layer = [GameOverLayer node];

    // add layer as a child to scene
    [scene addChild: layer];

    // return the scene
    return scene;
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

- (id)init {
    if ((self = [super init])) {

        self.isTouchEnabled = YES;

        // create and initialize a Label
        CGFloat fontSize = 52;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            fontSize = 64;
        }
        CCLabelTTF *gameOverLabel = [[CCLabelTTF alloc] initWithString:@"Game Over" fontName:@"Marker Felt" fontSize:fontSize];
        // ask director for the window size
        CGSize size = [[CCDirector sharedDirector] winSize];

        // position the label on the center of the screen
        gameOverLabel.position =  ccp( size.width/2 , size.height/2 );

        // add the label as a child to this Layer
        [self addChild:gameOverLabel];

        fontSize = 32;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            fontSize = 48;
        }
        CCLabelTTF *tapLabel = [[CCLabelTTF alloc] initWithString:@"Tap to Restart" fontName:@"Marker Felt" fontSize:fontSize];

        // position the label on the center of the screen
        tapLabel.position =  ccp( size.width/2 , 20 + tapLabel.contentSize.height/2 );

        // add the label as a child to this Layer
        [self addChild:tapLabel];

    }

    return self;
}

#pragma mark CC Touches methods

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[MainPlayingLayer scene]]];
}


@end
