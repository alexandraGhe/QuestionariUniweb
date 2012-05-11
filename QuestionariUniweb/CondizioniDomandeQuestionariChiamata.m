//
//  CondizioniDomandeQuestionariChiamata.m
//  QuestionarioWS
//
//  Created by Luca Ellade on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CondizioniDomandeQuestionariChiamata.h"
    //file dove vengono salvati tutti i dati del questionario
#import "CondizioniDomandeQuestionariData.h"


@implementation CondizioniDomandeQuestionariChiamata

@synthesize dataWebService; 
@synthesize responseString; 

-(CondizioniDomandeQuestionariChiamata *) initWhitView:(UIViewController *)selfViewController
{
    self = [super init];
    
    if (self) {
        
        
        appDelegate = (QuestionariUniwebAppDelegate *)[[UIApplication sharedApplication] delegate];
        
        _selfViewController = selfViewController;
        
    }
    
    return self;
    
}


    //funzione che fa la chiamata per scaricare le domande
-(void)cercaCondizioniDomandeQuestionario:(NSNumber *)numeroQuestionario
{
    UIViewController *call = [[UIViewController alloc]init];
    
    ConnectionCheck *connectioncall= [[ConnectionCheck alloc]initWhitView:call ];
    
    
    
    if( [connectioncall  getNetworkStatus] )
        
        {
        
        
        dataWebService = [[NSMutableData data] retain];
        
        NSMutableString *urlStringa = [[NSMutableString alloc] initWithString:@"http://test.apexnet.it/QuestWcfRestService/Service/API_QUEST_CONDIZIONI?QUESTIONARIO_ID="];
            //viene aggiunto all'url il numero del questionario scelto
        [urlStringa appendString:[numeroQuestionario stringValue]];
        
        NSLog(@"url della chiamata:%@",urlStringa);

        NSURL  *urlCondizioniDomandeQuestionari = [NSURL URLWithString:urlStringa ];
            //per fare la chiamata
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:urlCondizioniDomandeQuestionari
                                                                    cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30];
        
        NSLog(@"la mia richiesta è :\n%@",request);
        
        
        [dataWebService setLength:0];
        
        dataWebService = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        responseString = [[NSMutableString alloc] initWithData:dataWebService encoding:NSUTF8StringEncoding];
        
        
        NSLog(@"Response: %@",responseString);
        
            //salva nel file CondizioniDomandeQuestionariData l'intera risposta 
        [[CondizioniDomandeQuestionariData instance]setResponseString:responseString ];   
        
        if(![responseString isEqualToString:@"[]"]  )
            {     
        [self parseJsonCondizioniDomandeQuestionario:responseString];
            }
        else
            {
            NSLog(@"NON CI SONO CONDIZIONI!!");
            }

        
        }
    
    
}

    //funzione per fare il parse del file json
-(void)parseJsonCondizioniDomandeQuestionario:(NSString *)stringaJson
{
   
        // Parse della stringa
    NSDictionary *json = [stringaJson JSONValue];
    
    [[CondizioniDomandeQuestionariData instance] setDES:[json valueForKey:@"DES"]];
    NSLog(@"Le domande sono:\n%@", [[CondizioniDomandeQuestionariData instance]DES] );
    
    [[CondizioniDomandeQuestionariData instance] setOR_ID:[json valueForKey:@"OR_ID"]];
    NSLog(@"L'ordine delle domande è:\n%@", [[CondizioniDomandeQuestionariData instance]OR_ID] );
    

    
    [[CondizioniDomandeQuestionariData instance] setQUESITO_COND_ID:[json valueForKey:@"QUESITO_COND_ID"]];
    NSLog(@"domanda cond:\n%@", [[CondizioniDomandeQuestionariData instance]QUESITO_COND_ID] );
    
    [[CondizioniDomandeQuestionariData instance] setQUESITO_ID:[json valueForKey:@"QUESITO_ID"]];
    NSLog(@"id della domanda :\n%@", [[CondizioniDomandeQuestionariData instance]QUESITO_ID] );
    

    [[CondizioniDomandeQuestionariData instance] setQUESTIONARIO_ID:[json valueForKey:@"QUESTIONARIO_ID"]];
    NSLog(@"il questionario è:\n%@", [[CondizioniDomandeQuestionariData instance]QUESTIONARIO_ID] );
    
        
    
}



@end
