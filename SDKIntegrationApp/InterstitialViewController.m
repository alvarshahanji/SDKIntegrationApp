//
//  InterstitialViewController.m
//  SDKIntegrationApp
//
//  Created by Varsha Hanji on 1/13/19.
//  Copyright © 2019 Varsha Hanji. All rights reserved.
//

#import "InterstitialViewController.h"
#import <AppLovinSDK/AppLovinSDK.h>

static NSString *const kInterstitialZone1 = @"INTER_1";
static NSString *const kInterstitialZone2 = @"INTER_1";

/*
@interface InterstitialViewController ()<ALAdLoadDelegate, ALAdDisplayDelegate, ALAdVideoPlaybackDelegate>
@property (nonatomic, strong) ALAd *ad;
@property (nonatomic, strong) ALInterstitialAd *interstitialAd;
*/
@interface InterstitialViewController ()<MAAdDelegate>
@property (nonatomic, strong) MAInterstitialAd *interstitialAd;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;


@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
/*
    self.interstitialAd = [[ALInterstitialAd alloc] initWithSdk: [ALSdk shared]];
    
    // Optional: Assign delegates
    self.interstitialAd.adDisplayDelegate = self;
    self.interstitialAd.adVideoPlaybackDelegate = self;
*/
    self.interstitialAd = [[MAInterstitialAd alloc] initWithAdUnitIdentifier: kInterstitialZone1];
    self.interstitialAd.delegate = self;

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
   /* if (self.segmentedControl.selectedSegmentIndex == 0) {
        [[ALSdk shared].adService loadNextAdForZoneIdentifier: kInterstitialZone1 andNotify: self];
    } else if (self.segmentedControl.selectedSegmentIndex == 1){
        [[ALSdk shared].adService loadNextAdForZoneIdentifier: kInterstitialZone1 andNotify: self];
    }
    */
    [self.interstitialAd loadAd];

}

- (void)showInterstitialAd
{
    // Load an interstitial ad and be notified when the ad request is finished.
//    [self.interstitialAd showOver: [UIApplication sharedApplication].keyWindow andRender: self.ad];
    if ( [self.interstitialAd isReady] )
    {
        [self.interstitialAd showAd];
    }

}

/*
#pragma mark - Ad Load Delegate

- (void)adService:(nonnull ALAdService *)adService didLoadAd:(nonnull ALAd *)ad
{
    self.ad = ad;
    
    NSLog(@"%s with ZoneId : %@", __PRETTY_FUNCTION__,ad.zoneIdentifier);
    [self popUpWithMessage:[NSString stringWithFormat:@"%s with ZoneId : %@",_cmd,ad.zoneIdentifier]];
}

- (void)adService:(nonnull ALAdService *)adService didFailToLoadAdWithError:(int)code
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self popUpWithMessage:[NSString stringWithFormat:@"%s with error code: %d ",_cmd,code]];
}

#pragma mark - Ad Display Delegate

- (void)ad:(ALAd *)ad wasDisplayedIn:(UIView *)view
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)ad:(ALAd *)ad wasHiddenIn:(UIView *)view
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)ad:(ALAd *)ad wasClickedIn:(UIView *)view
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

#pragma mark - Ad Video Playback Delegate

- (void)videoPlaybackBeganInAd:(ALAd *)ad {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)videoPlaybackEndedInAd:(ALAd *)ad atPlaybackPercent:(NSNumber *)percentPlayed fullyWatched:(BOOL)wasFullyWatched {
    NSLog(@"%s atPlaybackPercent:%d", __PRETTY_FUNCTION__,percentPlayed);
}
*/
#pragma mark - MAAdDelegate Protocol

- (void)didLoadAd:(MAAd *)ad
{
}

- (void)didFailToLoadAdForAdUnitIdentifier:(NSString *)adUnitIdentifier withErrorCode:(NSInteger)errorCode
{
    // Interstitial ad failed to load. We recommend re-trying the load in 5 seconds
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
    });
}

- (void)didDisplayAd:(MAAd *)ad {}

- (void)didClickAd:(MAAd *)ad {}

- (void)didHideAd:(MAAd *)ad
{
    // Interstitial ad is hidden. Pre-load the next ad
\
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

- (void)didFailToDisplayAd:(MAAd *)ad withErrorCode:(NSInteger)errorCode
{
    // Interstitial ad failed to display. We recommend loading the next ad
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
-(void) popUpWithMessage :(NSString *)msg{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Event"
                                 message:msg
                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"Ok"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                               }];
    
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
