//
//  QuestinnaireSearch.m
//  QuestionarioWS
//
//  Created by Alexandra Gheorghe on 07/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CercaQuestionari.h"
    //file dove mi salvo i dati ritornati dal web service
#import "DisponibilitaQuestionariData.h"

@implementation CercaQuestionari

@synthesize dataWebService; 
@synthesize responseString; 



-(CercaQuestionari *) initWhitView:(UIViewController *)selfViewController{
    self = [super init];
	
    if (self) {
		
        
        appDelegate = (QuestionariUniwebAppDelegate *)[[UIApplication sharedApplication] delegate];
        
		_selfViewController = selfViewController;
               		
    }
	
    return self;
}





//funzione che fa la chiamata per vedere se ci sono questionari disponibili
-(void)cercaQuestionariDisponibili
{
    UIViewController *call = [[UIViewController alloc]init];
    
    ConnectionCheck *connectioncall= [[ConnectionCheck alloc]initWhitView:call ];
    
    
    
    if( [connectioncall  getNetworkStatus] )
        
        {
        
        
        dataWebService = [[NSMutableData data] retain];
        
        
        NSURL  *urlQuestionariDisponibili = [NSURL URLWithString: @"http://test.apex-net.it/QuestWcfRestService/Service/API_QUEST_LISTA"];
            //per fare la chiamata
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:urlQuestionariDisponibili
                                                                    cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:20];
                
        NSLog(@"la mia richiesta è : \n%@",request);
        
        
        [dataWebService setLength:0];
        
        dataWebService = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        responseString = [[NSMutableString alloc] initWithData:dataWebService encoding:NSUTF8StringEncoding];
        
        
        NSLog(@"Response: %@",responseString);
        
            //salva nel file DisponibilitàQuestioniData l'intera risposta 
        [[DisponibilitaQuestionariData instance]setResponseString:responseString ];   
        
        
         if(![responseString isEqualToString:@"[]"] )
             {
        [self parseJsonQuestionariDisponibili:responseString];
             }
        
         else
             {
             NSLog(@"NON CI SONO QUESTIONARI DISPONIBILI!!!");
             }
        

        
        }
    

        



}
    //funzione per fare il parse del file json
-(void)parseJsonQuestionariDisponibili:(NSString *)stringaJson
{
    
    
        // Parse della stringa
    NSDictionary *json = [stringaJson JSONValue];
    
    [[DisponibilitaQuestionariData instance] setCONT_COD:[json valueForKey:@"CONT_COD"]];
    NSLog(@"CONT_COD:%@",[[DisponibilitaQuestionariData instance] CONT_COD]);
    
    if([[DisponibilitaQuestionariData instance] CONT_COD]!= nil)
        {
        [[DisponibilitaQuestionariData instance] setIsQuestionario:TRUE];
        NSLog(@"Ci sono questionari disponibili");
        }
    
    
    [[DisponibilitaQuestionariData instance] setDES:[json valueForKey:@"DES"]];
    NSLog(@"DES:%@",[[DisponibilitaQuestionariData instance] DES]);

  
    [[DisponibilitaQuestionariData instance] setNOTE:[json valueForKey:@"NOTE"]];
    NSLog(@"NOTE:%@",[[DisponibilitaQuestionariData instance] NOTE]);
    
    [[DisponibilitaQuestionariData instance] setQUESTIONARIO_COD:[json valueForKey:@"QUESTIONARIO_COD"]];
    NSLog(@"QUESTIONARIO_COD:%@",[[DisponibilitaQuestionariData instance] QUESTIONARIO_COD]);
    
    [[DisponibilitaQuestionariData instance] setQUESTIONARIO_ID:[json valueForKey:@"QUESTIONARIO_ID"]];
     NSLog(@"QUESTIONARIO_ID:%@",[[DisponibilitaQuestionariData instance] QUESTIONARIO_ID]);
          
}

@end
