//
//  CalcResultsViewController.h
//  fazendoMinhaFesta
//
//  Created by Fabio Gelbcke on 1/26/14.
//  Copyright (c) 2014 Fabio Gelbcke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalcResultsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *cakeqty;
@property (weak, nonatomic) IBOutlet UILabel *treatsqty;
@property (weak, nonatomic) IBOutlet UILabel *candyqty;
@property (weak, nonatomic) IBOutlet UILabel *sodaqty;
@property (weak, nonatomic) IBOutlet UILabel *beerqty;
@property (weak, nonatomic) IBOutlet UILabel *wineqty;
@property (strong, nonatomic) NSString *adultsQty;
@property (strong, nonatomic) NSString *childrenQty;
@property (strong, nonatomic) UISwitch *partyType;

@end
