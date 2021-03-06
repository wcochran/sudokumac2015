//
//  SudokuView.h
//  SudokuMac2015
//
//  Created by Wayne O. Cochran on 4/23/15.
//  Copyright (c) 2015 Wayne O. Cochran. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class SudokuViewController;

@interface SudokuView : NSView

@property (weak, nonatomic) IBOutlet SudokuViewController *sudokuViewController;

@property (assign, nonatomic) NSInteger selectedCol;  // -1 => non selected, 0..8
@property (assign, nonatomic) NSInteger selectedRow;

@end
