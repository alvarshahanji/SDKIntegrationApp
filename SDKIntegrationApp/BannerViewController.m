//
//  BannerViewController.m
//  SDKIntegrationApp
//
//  Created by Varsha Hanji on 1/13/19.
//  Copyright © 2019 Varsha Hanji. All rights reserved.
//

#import "BannerViewController.h"
#import <AppLovinSDK/AppLovinSDK.h>

//@interface BannerViewController ()<ALAdLoadDelegate, ALAdDisplayDelegate, ALAdViewEventDelegate>
//@property (nonatomic, strong) ALAdView *adView;
//@end

@interface BannerViewController()<MAAdViewAdDelegate>
@property (nonatomic, strong) MAAdView *adView;
@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.adView = [[ALAdView alloc] initWithFrame: CGRectMake(10, 100, 320, 50)
//                                        size: [ALAdSize sizeBanner]
//                                         sdk: [ALSdk shared]];
//    // Do any additional setup after loading the view.
//    self.adView.adLoadDelegate = self;
//    self.adView.adDisplayDelegate = self;
//    self.adView.adEventDelegate = self;
    self.adView = [[MAAdView alloc] initWithAdUnitIdentifier: @"BANNER_AD_UNIT_ID"];
    self.adView.delegate = self;
    
    if ( UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone )
    {
        self.adView.frame = CGRectMake(0, 100, 320, 60); // iPhone sizing is 320x50
    }
    else
    {
        self.adView.frame = CGRectMake(10, 100, 728, 90); // iPad sizing is 728x90
    }
    
    // Load the first ad
   
}

//
//#pragma mark - Ad Load Delegate
//
//- (void)adService:(ALAdService *)adService didLoadAd:(ALAd *)ad
//{
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    [self popUpWithMessage:[NSString stringWithFormat:@"%s ",_cmd]];
//}
//
//- (void)adService:(ALAdService *)adService didFailToLoadAdWithError:(int)code
//{
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    [self popUpWithMessage:[NSString stringWithFormat:@"%s with error code: %d ",_cmd,code]];
//}
//
//#pragma mark - Ad Display Delegate
//
//- (void)ad:(ALAd *)ad wasDisplayedIn:(UIView *)view
//{
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}
//
//- (void)ad:(ALAd *)ad wasHiddenIn:(UIView *)view
//{
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}
//
//- (void)ad:(ALAd *)ad wasClickedIn:(UIView *)view
//{
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}
//
//#pragma mark - Ad View Event Delegate
//
//- (void)ad:(ALAd *)ad didPresentFullscreenForAdView:(ALAdView *)adView
//{
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    [self popUpWithMessage:[NSString stringWithFormat:@"%s ",_cmd]];
//}
//
//- (void)ad:(ALAd *)ad willDismissFullscreenForAdView:(ALAdView *)adView
//{
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    [self popUpWithMessage:[NSString stringWithFormat:@"%s ",_cmd]];
//}
//
//- (void)ad:(ALAd *)ad didDismissFullscreenForAdView:(ALAdView *)adView
//{
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    [self popUpWithMessage:[NSString stringWithFormat:@"%s ",_cmd]];
//}
//
//- (void)ad:(ALAd *)ad willLeaveApplicationForAdView:(ALAdView *)adView
//{
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    [self popUpWithMessage:[NSString stringWithFormat:@"%s ",_cmd]];
//}
//
//- (void)ad:(ALAd *)ad didFailToDisplayInAdView:(ALAdView *)adView withError:(ALAdViewDisplayErrorCode)code
//{
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    [self popUpWithMessage:[NSString stringWithFormat:@"%s ",_cmd]];
//}
//
- (IBAction)loadBannerAd:(id)sender {
    [self.adView loadAd];
    self.adView.backgroundColor = [UIColor blueColor];
    [self.view addSubview: self.adView];
}
//
//-(void) popUpWithMessage :(NSString *)msg{
//    UIAlertController * alert = [UIAlertController
//                                 alertControllerWithTitle:@"Event"
//                                 message:msg
//                                 preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction* okButton = [UIAlertAction
//                               actionWithTitle:@"Ok"
//                               style:UIAlertActionStyleDefault
//                               handler:^(UIAlertAction * action) {
//                               }];
//
//    [alert addAction:okButton];
//    [self presentViewController:alert animated:YES completion:nil];
//}
#pragma mark - MAAdDelegate Protocol

- (void)didLoadAd:(MAAd *)ad {}

- (void)didFailToLoadAdForAdUnitIdentifier:(NSString *)adUnitIdentifier withErrorCode:(NSInteger)errorCode {}

- (void)didDisplayAd:(MAAd *)ad {}

- (void)didHideAd:(MAAd *)ad {}

- (void)didClickAd:(MAAd *)ad {}

- (void)didFailToDisplayAd:(MAAd *)ad withErrorCode:(NSInteger)errorCode {}

#pragma mark - MAAdViewAdDelegate Protocol

- (void)didExpandAd:(MAAd *)ad {}

- (void)didCollapseAd:(MAAd *)ad {}


@end
