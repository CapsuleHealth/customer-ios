//
//  KUSUserSession.h
//  Kustomer
//
//  Created by Daniel Amitay on 8/13/17.
//  Copyright © 2017 Kustomer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KUSChatMessagesDataSource.h"
#import "KUSChatSessionsDataSource.h"
#import "KUSChatSettingsDataSource.h"
#import "KUSRequestManager.h"
#import "KUSTrackingTokenDataSource.h"
#import "KUSUserDataSource.h"

@interface KUSUserSession : NSObject

- (instancetype)initWithOrgName:(NSString *)orgName;
- (instancetype)init NS_UNAVAILABLE;

- (void)resetTracking;

// Org methods
- (NSString *)orgName;
- (NSString *)organizationName;

// Datasource objects
- (KUSChatSessionsDataSource *)chatSessionsDataSource;
- (KUSChatSettingsDataSource *)chatSettingsDataSource;
- (KUSTrackingTokenDataSource *)trackingTokenDataSource;

- (KUSChatMessagesDataSource *)chatMessagesDataSourceForSession:(KUSChatSession *)session;
- (KUSUserDataSource *)userDataSourceForUserId:(NSString *)userId;

// Request manager
- (KUSRequestManager *)requestManager;

@end
