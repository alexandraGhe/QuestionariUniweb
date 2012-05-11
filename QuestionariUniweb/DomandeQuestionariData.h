//
//  DomandeQuestionariData.h
//  QuestionarioWS
//
//  Created by Luca Ellade on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DomandeQuestionariData : NSObject
{
@private
    
    NSMutableString *responseString;
    
    int numeroDomande;
    
    NSMutableArray *DES;
    NSMutableArray *ORD_VIS;
    NSMutableArray *PARENT_QUESITO_ID;
    NSMutableArray *QUESITO_ID;
    NSMutableArray *QUESTIONARIO_ID;
    NSMutableArray *TIPO_ELEM_COD;
    NSMutableArray *TIPO_FORMATO_COD;


}

@property(nonatomic,retain)  NSMutableString *responseString;

@property int numeroDomande;

@property(retain,readwrite) NSMutableArray *DES;
@property(retain,readwrite) NSMutableArray *ORD_VIS;
@property(retain,readwrite) NSMutableArray *PARENT_QUESITO_ID;
@property(retain,readwrite) NSMutableArray *QUESITO_ID;
@property(retain,readwrite) NSMutableArray *QUESTIONARIO_ID;
@property(retain,readwrite) NSMutableArray *TIPO_ELEM_COD;
@property(retain,readwrite) NSMutableArray *TIPO_FORMATO_COD;


    //per definire l'istanza
+(DomandeQuestionariData * ) instance;
    //per cancellare i dati
-(void) clearData;

@end
