//
//  KUSChatSessionsDataSource.h
//  Kustomer
//
//  Created by Daniel Amitay on 7/22/17.
//  Copyright © 2017 Kustomer. All rights reserved.
//

#import "KUSPaginatedDataSource.h"

#import "KUSChatSession.h"

@interface KUSChatSessionsDataSource : KUSPaginatedDataSource

- (void)createSessionWithTitle:(NSString *)title completion:(void(^)(NSError *error, KUSChatSession *session))completion;
- (void)updateLastSeenAtForSessionId:(NSString *)sessionId completion:(void(^)(NSError *error, KUSChatSession *session))completion;

// Sends custom attributes to the most active conversation, or the first conversation created
- (void)describeActiveConversation:(NSDictionary<NSString *, NSObject *> *)customAttributes completion:(void(^)(BOOL, NSError *))completion;

// Returns the latest date representing the last message received across all sessions
- (NSDate *)lastMessageAt;

@end
