//
//  PlayingCard.h
//  Matchismo
//
//  Created by Zhenhua Hu on 13-8-18.
//  Copyright (c) 2013年 Zhenhua Hu. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;

@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
