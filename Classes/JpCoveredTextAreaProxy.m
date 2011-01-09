/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2011 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "JpCoveredTextAreaProxy.h"
#import "JpCoveredTextArea.h"
#import "TiUtils.h"

@implementation JpCoveredTextAreaProxy

-(void)cursorLeft:(id)arg
{
	if ([self viewAttached])
	{
		[[self view] performSelectorOnMainThread:@selector(cursorLeft) withObject:nil waitUntilDone:NO];
	}
}

-(void)cursorRight:(id)arg
{
	if ([self viewAttached])
	{
		[[self view] performSelectorOnMainThread:@selector(cursorRight) withObject:nil waitUntilDone:NO];
	}
}

-(void)undo:(id)arg
{
	if ([self viewAttached])
	{
		[[self view] performSelectorOnMainThread:@selector(undo) withObject:nil waitUntilDone:NO];
	}
}

-(void)redo:(id)arg
{
	if ([self viewAttached])
	{
		[[self view] performSelectorOnMainThread:@selector(redo) withObject:nil waitUntilDone:NO];
	}
}

@end
