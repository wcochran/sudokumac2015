//
//  SudokuBoard.h
//  MySudoku
//
//  Created by Wayne Cochran on 1/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SudokuPuzzle : NSObject

-(instancetype)init;
-(void)freshGame:(NSString*)boardString;

-(NSArray*)savedState;
-(void)setState:(NSArray*)boardArray;

-(int)numberAtRow:(int)r Column:(int)c;
-(void)setNumber:(int)n AtRow:(int)r Column:(int)c;
-(BOOL)numberIsFixedAtRow:(int)r Column:(int)c;

-(BOOL)anyPencilsSetAtRow:(int)r Column:(int)c;
-(int)numberOfPencilsSetAtRow:(int)r Column:(int)c;
-(BOOL)isSetPencil:(int)n AtRow:(int)r Column:(int)c;
-(void)setPencil:(int)n AtRow:(int)r Column:(int)c;
-(void)clearPencil:(int)n AtRow:(int)r Column:(int)c;
-(void)clearAllPencilsAtRow:(int)r Column:(int)c;

@end
