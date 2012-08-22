//
//  GameAudioEngine.h
//  Cocos2DTests
//
//  Created by Zhenia on 08/21/12.
//  Copyright (c) 2012 111 Minutes. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface GameAudioEngine : NSObject <AVAudioPlayerDelegate> {
    AVAudioPlayer *_backgroundMusicPlayer;
    SystemSoundID _effectSoundID;
}

+ (GameAudioEngine *)sharedEngine;

- (void)playBackgroundMusicFilename:(NSString *)backgroundAudioFile ofType:(NSString *)extension;
- (void)stopBackgroundMusic;
- (void)playEffect:(NSString *)effectName ofType:(NSString *)extension;

@end
