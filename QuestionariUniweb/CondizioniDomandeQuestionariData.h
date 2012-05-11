//
//  CondizioniDomandeQuestionariData.h
//  QuestionarioWS
//
//  Created by Luca Ellade on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CondizioniDomandeQuestionariData : NSObject
{
@private
    
    NSMutableString *responseString;
    
    NSMutableArray *DES;
    NSMutableArray *OR_ID;
    NSMutableArray *QUESITO_COND_ID;
    NSMutableArray *QUESITO_ID;
    NSMutableArray *QUESTIONARIO_ID;



}
@property(nonatomic,retain)  NSMutableString *responseString;

@property(retain,readwrite) NSMutableArray *DES;
@property(retain,readwrite) NSMutableArray *OR_ID;
@property(retain,readwrite) NSMutableArray *QUESITO_COND_ID;
@property(retain,readwrite) NSMutableArray *QUESITO_ID;
@property(retain,readwrite) NSMutableArray *QUESTIONARIO_ID;


    //per definire l'istanza
+(CondizioniDomandeQuestionariData * ) instance;
    //per cancellare i dati
-(void) clearData;

@end
