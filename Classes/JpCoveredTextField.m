/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2011 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "JpCoveredTextField.h"
#import "JpCoveredTextFieldProxy.h"
#import "TiUtils.h"

@implementation JpCoveredTextField

-(void)dealloc
{
	if (lastClearText!=nil)
	{
		RELEASE_TO_NIL(lastClearText);
	}
	[super dealloc];
}

- (void)clear
{
	lastClearText = [[(UITextView *)[self textWidgetView] text] copy];
	[(UITextView *)[self textWidgetView] setText:@""];
	[[UIDevice currentDevice] playInputClick];
	[[(UITextView *)[self textWidgetView] undoManager] registerUndoWithTarget:self selector:@selector(restoreText) object:nil];
}

- (void)restoreText
{
	[(UITextView *)[self textWidgetView] setText:lastClearText];
	[[UIDevice currentDevice] playInputClick];
	[[(UITextView *)[self textWidgetView] undoManager] registerUndoWithTarget:self selector:@selector(clear) object:nil];
}

- (void)redo
{
	[[(UITextView *)[self textWidgetView] undoManager] redo];
}

- (void)undo
{
	[[(UITextView *)[self textWidgetView] undoManager] undo];
}

- (void)paste
{
	[(UITextView *)[self textWidgetView] paste:self];
}
@end
