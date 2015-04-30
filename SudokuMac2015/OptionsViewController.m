//
//  OptionsViewController.m
//  SudokuMac2015
//
//  Created by Wayne O. Cochran on 4/30/15.
//  Copyright (c) 2015 Wayne O. Cochran. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()

@end

@implementation OptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)cancel:(id)sender {
    [self dismissViewController:self];
}

- (IBAction)newGame:(NSButton *)sender {
    NSInteger tag = sender.tag;
    [self.sudokuViewController newGame:tag-1];
    [self dismissViewController:self];
}

- (IBAction)clearCells:(id)sender {
    [self.sudokuViewController clearCells];
    [self dismissViewController:self];
}

- (IBAction)clearConflictingCells:(id)sender {
    [self.sudokuViewController clearConflictingCells];
    [self dismissViewController:self];
}

@end
