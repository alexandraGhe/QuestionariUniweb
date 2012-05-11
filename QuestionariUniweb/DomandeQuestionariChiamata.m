//
//  DomandeQuestionariChiamata.m
//  QuestionarioWS
//
//  Created by Alexandra Gheorghe on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DomandeQuestionariChiamata.h"
    //file dove vengono salvati tutti i dati del questionario
#import "DomandeQuestionariData.h"

@implementation DomandeQuestionariChiamata

@synthesize dataWebService; 
@synthesize responseString; 


-(DomandeQuestionariChiamata *) initWhitView:(UIViewController *)selfViewController
{
        self = [super init];
        
        if (self) {
            
            
            appDelegate = (QuestionariUniwebAppDelegate *)[[UIApplication sharedApplication] delegate];
            
            _selfViewController = selfViewController;
            
        }
        
        return self;

}

    //funzione che fa la chiamata per scaricare le domande
-(void)cercaDomandeQuestionario:(NSNumber *)numeroQuestionario
{
    UIViewController *call = [[UIViewController alloc]init];
    
    ConnectionCheck *connectioncall= [[ConnectionCheck alloc]initWhitView:call ];
    
    
    
    if( [connectioncall  getNetworkStatus] )
        
        {
        
        
        dataWebService = [[NSMutableData data] retain];
    
        NSMutableString *urlStringa = [[NSMutableString alloc] initWithString:@"http://test.apex-net.it/QuestWcfRestService/Service/API_QUEST_QUESITI?QUESTIONARIO_ID="];
            //viene aggiunto all'url il numero del questionario scelto
        [urlStringa appendString:[numeroQuestionario stringValue]];
        
        NSLog(@"url della chiamata:%@",urlStringa);
        
        NSURL  *urlDomandeQuestionari = [NSURL URLWithString:urlStringa ];
            //per fare la chiamata
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:urlDomandeQuestionari
                                                                    cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30];
        
        NSLog(@"la mia richiesta è : \n%@",request);
        
        
        [dataWebService setLength:0];
        
        dataWebService = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        responseString = [[NSMutableString alloc] initWithData:dataWebService encoding:NSUTF8StringEncoding];
        
        
        NSLog(@"Response: %@",responseString);
        
            //salva nel file DisponibilitàQuestioniData l'intera risposta 
        [[DomandeQuestionariData instance]setResponseString:responseString ];   
        

        if(![responseString isEqualToString:@"[]"] )
            {
        [self parseJsonDomandeQuestionario:responseString];
            }
        else
            {   
                NSLog(@"NON CI SONO DOMANDE");
            }

        
        }


}
    //funzione per fare il parse del file json
-(void)parseJsonDomandeQuestionario:(NSString *)stringaJson
{
        
        // Parse della stringa
    NSDictionary *json = [stringaJson JSONValue];

    [[DomandeQuestionariData instance] setDES:[json valueForKey:@"DES"]];
    NSLog(@"Le domande sono:\n%@", [[DomandeQuestionariData instance]DES] );
    
    
    [[DomandeQuestionariData instance] setORD_VIS:[json valueForKey:@"ORD_VIS"]];
    NSLog(@"L'ordine di visualizzazione è:\n%@", [[DomandeQuestionariData instance]ORD_VIS] );
    
    
    [[DomandeQuestionariData instance] setPARENT_QUESITO_ID:[json valueForKey:@"PARENT_QUESITO_ID"]];
    NSLog(@"I parent_quest_id sono:\n%@", [[DomandeQuestionariData instance]PARENT_QUESITO_ID] );
    
    
    [[DomandeQuestionariData instance] setQUESITO_ID:[json valueForKey:@"QUESITO_ID"]];
    NSLog(@"quesito id:\n%@", [[DomandeQuestionariData instance]QUESITO_ID] );
    
    
    [[DomandeQuestionariData instance] setQUESTIONARIO_ID:[json valueForKey:@"QUESTIONARIO_ID"]];
    NSLog(@"id questionario:\n%@", [[DomandeQuestionariData instance]QUESTIONARIO_ID] );
    
    
    [[DomandeQuestionariData instance] setNumeroDomande:[ [[DomandeQuestionariData instance]QUESTIONARIO_ID] count  ]];
    NSLog(@"Il questionario contiene:%d domande", [[DomandeQuestionariData instance] numeroDomande]);
    
    [[DomandeQuestionariData instance] setTIPO_ELEM_COD:[json valueForKey:@"TIPO_ELEM_COD"]];
    NSLog(@"Tipo elemento:\n%@", [[DomandeQuestionariData instance]TIPO_ELEM_COD] );
    
    
    [[DomandeQuestionariData instance] setTIPO_FORMATO_COD:[json valueForKey:@"TIPO_FORMATO_COD"]];
    NSLog(@"tipo formato:\n%@", [[DomandeQuestionariData instance]TIPO_FORMATO_COD] );
          
}

@end
