//
//  ViewController.h
//  SDKIntegrationApp
//
//  Created by Varsha Hanji on 1/13/19.
//  Copyright © 2019 Varsha Hanji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@end

