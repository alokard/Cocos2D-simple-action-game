//
//  MainPlayingLayer.h
//  Cocos2DTests
//
//  Created by Zhenia on 8/21/12.
//  Copyright 111 Minutes 2012. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// MainPlayingLayer
@interface MainPlayingLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate> {
    NSMutableArray *_targets;
    NSMutableArray *_projectiles;
}

// returns a CCScene that contains the MainPlayingLayer as the only child
+(CCScene *) scene;

@end
