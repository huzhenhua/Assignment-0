//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Zhenhua Hu on 13-8-17.
//  Copyright (c) 2013年 Zhenhua Hu. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "Card.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
//@property (weak, nonatomic) IBOutlet UIButton *cardButton;
@property (strong, nonatomic) PlayingCardDeck *playingCardDeck;

@end

@implementation CardGameViewController

- (PlayingCardDeck *)playingCardDeck
{
    if (!_playingCardDeck) {
        
        _playingCardDeck = [[PlayingCardDeck alloc] init];
        
    }

    return _playingCardDeck;
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flips updated to %d", self.flipCount);
}

- (IBAction)flipCard:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    
    if (sender.selected) {
        Card *newCard = [self.playingCardDeck drawRandomCard];
        if(newCard){
        
            [sender setTitle:newCard.contents forState:UIControlStateSelected];
        }
    }
    self.flipCount++;
}
@end
