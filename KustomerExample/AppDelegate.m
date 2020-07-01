//
//  AppDelegate.m
//  KustomerExample
//
//  Created by Daniel Amitay on 7/1/17.
//  Copyright © 2017 Kustomer. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#import "Kustomer.h"

//#error A valid API key is required
static NSString *const kKustomerAPIKey = @"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVjMzRiZGU4MTVkNDQxMDA5NGI5OGNlNiIsInVzZXIiOiI1YzM0YmRlODk1NWMyMjAwMTI1N2EzZGUiLCJvcmciOiI1YzJmZTcyMzgyZmViNzAwMTkwOWIxYzIiLCJvcmdOYW1lIjoiY2Fwc3VsZS1zYW5kYm94IiwidXNlclR5cGUiOiJtYWNoaW5lIiwicm9sZXMiOlsib3JnLnRyYWNraW5nIl0sImF1ZCI6InVybjpjb25zdW1lciIsImlzcyI6InVybjphcGkiLCJzdWIiOiI1YzM0YmRlODk1NWMyMjAwMTI1N2EzZGUifQ.jbPlYKWz4He79KVkOMeUIQ8EFuqG0trUUvT3_kTp1Lc";

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Kustomer initializeWithAPIKey:kKustomerAPIKey];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[ViewController alloc] init];
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{

}

@end
