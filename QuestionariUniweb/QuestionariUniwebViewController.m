//
//  QuestionariUniwebViewController.m
//  QuestionariUniweb
//
//  Created by Luca Ellade on 09/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QuestionariUniwebViewController.h"

#import "Utility.h"

    //Call Manager
#import "CercaQuestionari.h"

    //Dati ricevuti dal WS
#import "DisponibilitaQuestionariData.h"

   


@implementation QuestionariUniwebViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}
-(IBAction)cercaQuestionariFunzione:(id)sender
{
    NSString *titoloErrore = [[NSString alloc]initWithString:@"Attendi per piacere..."];
    
    
        // Creo e visualizzo l'alert personalizzata
    UIAlertView *popUpAttendi=[[UIAlertView alloc] initWithTitle:titoloErrore message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    
    
    
    [popUpAttendi show];
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]  
                                          initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];  
    
    indicator.center = CGPointMake(popUpAttendi.bounds.size.width / 2,   
                                   popUpAttendi.bounds.size.height - 40);  
    [indicator startAnimating];  
    [popUpAttendi addSubview:indicator];  
    
    [self performSelector:@selector(dismissAlert:) withObject:popUpAttendi afterDelay:0];
    
    
    [indicator release];
    [popUpAttendi release];
    
    
    
}
-(void)dismissAlert:(UIAlertView *)alertview
{
    UIViewController *chiamta = [[UIViewController alloc]init];
    
    CercaQuestionari *cercaQuestionari= [[CercaQuestionari alloc]initWhitView:chiamta ];
    [cercaQuestionari cercaQuestionariDisponibili] ;
    
    if([[DisponibilitaQuestionariData instance] isQuestionario])
        {
        [alertview dismissWithClickedButtonIndex:0 animated:YES];
        QuestionariUniwebViewController *tabellaQuestionari = [[QuestionariUniwebViewController alloc] initWithNibName:nil bundle:nil];
        [self presentModalViewController:tabellaQuestionari animated:NO];
        [tabellaQuestionari release];
        
        }
    else
        {
        [alertview dismissWithClickedButtonIndex:0 animated:YES];
        
        NSString *titoloErrore = [[NSString alloc] initWithString:@"Attenzione"];
        NSString *messagioErrore = [[NSString alloc] initWithString:@"Non ci sono questionari disponibili!"];
        
            // Creo e visualizzo l'alert personalizzata
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:titoloErrore message:messagioErrore delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
        
        
        
        }
    
    
    
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
