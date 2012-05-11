//
//  Utility.m
//  OneRing
//
//  Created by Alexandra Gheorghe on 2/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Utility.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <SystemConfiguration/SCNetworkReachability.h>
#import <CommonCrypto/CommonDigest.h>

#include <ifaddrs.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#import "Reachability.h"



@implementation Utility


/*
//1ring
//Ritorna il TransactionId
+(NSString *)getTransactionId{
	NSString *transactionId = [[NSUserDefaults standardUserDefaults] objectForKey:@"TransactionId"];
	return transactionId;	
}

//Imposto il TransactionId nei settaggi dell'utente
+(void)setTransactionId: (NSString *)transactionId{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:transactionId forKey:@"TransactionId"];
	[defaults synchronize];
}

+(NSString*)sha1ith64Base:(NSString *)stringtoencode {
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    const char *cStr = [stringtoencode UTF8String];
    CC_SHA1(cStr, strlen(cStr), result);
    NSData *pwHashData = [[NSData alloc] initWithBytes:result length: sizeof result];
    NSString *base64 =  [Base64 encode:pwHashData];
    NSLog(@"SHA1 in base64 %@",base64);
    return  base64;
}

//Ritorna il TokenAuth
+(NSString *)getTokenAuth{
	NSString *tokenAuth = [[NSUserDefaults standardUserDefaults] objectForKey:@"TokenAuth"];
	return tokenAuth;	
}

//Imposto il TokenAuth nei settaggi dell'utente
+(void)setTokenAuth: (NSString *)tokenAuth{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:tokenAuth forKey:@"TokenAuth"];
	[defaults synchronize];
}

//Ritorna lo Username
+(NSString *)getUsername{
	NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"Username"];
	return username;	
}

//Imposto lo Username nei settaggi dell'utente
+(void) setUsername: (NSString *)username{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:username forKey:@"Username"];
	[defaults synchronize];
}
//credenziali cifrati
+(NSString *) getCredentials{
    NSString *credentials = [[NSUserDefaults standardUserDefaults] objectForKey:@"Credentials"];
	return credentials;	



}
+(void) setCredentials: (NSString *)Credentials
{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:Credentials forKey:@"Credentials"];
	[defaults synchronize];

}




//Ritorna il Logged
+(BOOL)getLoggato{
    NSString* strLogged = [[NSUserDefaults standardUserDefaults] objectForKey:@"Loggato"];
    if([strLogged isEqualToString:@"Y"])
        return true;
    else
        return false;
}

//Imposto il Logged nei settaggi dell'utente
+(void)setLoggato:(BOOL)logged {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(logged)
        [defaults setObject:@"Y" forKey:@"Loggato"];
    else
        [defaults setObject:@"N" forKey:@"Loggato"];
	[defaults synchronize];
}
 */
+(CGPoint)centerOfScreen{
	
	CGRect device = [[UIScreen mainScreen] applicationFrame];
	
	CGPoint center;
	center.x = device.size.width / 2;
	center.y = device.size.height / 2;
	
	return center;
}



@end
