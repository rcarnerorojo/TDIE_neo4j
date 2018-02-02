//
//  RCRSecondViewController.m
//  TDIE_neo4j
//
//  Created by Ramón Carnero on 1/2/18.
//  Copyright © 2018 RCR. All rights reserved.
//

#import "RCRSecondViewController.h"
#import "AFNetworking.h"
#import <AFNetworkActivityIndicatorManager.h>
#import "RCRCreateNodeCall.h"
#import "RCRCreateRelationshipCall.h"
#import "RCRQueryCall.h"

@interface RCRSecondViewController ()

@property (strong, nonatomic)  AFHTTPSessionManager* myAFHTTPSessionManager;
@property (nonatomic) NSString *idCreatedNode;

@end

@implementation RCRSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    
    // Session configuration setup
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    self.myAFHTTPSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:self.urlServer] sessionConfiguration:sessionConfiguration];
    
    AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
    [serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [serializer setValue:@"true" forHTTPHeaderField:@"X-Stream"];
    
    self.myAFHTTPSessionManager.requestSerializer = serializer;
    self.myAFHTTPSessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)createNode:(id)sender {
    
    NSDictionary *properties = @{@"nombre":@"John",@"apellido":@"McCain"};
    
    RCRCreateNodeCall *createNodeCall = [RCRCreateNodeCall new];
    [createNodeCall requestCreateNodeWithManager:self.myAFHTTPSessionManager
                                      properties:properties
                           withCompletionHandler:^(NSMutableDictionary *result, NSError *error) {
                               
                               if (error == nil){
                                   
                                   NSLog(@"éxito");
                                   NSLog(@"%@",result);
                                   
                                   self.outputTextView.text = [NSString stringWithFormat:@"Ok\n%@\n%@",[result objectForKey:@"metadata"],[result objectForKey:@"data"]];
                                   
                                   NSDictionary *metada = [result objectForKey:@"metadata"];
                                   self.idCreatedNode = [metada objectForKey:@"id"];
                                   NSLog(@"value creado node: %@", self.idCreatedNode);
                               }else{
                                   
                                   NSLog(@"%@",[error localizedDescription]);
                               }
                           }];
    
}

- (IBAction)createNodeAndRelationship:(id)sender {
    
    NSDictionary *properties = @{@"nombre":@"Sgt Al",@"apellido":@"Powell"};
    
    RCRCreateNodeCall *createNodeCall = [RCRCreateNodeCall new];
    [createNodeCall requestCreateNodeWithManager:self.myAFHTTPSessionManager
                                      properties:properties
                           withCompletionHandler:^(NSMutableDictionary *result, NSError *error) {
                               
                               if (error == nil){
                                   
                                   NSLog(@"éxito");
                                   NSLog(@"%@",result);
                                   
                                   NSDictionary *metada = [result objectForKey:@"metadata"];
                                   NSString *idCreatedSecondNode = [metada objectForKey:@"id"];
                                   NSLog(@"value creado segundo node: %@", idCreatedSecondNode);
                                   
                                   RCRCreateRelationshipCall *createRelationCall = [RCRCreateRelationshipCall new];
                                   [createRelationCall requestCreateRelationshipWithManager:self.myAFHTTPSessionManager
                                                                                  firstNode:self.idCreatedNode
                                                                                 secondNode:idCreatedSecondNode
                                                                               relationship:@"AMIGOS"
                                                                      withCompletionHandler:^(NSMutableDictionary *result, NSError *error) {
                                                                          
                                                                          if (error == nil){
                                                                              
                                                                              NSLog(@"éxito");
                                                                              NSLog(@"%@",result);
                                                                              
                                                                              self.outputTextView.text = [NSString stringWithFormat:@"Ok\n%@\n%@",[result objectForKey:@"metadata"],[result objectForKey:@"data"]];
                                                                              
                                                                          }else{
                                                                              
                                                                              NSLog(@"%@",[error localizedDescription]);
                                                                          }
                                                                          
                                                                      }];
                                   
                               }else{
                                   
                                   NSLog(@"%@",[error localizedDescription]);
                               }
                           }];
    
}

- (IBAction)showInfoNode:(id)sender {
    
    NSString *query = @"MATCH (x {nombre: 'John'})-[r]->(n) RETURN type(r), n.nombre, n.apellido";
    
    RCRQueryCall *queryCall = [RCRQueryCall new];
    [queryCall requestQueryWithManager:self.myAFHTTPSessionManager
                                 query:query
                 withCompletionHandler:^(NSMutableDictionary *result, NSError *error) {
                     
                     if (error == nil){
                         
                         NSLog(@"éxito");
                         NSLog(@"%@",result);
                         
                         self.outputTextView.text = [NSString stringWithFormat:@"Ok\n%@\n%@",[result objectForKey:@"columns"],[result objectForKey:@"data"]];
                     }else{
                         
                         NSLog(@"%@",[error localizedDescription]);
                     }
                     
                 }];
    
}

@end
