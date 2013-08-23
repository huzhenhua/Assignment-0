//
//  Deck.m
//  Matchismo
//
//  Created by Zhenhua Hu on 13-8-18.
//  Copyright (c) 2013年 Zhenhua Hu. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck


-(NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
    
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop){
        [self.cards insertObject:card atIndex:0];
    }else {
        [self.cards addObject:card];
    }

}

-(Card *)drawRandomCard
{
    Card *randomCard = nil;
    
    if (self.cards.count){
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
        
    }
    return randomCard;
}
@end
