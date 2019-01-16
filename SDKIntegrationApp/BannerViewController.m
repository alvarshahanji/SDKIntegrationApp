//
//  BannerViewController.m
//  SDKIntegrationApp
//
//  Created by Varsha Hanji on 1/13/19.
//  Copyright © 2019 Varsha Hanji. All rights reserved.
//

#import "BannerViewController.h"
#import <AppLovinSDK/AppLovinSDK.h>

@interface BannerViewController ()<ALAdLoadDelegate, ALAdDisplayDelegate, ALAdViewEventDelegate>
@property (nonatomic, strong) ALAdView *adView;
@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.adView = [[ALAdView alloc] initWithFrame: CGRectMake(10, 100, 320, 50)
                                        size: [ALAdSize sizeBanner]
                                         sdk: [ALSdk shared]];
    // Do any additional setup after loading the view.
    self.adView.adLoadDelegate = self;
    self.adView.adDisplayDelegate = self;
    self.adView.adEventDelegate = self;

}
#pragma mark - Ad Load Delegate

- (void)adService:(ALAdService *)adService didLoadAd:(ALAd *)ad
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self popUpWithMessage:[NSString stringWithFormat:@"%s ",_cmd]];
}

- (void)adService:(ALAdService *)adService didFailToLoadAdWithError:(int)code
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

#pragma mark - Ad View Event Delegate

- (void)ad:(ALAd *)ad didPresentFullscreenForAdView:(ALAdView *)adView
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self popUpWithMessage:[NSString stringWithFormat:@"%s ",_cmd]];
}

- (void)ad:(ALAd *)ad willDismissFullscreenForAdView:(ALAdView *)adView
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self popUpWithMessage:[NSString stringWithFormat:@"%s ",_cmd]];
}

- (void)ad:(ALAd *)ad didDismissFullscreenForAdView:(ALAdView *)adView
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self popUpWithMessage:[NSString stringWithFormat:@"%s ",_cmd]];
}

- (void)ad:(ALAd *)ad willLeaveApplicationForAdView:(ALAdView *)adView
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self popUpWithMessage:[NSString stringWithFormat:@"%s ",_cmd]];
}

- (void)ad:(ALAd *)ad didFailToDisplayInAdView:(ALAdView *)adView withError:(ALAdViewDisplayErrorCode)code
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self popUpWithMessage:[NSString stringWithFormat:@"%s ",_cmd]];
}

- (IBAction)loadBannerAd:(id)sender {
    [self.adView loadNextAd];
    [self.view addSubview: self.adView];

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
