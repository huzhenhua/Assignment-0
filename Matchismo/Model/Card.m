//
//  Card.m
//  Matchismo
//
//  Created by Zhenhua Hu on 13-8-18.
//  Copyright (c) 2013年 Zhenhua Hu. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards)
    { if ([card.contents isEqualToString:self.contents]) {
        score = 1;
    }
    
    }

return score;


}

@end
