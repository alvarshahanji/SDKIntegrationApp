//
//  RewardedViewController.m
//  SDKIntegrationApp
//
//  Created by Varsha Hanji on 1/13/19.
//  Copyright © 2019 Varsha Hanji. All rights reserved.
//

#import "RewardedViewController.h"
#import <AppLovinSDK/AppLovinSDK.h>

static NSString *const kRewardedZone1 = @"REWARD_AD_UNIT_ID";
static NSString *const kRewardedZone2 = @"REWARD_AD_UNIT_ID";

//@interface RewardedViewController ()<ALAdLoadDelegate, ALAdRewardDelegate, ALAdDisplayDelegate, ALAdVideoPlaybackDelegate>
////@property (nonatomic, strong) ALAd *ad;
//@property (nonatomic, strong) ALIncentivizedInterstitialAd *incentivizedInterstitialZone1;
//@property (nonatomic, strong) ALIncentivizedInterstitialAd *incentivizedInterstitialZone2;
//@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
//@end

@interface RewardedViewController()<MARewardedAdDelegate>
@property (nonatomic, strong) MARewardedAd *rewardedAd;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@end

@implementation RewardedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)loadRewardedAd
{
   /* if (self.segmentedControl.selectedSegmentIndex == 0) {
        self.incentivizedInterstitialZone1 = [[ALIncentivizedInterstitialAd alloc] initWithZoneIdentifier: kRewardedZone1];
        [ALIncentivizedInterstitialAd setUserIdentifier: @"DEMO_USER_IDENTIFIER"];
        [self.incentivizedInterstitialZone1 preloadAndNotify: self];
    } else if (self.segmentedControl.selectedSegmentIndex == 1){
        self.incentivizedInterstitialZone2 = [[ALIncentivizedInterstitialAd alloc] initWithZoneIdentifier: kRewardedZone2];
        [ALIncentivizedInterstitialAd setUserIdentifier: @"DEMO_USER_IDENTIFIER"];
        [self.incentivizedInterstitialZone2 preloadAndNotify:self];
    }
    */
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        self.rewardedAd = [MARewardedAd sharedWithAdUnitIdentifier: kRewardedZone1];
    } else if (self.segmentedControl.selectedSegmentIndex == 1){
        self.rewardedAd = [MARewardedAd sharedWithAdUnitIdentifier: kRewardedZone2];
    }
    self.rewardedAd.delegate = self;
    [self.rewardedAd loadAd];

}

- (void)showRewardedAd
{
    if ( [self.rewardedAd isReady] )
    {
        [self.rewardedAd showAd];
    }

    /*
    if (self.segmentedControl.selectedSegmentIndex == 0){
        if ( self.incentivizedInterstitialZone1.isReadyForDisplay ){
            // Optional: Assign delegates
            self.incentivizedInterstitialZone1.adDisplayDelegate = self;
            self.incentivizedInterstitialZone1.adVideoPlaybackDelegate = self;
            
            [self.incentivizedInterstitialZone1 showAndNotify: self];
        }
        else
        {
            [self loadRewardedAd];
        }
    }
    else if (self.segmentedControl.selectedSegmentIndex == 1){
        if ( self.incentivizedInterstitialZone2.isReadyForDisplay ){
            // Optional: Assign delegates
            self.incentivizedInterstitialZone2.adDisplayDelegate = self;
            self.incentivizedInterstitialZone2.adVideoPlaybackDelegate = self;
            
            [self.incentivizedInterstitialZone2 showAndNotify: self];
        }
        else{
            [self loadRewardedAd];
        }
    }
     */
}

