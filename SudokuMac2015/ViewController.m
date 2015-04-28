//
//  ViewController.m
//  SudokuMac2015
//
//  Created by Wayne O. Cochran on 4/23/15.
//  Copyright (c) 2015 Wayne O. Cochran. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)matrixButtonClicked:(NSMatrix *)sender {
    const NSInteger tag = [sender.selectedCell tag];
    NSLog(@"matrixButtonClicked:%d", (int)tag);
}

@end
