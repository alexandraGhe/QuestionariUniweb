//
//  QuestionariUniwebViewController.h
//  QuestionariUniweb
//
//  Created by Luca Ellade on 09/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionariUniwebViewController : UIViewController<UIAlertViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UIButton *cercaQuestionariBottone;
    
    
}

-(IBAction)cercaQuestionariFunzione:(id)sender;




@end
