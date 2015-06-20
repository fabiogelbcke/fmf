//
//  ChecklistTableViewCell.h
//  fazendoMinhaFesta
//
//  Created by Fabio Gelbcke on 3/14/14.
//  Copyright (c) 2014 Fabio Gelbcke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Checkbox.h"
@interface ChecklistTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet Checkbox *tickbox;
@property (strong, nonatomic) IBOutlet UILabel *task;

@end

