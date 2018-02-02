//
//  RCRSecondViewController.h
//  TDIE_neo4j
//
//  Created by Ramón Carnero on 1/2/18.
//  Copyright © 2018 RCR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCRSecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *outputTextView;

@property (strong, nonatomic) NSString *urlServer;

- (IBAction)createNode:(id)sender;
- (IBAction)createNodeAndRelationship:(id)sender;
- (IBAction)showInfoNode:(id)sender;

@end
