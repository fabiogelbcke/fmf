//
//  CalcResultsViewController.m
//  fazendoMinhaFesta
//
//  Created by Fabio Gelbcke on 1/26/14.
//  Copyright (c) 2014 Fabio Gelbcke. All rights reserved.
//

#import "CalcResultsViewController.h"

@interface CalcResultsViewController ()

@end

@implementation CalcResultsViewController

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
	// Do any additional setup after loading the view.
    int adults = [self.adultsQty intValue];
    int children = [self.childrenQty intValue];
    NSString *cake = [NSString stringWithFormat:@"%dg", 70*adults+ 25*children];
    NSString *treats = [NSString stringWithFormat:@"%.1f", 10.0*adults + 3.0*children];
    NSString *candy = [NSString stringWithFormat:@"%d", 6*adults + 2*children];
    NSString *soda = [NSString stringWithFormat:@"%.1fL", 0.5*adults + 0.2*children];
    NSString *beer;
    NSString *wine;
   /* if (self.partyType.isOn==YES){
        beer = [NSString stringWithFormat:@"%.0f Latas", 1.5*adults];
        wine = [NSString stringWithFormat:@"%f.1L", 0.25*adults];
    }
    else{*/
        beer = [NSString stringWithFormat:@"%.0f Latas", 0.5*adults];
        wine = [NSString stringWithFormat:@"%.1fL", 0.1*adults];
    //}
     self.cakeqty.text=cake;
     self.treatsqty.text=treats;
     self.candyqty.text=candy;
     self.sodaqty.text=soda;
     self.beerqty.text=beer;
     self.wineqty.text=wine;

}
- (IBAction)backToMenu {
    
    [self dismissViewControllerAnimated:NO completion:nil];
    //[self.parentViewController dismissViewControllerAnimated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
