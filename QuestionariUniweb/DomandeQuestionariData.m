//
//  DomandeQuestionariData.m
//  QuestionarioWS
//
//  Created by Luca Ellade on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DomandeQuestionariData.h"

@implementation DomandeQuestionariData

static DomandeQuestionariData *instance = nil;

@synthesize responseString;

@synthesize numeroDomande;

@synthesize DES;
@synthesize ORD_VIS;
@synthesize PARENT_QUESITO_ID;
@synthesize QUESITO_ID;
@synthesize QUESTIONARIO_ID;
@synthesize TIPO_ELEM_COD;
@synthesize TIPO_FORMATO_COD;


+ (DomandeQuestionariData *) instance
{
    if (instance == nil)
        {
        instance = [[super allocWithZone:NULL] init];
        [instance clearData];
        
        }
    
    return instance;
}

-(void)clearData
{
    self.numeroDomande = 0;
    
    self.DES = nil;
    self.ORD_VIS = nil;
    self.PARENT_QUESITO_ID=nil;
    self.QUESTIONARIO_ID=nil;
    self.TIPO_ELEM_COD=nil;
    self.TIPO_FORMATO_COD=nil;
   
    
}


@end
