//
//  ChecklistViewController.h
//  fazendoMinhaFesta
//
//  Created by Fabio Gelbcke on 2/20/14.
//  Copyright (c) 2014 Fabio Gelbcke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Checkbox.h"

@interface ChecklistViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *parameters;
@property NSInteger partyIndex;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *cview;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
