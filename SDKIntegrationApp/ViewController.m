//
//  ViewController.m
//  SDKIntegrationApp
//
//  Created by Varsha Hanji on 1/13/19.
//  Copyright © 2019 Varsha Hanji. All rights reserved.
//

#import "ViewController.h"
#import "BannerViewController.h"
#import "InterstitialViewController.h"
#import "RewardedViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSArray *adTypes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    adTypes = [NSArray arrayWithObjects:@"Banner",@"Interstitial",@"RewardedAd",nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *segueIdentifier;
    switch (indexPath.row) {
        case 0:
            segueIdentifier = @"showBanner" ;
            break;
            
        case 1:
            segueIdentifier = @"showInterstitial" ;
            break;
            
        case 2:
            segueIdentifier = @"showRewarded" ;
            break;
            
        default:
            break;
    }
    [self performSegueWithIdentifier:segueIdentifier sender:self];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"adTypeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [adTypes objectAtIndex:indexPath.row];
    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [adTypes count];
}


@end
