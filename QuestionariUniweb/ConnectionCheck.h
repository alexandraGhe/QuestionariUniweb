//
//  ConnectionCheck.h
//  QuestionarioWS
//
//  Created by Alexandra Gheorghe on 07/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIkit.h>

#import <Foundation/Foundation.h>
#import "QuestionariUniwebAppDelegate.h"
#import "Utility.h"
@class Reachability;

@interface ConnectionCheck : NSObject<UIAlertViewDelegate>
{
    Reachability *internetReachable;
    
    BOOL networkstatus;
    
    UIViewController *_selfViewController;
    
    QuestionariUniwebAppDelegate *appDelegate;
}
@property   BOOL networkstatus;


//INIZIALIZZAZIONE
-(ConnectionCheck *) initWhitView:(UIViewController *)selfViewController;


-(BOOL)getNetworkStatus;
-(void)checkNetworkStatus;


@end
