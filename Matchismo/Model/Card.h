//
//  Card.h
//  Matchismo
//
//  Created by Zhenhua Hu on 13-8-18.
//  Copyright (c) 2013年 Zhenhua Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic)NSString *contents;

@property (nonatomic,getter = isFaceUP) BOOL faceup;
@property (nonatomic,getter = isUnplayable) BOOL unplayable;

- (int)match: (NSArray *)otherCards;

@end
