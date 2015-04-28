//
//  SudokuView.m
//  SudokuMac2015
//
//  Created by Wayne O. Cochran on 4/23/15.
//  Copyright (c) 2015 Wayne O. Cochran. All rights reserved.
//

#import "SudokuView.h"

@implementation SudokuView

-(void)awakeFromNib {
    [super awakeFromNib];
    _selectedCol = -1;  // no cell selection yet
    _selectedRow = -1;
}

-(CGRect)boardRectangle {
    return NSMakeRect(10, 10,
                      self.bounds.size.width - 20, self.bounds.size.height - 20);
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    NSLog(@"drawRect:");
    
    NSRect boardRect = [self boardRectangle];
    
    const NSSize cellSize = NSMakeSize(boardRect.size.width/9,
                                       boardRect.size.height/9);
    
    if (self.selectedCol >= 0 && self.selectedRow >= 0) {
        [[NSColor blueColor] setFill];
        const NSRect rect = NSMakeRect(boardRect.origin.x + self.selectedCol*cellSize.width,
                                       boardRect.origin.y + self.selectedRow*cellSize.height,
                                       cellSize.width, cellSize.height);
        [NSBezierPath fillRect:rect];
    }
    
    [[NSColor blackColor] setStroke];
    [NSBezierPath setDefaultLineWidth:5.0];

    [NSBezierPath strokeRect:boardRect];
    
    const CGFloat blockWidth = boardRect.size.width / 3;
    const CGFloat blockHeight = boardRect.size.height / 3;
    for (int i = 1; i <= 2; i++) {
        [NSBezierPath strokeLineFromPoint:NSMakePoint(boardRect.origin.x +  i*blockWidth,
                                                      boardRect.origin.y)
                                  toPoint:NSMakePoint(boardRect.origin.x + i*blockWidth,
                                                      boardRect.origin.y + boardRect.size.height)];
        [NSBezierPath strokeLineFromPoint:NSMakePoint(boardRect.origin.x,
                                                      boardRect.origin.y + i*blockHeight)
                                  toPoint:NSMakePoint(boardRect.origin.x + boardRect.size.width,
                                                      boardRect.origin.y + i*blockHeight)];
    }
    
    [NSBezierPath setDefaultLineWidth:2.0];
    
    const CGFloat cellWidth = blockWidth / 3;
    const CGFloat cellHeight = blockHeight / 3;
    for (int i = 1; i <= 8; i++) {
        if ((i % 3) != 0) {
            [NSBezierPath strokeLineFromPoint:NSMakePoint(boardRect.origin.x +  i*cellWidth,
                                                          boardRect.origin.y)
                                      toPoint:NSMakePoint(boardRect.origin.x + i*cellWidth,
                                                          boardRect.origin.y + boardRect.size.height)];
            [NSBezierPath strokeLineFromPoint:NSMakePoint(boardRect.origin.x,
                                                          boardRect.origin.y + i*cellHeight)
                                      toPoint:NSMakePoint(boardRect.origin.x + boardRect.size.width,
                                                          boardRect.origin.y + i*cellHeight)];
        }
    }
}

-(void)setSelectedCol:(NSInteger)selectedCol {
    if (selectedCol != _selectedCol) {
        _selectedCol = selectedCol;
        self.needsDisplay = YES;
    }
}

-(void)setSelectedRow:(NSInteger)selectedRow {
    if (selectedRow != _selectedRow) {
        _selectedRow = selectedRow;
        self.needsDisplay = YES;
    }
    
}

-(void)mouseDown:(NSEvent *)theEvent {
    [super mouseDown:theEvent];
    
    const NSPoint windowPoint = [theEvent locationInWindow];
    const NSPoint viewPoint = [self convertPoint:windowPoint fromView:nil];
    NSRect boardRect = [self boardRectangle];
    
    if (NSPointInRect(viewPoint, boardRect)) {
        NSLog(@"clicked on board!");
        const NSInteger row =
            (int) (9*(viewPoint.y - boardRect.origin.y)/boardRect.size.height);
        const NSInteger col =
            (int) (9*(viewPoint.x - boardRect.origin.x)/boardRect.size.width);
        if (0 <= col && col < 9 && 0 <= row && row < 9) {
            self.selectedCol = col;
            self.selectedRow = row;
        }
    }
}

@end
