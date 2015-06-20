//
//  FMFestaViewController.m
//  fazendoMinhaFesta
//
//  Created by Fabio Gelbcke on 1/13/14.
//  Copyright (c) 2014 Fabio Gelbcke. All rights reserved.
//

#import "FMFestaViewController.h"
#import "ChecklistViewController.h"
@import GoogleMobileAds;


@interface FMFestaViewController ()
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;
@property(nonatomic, strong) GADInterstitial *interstitial;

@end

@implementation FMFestaViewController{
    int timesappeared;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Google Mobile Ads SDK version: %@", [GADRequest sdkVersion]);
    self.bannerView.adUnitID = @"ca-app-pub-6757078475726795/6620385509";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
    timesappeared = 1;
	// Do any additional setup after loading the view, typically from a nib.
    self.interstitial = [self createAndLoadInterstitial];
}

-(void)viewDidAppear:(BOOL)animated{
    if (![self isBeingPresented]){
        timesappeared++;
        if (timesappeared%4 == 0 && [self.interstitial isReady]) {
            [self.interstitial presentFromRootViewController:self];
        }
    }
}

- (GADInterstitial *)createAndLoadInterstitial {
    GADInterstitial *interstitial = [[GADInterstitial alloc] init];
    interstitial.adUnitID = @"ca-app-pub-6757078475726795/6620385509";
    interstitial.delegate = self;
    [interstitial loadRequest:[GADRequest request]];
    return interstitial;
}

- (void)interstitialDidDismissScreen:(GADInterstitial *)interstitial {
    self.interstitial = [self createAndLoadInterstitial];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goToChecklist {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    ChecklistViewController *checklist = (ChecklistViewController *)
    [storyboard instantiateViewControllerWithIdentifier:@"Checklist"];
    checklist.partyIndex=-1;
    [self presentViewController:checklist animated:YES completion:nil];
    

}

@end
