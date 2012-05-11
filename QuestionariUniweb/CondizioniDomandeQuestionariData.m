//
//  CondizioniDomandeQuestionariData.m
//  QuestionarioWS
//
//  Created by Luca Ellade on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CondizioniDomandeQuestionariData.h"

@implementation CondizioniDomandeQuestionariData

static CondizioniDomandeQuestionariData *instance = nil;

@synthesize responseString;

@synthesize DES;
@synthesize OR_ID;
@synthesize QUESITO_COND_ID;
@synthesize QUESITO_ID;
@synthesize QUESTIONARIO_ID;


+ (CondizioniDomandeQuestionariData *) instance
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
    
    
    self.DES = nil;
    self.OR_ID = nil;
    self.QUESITO_COND_ID = nil;
    self.QUESITO_ID = nil;
    self.QUESTIONARIO_ID = nil;
    
}
@end
