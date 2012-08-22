//
//  GameAudioEngine.m
//  Cocos2DTests
//
//  Created by Zhenia on 08/21/12.
//  Copyright (c) 2012 111 Minutes. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import "GameAudioEngine.h"

@implementation GameAudioEngine

+ (GameAudioEngine *)sharedEngine {
    static dispatch_once_t once;
    static GameAudioEngine *sharedEngine;
    dispatch_once(&once, ^{
        sharedEngine = [[self alloc] init];
    });
    return sharedEngine;
}

- (void)dealloc {

    [_backgroundMusicPlayer setDelegate:nil];
    [_backgroundMusicPlayer release];
    _backgroundMusicPlayer = nil;

    [super dealloc];
}

#pragma mark Main audio logic

- (void)playBackgroundMusicFilename:(NSString *)backgroundAudioFile ofType:(NSString *)extension {

    if (_backgroundMusicPlayer) {
        [_backgroundMusicPlayer setDelegate:nil];
        [_backgroundMusicPlayer release];
    }
    NSString *pathToAudio = [[NSBundle mainBundle] pathForResource:backgroundAudioFile ofType:extension];
    NSError *error = nil;
    _backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:pathToAudio]
                                                                    error:&error];
    [_backgroundMusicPlayer prepareToPlay];
    [_backgroundMusicPlayer play];
}

- (void)playEffect:(NSString *)effectName ofType:(NSString *)extension {

    NSString *pathToEffect = [[NSBundle mainBundle] pathForResource:effectName ofType:extension];
    NSURL *effectURL = [NSURL fileURLWithPath:pathToEffect];

    SystemSoundID effectSoundID;
    AudioServicesCreateSystemSoundID((CFURLRef)effectURL, &effectSoundID);
    AudioServicesPlaySystemSound(effectSoundID);
}

- (void)stopBackgroundMusic {
    if (_backgroundMusicPlayer) {
        [_backgroundMusicPlayer stop];
        [_backgroundMusicPlayer setDelegate:nil];
        [_backgroundMusicPlayer release];
        _backgroundMusicPlayer = nil;
    }
}

#pragma mark AVAudioPlayer delegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    [player prepareToPlay];
    [player play];
}

- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player {
    if ([player isPlaying]) {
        [player pause];
    }
}

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player {
    if (![player isPlaying]) {
        [player play];
    }
}


@end
