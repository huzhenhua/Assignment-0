//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Zhenhua Hu on 13-8-21.
//  Copyright (c) 2013年 Zhenhua Hu. All rights reserved.
//
#import "PlayingCard.h"
#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

- (id)init
{

    self = [super init];
    
    if(self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank<= [PlayingCard maxRank]; rank++)
            {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card atTop:YES];
            }
            
        }
    }
             return self;
}
@end
