//
//  DisponibilitaQuestionariData.m
//  QuestionarioWS
//
//  Created by Alexandra Gheorghe on 07/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DisponibilitaQuestionariData.h"

@implementation DisponibilitaQuestionariData

static DisponibilitaQuestionariData *instance = nil;

@synthesize responseString;
@synthesize isQuestionario;

@synthesize CONT_COD;
@synthesize DES;
@synthesize NOTE;
@synthesize QUESTIONARIO_COD;
@synthesize QUESTIONARIO_ID;

+ (DisponibilitaQuestionariData *) instance
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
    self.isQuestionario = FALSE;
    
    self.CONT_COD=nil;
    self.DES=nil;
    self.NOTE=nil;
    self.QUESTIONARIO_COD=nil;
    self.QUESTIONARIO_ID=nil;

}
@end
