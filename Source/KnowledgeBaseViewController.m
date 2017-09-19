//
//  KnowledgeBaseViewController.m
//  Kustomer
//
//  Created by Daniel Amitay on 8/26/17.
//  Copyright © 2017 Kustomer. All rights reserved.
//

#import "KnowledgeBaseViewController.h"

#import "Kustomer_Private.h"
#import "KUSUserSession.h"

@interface KnowledgeBaseViewController ()

@end

@implementation KnowledgeBaseViewController

#pragma mark - Lifecycle methods

- (instancetype)init
{
    KUSUserSession *userSession = [Kustomer sharedInstance].userSession;
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://%@.kustomer.help/", userSession.orgName]];
    self = [super initWithURL:URL];
    if (self && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        self.modalPresentationStyle = UIModalPresentationFormSheet;
    }
    return self;
}

@end
