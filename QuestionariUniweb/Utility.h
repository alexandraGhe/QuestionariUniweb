//
//  Utility.h
//  OneRing
//
//  Created by Alexandra Gheorghe on 2/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"




#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)


#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)


#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)


#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)


#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

@class Reachability;


@interface Utility : NSObject{
    
   Reachability* internetReachable;
    enum DevicesType
    {
        
        iPhone1G,   //0 
        iPhone3G,   //1
        iPhone3GS,  //2
        iPhone4,    //3
        iPhone4S,   //4
        iPod1stGen, //5
        iPod2ndGen, //6
        iPod3rdGen, //7
        iPod4thGen, //8
        iPad,       //9
        iPadWiFi,   //10
        iPad2,      //11
        iPad2WiFi,  //12
        iPad2GSM,   //13
        iPad2CDMA,  //14
        iPad3G,     //15
        Simulator,  //16
        Unknown     //17
    };
    
}

/*
+(NSString *) getTransactionId;
+(void) setTransactionId: (NSString *)transactionId;

+(NSString*)sha1ith64Base:(NSString *)stringtoencode;

//TokenAuth
+(NSString *) getTokenAuth;
+(void) setTokenAuth: (NSString *)tokenAuth;

//Username
+(NSString *) getUsername;
+(void) setUsername: (NSString *)username;

//credenziali cifrati
+(NSString *) getCredentials;
+(void) setCredentials: (NSString *)username;

//Loggato
+(BOOL) getLoggato;
+(void) setLoggato: (BOOL)logged;
*/
+(CGPoint) centerOfScreen;

@end
