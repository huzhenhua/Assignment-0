//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Zhenhua Hu on 13-8-25.
//  Copyright (c) 2013年 Zhenhua Hu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "PlayingCard.h"

@interface CardMatchingGame : NSObject

- (id)initWithCardCount:(NSUInteger)cardCount
             usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;
@property (readonly, nonatomic) NSString *descriptionOfLastFlip;

@end
