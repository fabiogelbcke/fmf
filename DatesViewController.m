//
//  DatesViewController.m
//  fazendoMinhaFesta
//
//  Created by Fabio Gelbcke on 2/20/14.
//  Copyright (c) 2014 Fabio Gelbcke. All rights reserved.
//

#import "DatesViewController.h"

@interface DatesViewController ()
@property (strong, nonatomic) IBOutlet UILabel *date;



@end

@implementation DatesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.date.text = [NSDateFormatter localizedStringFromDate:[(NSDate *)self.parameters[3] dateByAddingTimeInterval:30*24*60*60] dateStyle:NSDateFormatterFullStyle timeStyle:NSDateFormatterNoStyle];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
