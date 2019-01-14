//
//  InterstitialViewController.m
//  SDKIntegrationApp
//
//  Created by Varsha Hanji on 1/13/19.
//  Copyright © 2019 Varsha Hanji. All rights reserved.
//

#import "InterstitialViewController.h"
#import <AppLovinSDK/AppLovinSDK.h>

@interface InterstitialViewController ()<ALAdLoadDelegate, ALAdDisplayDelegate, ALAdVideoPlaybackDelegate>
@property (nonatomic, strong) ALAd *ad;
@property (nonatomic, strong) ALInterstitialAd *interstitialAd;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;


@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interstitialAd = [[ALInterstitialAd alloc] initWithSdk: [ALSdk shared]];
    
    // Optional: Assign delegates
    self.interstitialAd.adDisplayDelegate = self;
    self.interstitialAd.adVideoPlaybackDelegate = self;

    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)loadInterstitialAd
{
    // Load an interstitial ad and be notified when the ad request is finished.
    //    [[ALSdk shared].adService loadNextAd: [ALAdSize sizeInterstitial] andNotify: self];
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        [[ALSdk shared].adService loadNextAdForZoneIdentifier: @"7f97ef8fe4cee84b" andNotify: self];
    } else if (self.segmentedControl.selectedSegmentIndex == 1){
        [[ALSdk shared].adService loadNextAdForZoneIdentifier: @"744ce718b78c6a9f" andNotify: self];
    }
}

- (void)showInterstitialAd
{
    // Load an interstitial ad and be notified when the ad request is finished.
    [self.interstitialAd showOver: [UIApplication sharedApplication].keyWindow andRender: self.ad];
}

#pragma mark - Ad Load Delegate

- (void)adService:(nonnull ALAdService *)adService didLoadAd:(nonnull ALAd *)ad
{
    self.ad = ad;
    // We now have an interstitial ad we can show!
    NSLog(@"Ola! No error");
    
}

- (void)adService:(nonnull ALAdService *)adService didFailToLoadAdWithError:(int)code
{
    NSLog(@"here we are : %d",code);
    // Look at ALErrorCodes.h for the list of error codes.
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (IBAction)loadInterstitial:(id)sender {
    [self loadInterstitialAd];
}
- (IBAction)showInterstitial:(id)sender {
    [self showInterstitialAd];
}

@end
