//
//  KUSSessionsViewController.h
//  Kustomer
//
//  Created by Daniel Amitay on 7/16/17.
//  Copyright © 2017 Kustomer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KUSAPIClient;
@interface KUSSessionsViewController : UIViewController

- (instancetype)initWithAPIClient:(KUSAPIClient *)apiClient;
- (instancetype)init NS_UNAVAILABLE;

@end
