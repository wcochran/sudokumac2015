//
//  OptionsViewController.h
//  SudokuMac2015
//
//  Created by Wayne O. Cochran on 4/30/15.
//  Copyright (c) 2015 Wayne O. Cochran. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SudokuViewController.h"

@interface OptionsViewController : NSViewController

@property (weak, nonatomic) SudokuViewController *sudokuViewController;

- (IBAction)cancel:(id)sender;

- (IBAction)newGame:(NSButton *)sender;
- (IBAction)clearCells:(id)sender;
- (IBAction)clearConflictingCells:(id)sender;

@end
