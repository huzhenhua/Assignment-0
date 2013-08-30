//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Zhenhua Hu on 13-8-25.
//  Copyright (c) 2013年 Zhenhua Hu. All rights reserved.
//

#import "CardMatchingGame.h"


@interface CardMatchingGame ()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic) int score;
//@property (nonatomic,readwrite) NSString sMatchResult;
@property (readwrite, nonatomic) NSString *descriptionOfLastFlip;


@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if(!_cards)
    {
        _cards = [[NSMutableArray alloc]init];
        
    }
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i< count; i++){
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            }else {
                self.cards[i]= card;
            }
        
        }
    
    
    }


    return self;

}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}
#define FLIP_COST 1
#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isUnplayable) {
        if (!card.isFaceUP){
            self.descriptionOfLastFlip = [NSString stringWithFormat:@"Flipped up %@",card.contents];
            for (Card *otherCard in self.cards){
                if (otherCard.isFaceUP && !otherCard.isUnplayable){
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                        //Matched J♥ & J♠ for 4 points
                        self.descriptionOfLastFlip = [NSString stringWithFormat:@"Matched %@ & %@ for %d points",
                         card.contents, otherCard.contents,
                         matchScore * MATCH_BONUS];
                    }
                    else{
                        otherCard.faceup = NO;
                        self.score -= MISMATCH_PENALTY;
                        //“6♦ and J♣ don’t match! 2 point penalty!”
                        self.descriptionOfLastFlip = [NSString stringWithFormat:@"%@ and %@ don't match! 2 Point penalty!",
                                                      card.contents, otherCard.contents];
                        
                    }                 
                    break;
                }
            }
    self.score -= FLIP_COST;
        }
        card.faceup = !card.isFaceUP;
    }
}

@end
