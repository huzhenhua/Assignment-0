//
//  Deck.h
//  Matchismo
//
//  Created by Zhenhua Hu on 13-8-18.
//  Copyright (c) 2013年 Zhenhua Hu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(Card *)drawRandomCard;

@end
