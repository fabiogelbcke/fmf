//
//  PartyCalcViewController.h
//  fazendoMinhaFesta
//
//  Created by Fabio Gelbcke on 2/20/14.
//  Copyright (c) 2014 Fabio Gelbcke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PartyCalcViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *cakeqty;
@property (weak, nonatomic) IBOutlet UILabel *treatsqty;
@property (weak, nonatomic) IBOutlet UILabel *candyqty;
@property (weak, nonatomic) IBOutlet UILabel *sodaqty;
@property (weak, nonatomic) IBOutlet UILabel *beerqty;
@property (weak, nonatomic) IBOutlet UILabel *wineqty;
@property NSInteger partyIndex;
@property (nonatomic, strong) NSArray *parameters;

@end
