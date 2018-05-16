//
//  KUSChatSettingsDataSource.m
//  Kustomer
//
//  Created by Daniel Amitay on 7/31/17.
//  Copyright © 2017 Kustomer. All rights reserved.
//

#import "KUSChatSettingsDataSource.h"

#import "KUSObjectDataSource_Private.h"

@implementation KUSChatSettingsDataSource

#pragma mark - KUSObjectDataSource subclass methods

- (void)performRequestWithCompletion:(KUSRequestCompletion)completion
{
    [self.userSession.requestManager getEndpoint:@"/c/v1/chat/settings"
                                   authenticated:YES
                                      completion:completion];
}

- (Class)modelClass
{
    return [KUSChatSettings class];
}

- (BOOL)isChatAvailable
{
    KUSChatSettings *setting = self.object;
    return setting.enabled;
}

@end
