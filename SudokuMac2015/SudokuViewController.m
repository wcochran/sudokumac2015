//
//  ViewController.m
//  SudokuMac2015
//
//  Created by Wayne O. Cochran on 4/23/15.
//  Copyright (c) 2015 Wayne O. Cochran. All rights reserved.
//

#import "SudokuViewController.h"
#import "OptionsViewController.h"

@implementation SudokuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.sudokuPuzzle = [[SudokuPuzzle alloc] init];
    [self newGame:0];  // load initial beginner level puzzle
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

#define OPTIONS_MENU_TAG 12  // defined in IB (buttonCell tag)

- (IBAction)matrixButtonClicked:(NSMatrix *)sender {
    const NSInteger tag = [sender.selectedCell tag];
    NSLog(@"matrixButtonClicked:%d", (int)tag);
    
    if (tag == OPTIONS_MENU_TAG) {
        [self performSegueWithIdentifier:@"showOptionsSegue" sender:self];
    }
}

-(void)prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showOptionsSegue"]) {
        OptionsViewController *vc = (OptionsViewController*)segue.destinationController;
        vc.sudokuViewController = self;
    }
}

-(void)newGame:(NSInteger)level { // level = 0,1,2,3
    NSLog(@"newGame: %d", (int)level);
    static NSString *levelNames[] = {
      @"sudoku-easy", @"sudoku-simple", @"sudoku-intermediate", @"sudoku-expert"
    };
    NSString *fileName = [[NSBundle mainBundle] pathForResource:levelNames[level]
                                                         ofType:@"plist"];
    NSArray *games = [NSArray arrayWithContentsOfFile:fileName];
    NSString *game = [games objectAtIndex:arc4random() % games.count];
    
    [self.sudokuPuzzle freshGame:game];  // load new in puzzle game
    
    self.sudokuView.needsDisplay = YES;
}

-(void)clearCells {
    NSLog(@"clearCells");
}

-(void)clearConflictingCells {
    NSLog(@"clearConflictingCells");
}


@end
