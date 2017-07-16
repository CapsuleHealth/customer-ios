//
//  KUSChatViewController.h
//  Kustomer
//
//  Created by Daniel Amitay on 7/16/17.
//  Copyright © 2017 Kustomer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KUSAPIClient;
@class KUSChatSession;
@interface KUSChatViewController : UIViewController

- (instancetype)initForNewChatSessionWithAPIClient:(KUSAPIClient *)apiClient;
- (instancetype)initWithAPIClient:(KUSAPIClient *)apiClient forChatSession:(KUSChatSession *)session;
- (instancetype)init NS_UNAVAILABLE;

@end
