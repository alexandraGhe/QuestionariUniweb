//
//  QuestinnaireSearch.h
//  QuestionarioWS
//
//  Created by Alexandra Gheorghe on 07/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuestionariUniwebAppDelegate.h"

#import "ConnectionCheck.h"
#import "JSON.h"

@interface CercaQuestionari : NSObject<UIAlertViewDelegate>
{

    NSMutableString *responseString;
    NSMutableData *dataWebService;
    
    UIViewController *_selfViewController;
    
    QuestionariUniwebAppDelegate *appDelegate;
    
}
@property(nonatomic,retain)  NSMutableData *dataWebService; 
@property(nonatomic,retain) NSMutableString *responseString; 


//INIZIALIZZAZIONE
-(CercaQuestionari *) initWhitView:(UIViewController *)selfViewController;



//funzione che fa la chiamata per vedere se ci sono questionari disponibili
-(void)cercaQuestionariDisponibili;
//funzione per fare il parse del file json
-(void)parseJsonQuestionariDisponibili:(NSString *)stringaJson;


@end
