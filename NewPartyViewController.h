//
//  NewPartyViewController.h
//  fazendoMinhaFesta
//
//  Created by Fabio Gelbcke on 2/19/14.
//  Copyright (c) 2014 Fabio Gelbcke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChecklistViewController.h"
#import "EditViewController.h"
#import "DatesViewController.h"
#import "PartyCalcViewController.h"

@interface NewPartyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *adultqty;
@property (weak, nonatomic) IBOutlet UITextField *childrenqty;
@property (weak, nonatomic) IBOutlet UISwitch *partyType;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UITextField *partyName;

@end
