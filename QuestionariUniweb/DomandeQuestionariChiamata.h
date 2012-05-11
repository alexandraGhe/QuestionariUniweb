//
//  DomandeQuestionariChiamata.h
//  QuestionarioWS
//
//  Created by Luca Ellade on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuestionariUniwebAppDelegate.h"

#import "ConnectionCheck.h"
#import "JSON.h"

@interface DomandeQuestionariChiamata : NSObject<UIAlertViewDelegate>
{
    NSMutableString *responseString;
    NSMutableData *dataWebService;
    
    UIViewController *_selfViewController;
    
    QuestionariUniwebAppDelegate *appDelegate;
    

}
@property(nonatomic,retain)  NSMutableData *dataWebService; 
@property(nonatomic,retain) NSMutableString *responseString; 

    //INIZIALIZZAZIONE
-(DomandeQuestionariChiamata *) initWhitView:(UIViewController *)selfViewController;

    //funzione che fa la chiamata per scaricare le domande
-(void)cercaDomandeQuestionario:(NSNumber *)numeroQuestionario;
    //funzione per fare il parse del file json
-(void)parseJsonDomandeQuestionario:(NSString *)stringaJson;





@end
