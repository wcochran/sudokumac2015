//
//  ViewController.h
//  SudokuMac2015
//
//  Created by Wayne O. Cochran on 4/23/15.
//  Copyright (c) 2015 Wayne O. Cochran. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SudokuPuzzle.h"
#import "SudokuView.h"


@interface SudokuViewController : NSViewController

@property (strong, nonatomic) SudokuPuzzle *sudokuPuzzle;
@property (weak) IBOutlet SudokuView *sudokuView;

-(void)newGame:(NSInteger)level; // level = 0,1,2,3
-(void)clearCells;
-(void)clearConflictingCells;

@end

