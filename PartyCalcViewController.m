//
//  PartyCalcViewController.m
//  fazendoMinhaFesta
//
//  Created by Fabio Gelbcke on 2/20/14.
//  Copyright (c) 2014 Fabio Gelbcke. All rights reserved.
//

#import "PartyCalcViewController.h"

@interface PartyCalcViewController ()
@property (strong, nonatomic) UISwitch *partyType;

@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UIImageView *pinkbar;

@end

@implementation PartyCalcViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.parameters = [[defaults objectForKey:@"paramsarray"] objectAtIndex:self.partyIndex];
    self.navBar.topItem.title=[self.parameters objectAtIndex:0];
	// Do any additional setup after loading the view.
    int adults = [[self.parameters objectAtIndex:2] intValue];
    int children = [[self.parameters objectAtIndex:3] intValue];
    NSString *cake = [NSString stringWithFormat:@"%dg", 70*adults+ 25*children];
    NSString *treats = [NSString stringWithFormat:@"%.0f", 10.0*adults + 3*children];
    NSString *candy = [NSString stringWithFormat:@"%d", 6*adults + 2*children];
    NSString *soda = [NSString stringWithFormat:@"%.1fL", 0.5*adults + 0.2*children];
    NSString *beer;
    NSString *wine;
    /*if (self.partyType.isOn==YES){
        beer = [NSString stringWithFormat:@"%.0f Latas", 1.5*adults];
        wine = [NSString stringWithFormat:@"%f.1L", 0.25*adults];
    }
    else{*/
        beer = [NSString stringWithFormat:@"%.0f latas", 0.5*adults];
        wine = [NSString stringWithFormat:@"%.1fL", 0.1*adults];
    //}
    self.cakeqty.text=cake;
    self.treatsqty.text=treats;
    self.candyqty.text=candy;
    self.sodaqty.text=soda;
    self.beerqty.text=beer;
    self.wineqty.text=wine;
    [self.view sendSubviewToBack:self.pinkbar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