//#pragma mark - Ad Load Delegate
//
//- (void)adService:(nonnull ALAdService *)adService didLoadAd:(nonnull ALAd *)ad
//{
//    NSLog(@"%s with ZoneId : %@", __PRETTY_FUNCTION__,ad.zoneIdentifier);
//    [self popUpWithMessage:[NSString stringWithFormat:@"%s with ZoneId : %@",_cmd,ad.zoneIdentifier]];
//}
//
//- (void)adService:(nonnull ALAdService *)adService didFailToLoadAdWithError:(int)code
//{
//    NSLog(@"%s  %d", __PRETTY_FUNCTION__,code);
//    [self popUpWithMessage:[NSString stringWithFormat:@"%s error code: %d ",_cmd, code]];
//}
//
//#pragma mark - Ad Reward Delegate
//
//- (void)rewardValidationRequestForAd:(ALAd *)ad didSucceedWithResponse:(NSDictionary *)response
//{
//    NSString *currencyName = response[@"currency"];
//    NSString *amountGivenString = response[@"amount"];
//    NSNumber *amountGiven = @([amountGivenString floatValue]);
//
//    NSLog(@"%s : %@ %@", __PRETTY_FUNCTION__,amountGiven, currencyName);
//    [self popUpWithMessage:[NSString stringWithFormat:@"%s : %@ %@",_cmd,amountGiven, currencyName]];
//}
//
//- (void)rewardValidationRequestForAd:(ALAd *)ad didFailWithError:(NSInteger)responseCode
//{
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    [self popUpWithMessage:[NSString stringWithFormat:@"%s with error code: %d ",_cmd,responseCode]];
//}
//
//- (void)rewardValidationRequestForAd:(ALAd *)ad didExceedQuotaWithResponse:(NSDictionary *)response
//{
//    NSLog(@"%s : %@", __PRETTY_FUNCTION__,response);
//
//}
//
//- (void)rewardValidationRequestForAd:(ALAd *)ad wasRejectedWithResponse:(NSDictionary *)response
//{
//    NSLog(@"%s : %@", __PRETTY_FUNCTION__,response);
//}
//
//- (void)userDeclinedToViewAd:(ALAd *)ad
//{
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}
//
//#pragma mark - Ad Display Delegate
//
//- (void)ad:(ALAd *)ad wasDisplayedIn:(UIView *)view
//{
//    NSLog( @"Ad Displayed");
//}
//
//- (void)ad:(ALAd *)ad wasHiddenIn:(UIView *)view
//{
//    NSLog( @"Ad Dismissed");
//}
//
//- (void)ad:(ALAd *)ad wasClickedIn:(UIView *)view
//{
//    NSLog( @"Ad Clicked");
//}
//
//#pragma mark - Ad Video Playback Delegate
//
//- (void)videoPlaybackBeganInAd:(ALAd *)ad {
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}
//
//- (void)videoPlaybackEndedInAd:(ALAd *)ad atPlaybackPercent:(NSNumber *)percentPlayed fullyWatched:(BOOL)wasFullyWatched {
//    NSLog(@"%s atPlaybackPercent:%d", __PRETTY_FUNCTION__,percentPlayed);
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)loadRewardedAd:(id)sender {
    [self loadRewardedAd];
}
- (IBAction)showRewardedAd:(id)sender {
    [self showRewardedAd];
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
#pragma mark - MAAdDelegate Protocol

- (void)didLoadAd:(MAAd *)ad
{
    NSLog(@"ALMediationAdapterWrapper : didLoadAd");
    // Rewarded ad is ready to be shown. '[self.rewardedAd isReady]' will now return 'YES'
}

- (void)didFailToLoadAdForAdUnitIdentifier:(NSString *)adUnitIdentifier withErrorCode:(NSInteger)errorCode
{
    NSLog(@"ALMediationAdapterWrapper : didFailToLoadAdForAdUnitIdentifier");

}

- (void)didDisplayAd:(MAAd *)ad {
    NSLog(@"ALMediationAdapterWrapper : didDisplayAd");
}

- (void)didClickAd:(MAAd *)ad {
    NSLog(@"ALMediationAdapterWrapper : didClickAd");
}

- (void)didHideAd:(MAAd *)ad
{
    NSLog(@"ALMediationAdapterWrapper : didHideAd");
}

- (void)didFailToDisplayAd:(MAAd *)ad withErrorCode:(NSInteger)errorCode
{
    NSLog(@"ALMediationAdapterWrapper : didFailToDisplayAd");
}

#pragma mark - MARewardedAdDelegate Protocol

- (void)didStartRewardedVideoForAd:(MAAd *)ad {
    NSLog(@"ALMediationAdapterWrapper : didStartRewardedVideoForAd");
}

- (void)didCompleteRewardedVideoForAd:(MAAd *)ad {
    NSLog(@"ALMediationAdapterWrapper : didCompleteRewardedVideoForAd");
}

- (void)didRewardUserForAd:(MAAd *)ad withReward:(MAReward *)reward
{
    NSLog(@"ALMediationAdapterWrapper : didRewardUserForAd");
}

@end
