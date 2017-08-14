//
//  KUSUserSession.h
//  Kustomer
//
//  Created by Daniel Amitay on 8/13/17.
//  Copyright © 2017 Kustomer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KUSUserSession : NSObject

- (instancetype)initWithOrgName:(NSString *)orgName;
- (instancetype)init NS_UNAVAILABLE;

// Org methods
- (NSString *)orgName;
- (NSString *)organizationName;

@end
