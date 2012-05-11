//
//  ConnectionCheck.m
//  QuestionarioWS
//
//  Created by Alexandra Gheorghe on 07/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConnectionCheck.h"
#import "Reachability.h"

@implementation ConnectionCheck

@synthesize networkstatus;

-(ConnectionCheck *) initWhitView:(UIViewController *)selfViewController{
    self = [super init];
	
    if (self) {
		
        
        appDelegate = (QuestionariUniwebAppDelegate *)[[UIApplication sharedApplication] delegate];
        
		_selfViewController = selfViewController;
        
    }
	
    return self;
}

-(BOOL)getNetworkStatus
{
    [self checkNetworkStatus];
    NSLog(@"lo stato di interner = %@\n", (networkstatus ? @"YES" : @"NO")); 
    return networkstatus;
    
}
-(void)checkNetworkStatus
{   
    internetReachable = [[Reachability reachabilityForInternetConnection] retain];
	NetworkStatus internetStatus = [internetReachable currentReachabilityStatus];
    NSLog(@"Reachability OK");
    
    if (internetStatus == NotReachable)  
        { 
            networkstatus = FALSE;
            NSString *titoloErrore = @"Attenzione";
            NSString *messagioErrore = @"La connessione internet non è funzionante!";
            
            
                // [UIAlertView setBackgroundColor:UIColorFromRGB(0x6a3131) withStrokeColor:[UIColor whiteColor]];
                // Creo e visualizzo l'alert personalizzata
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:titoloErrore message:messagioErrore delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
            
            
            
            
        }
    else 
        {
        networkstatus = TRUE;
        }
    
}


@end
