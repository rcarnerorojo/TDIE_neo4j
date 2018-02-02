//
//  RCRFirstViewController.m
//  TDIE_neo4j
//
//  Created by Ramón Carnero on 1/2/18.
//  Copyright © 2018 RCR. All rights reserved.
//

#import "RCRFirstViewController.h"
#import "RCRSecondViewController.h"

@interface RCRFirstViewController ()

@end

@implementation RCRFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.destinationViewController respondsToSelector:@selector(setUrlServer:)]){
        
        RCRSecondViewController *secondVC = [segue destinationViewController];
        
        NSString *hostname;
        if ([self.hostnameTF.text isEqualToString:@""]){
            hostname = @"http://192.168.1.67";
        }else{
            hostname = [NSString stringWithFormat:@"http://%@",self.hostnameTF.text];
        }
        
        NSString *port;
        if ([self.portTF.text isEqualToString:@""]){
            port = @":7474";
        }else{
            port = [NSString stringWithFormat:@":%@",self.portTF.text];
        }
        [secondVC setUrlServer:[NSString stringWithFormat:@"%@%@",hostname,port]];
    }
    
}

@end
