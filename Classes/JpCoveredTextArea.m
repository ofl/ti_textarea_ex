/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2011 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "JpCoveredTextArea.h"
#import "JpCoveredTextAreaProxy.h"
#import "TiUtils.h"

@implementation JpCoveredTextArea

- (void)cursorLeft
{
	NSRange range = [(UITextView *)[self textWidgetView] selectedRange];
	[(UITextView *)[self textWidgetView] setSelectedRange:NSMakeRange(range.location - 1, range.length)];
	[[(UITextView *)[self textWidgetView] undoManager] registerUndoWithTarget:self selector:@selector(cursorRight) object:nil];
}

- (void)cursorRight
{
	NSRange range = [(UITextView *)[self textWidgetView] selectedRange];
	[(UITextView *)[self textWidgetView] setSelectedRange:NSMakeRange(range.location + 1, range.length)];
	[[(UITextView *)[self textWidgetView] undoManager] registerUndoWithTarget:self selector:@selector(cursorLeft) object:nil];
}

- (void)redo
{
	[[(UITextView *)[self textWidgetView] undoManager] redo];
}

- (void)undo
{
	[[(UITextView *)[self textWidgetView] undoManager] undo];
}

@end
