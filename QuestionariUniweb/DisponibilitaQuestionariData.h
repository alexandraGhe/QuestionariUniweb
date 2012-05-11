//
//  DisponibilitaQuestionariData.h
//  QuestionarioWS
//
//  Created by Alexandra Gheorghe on 07/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DisponibilitaQuestionariData : NSObject
{
@private
    
    NSMutableString *responseString;
        //booleano per verificare se ci sono questionari disponibili
    BOOL isQuestionario;
    NSMutableArray *CONT_COD;
    NSMutableArray *DES;
    NSMutableArray *NOTE;
    NSMutableArray *QUESTIONARIO_COD;
    NSMutableArray *QUESTIONARIO_ID;
}
@property(nonatomic,retain)  NSMutableString *responseString;

@property BOOL isQuestionario;

@property(retain,readwrite) NSMutableArray *CONT_COD;
@property(retain,readwrite) NSMutableArray *DES;
@property(retain,readwrite) NSMutableArray *NOTE;
@property(retain,readwrite) NSMutableArray *QUESTIONARIO_COD;
@property(retain,readwrite) NSMutableArray *QUESTIONARIO_ID;

    //per definire l'istanza
+(DisponibilitaQuestionariData * ) instance;
    //per cancellare i dati
-(void) clearData;


@end
