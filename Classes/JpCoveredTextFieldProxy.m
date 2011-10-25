/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2011 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "JpCoveredTextFieldProxy.h"
#import "JpCoveredTextField.h"
#import "TiUtils.h"

@implementation JpCoveredTextFieldProxy


-(void)clear:(id)arg
{
	if ([self viewAttached])
	{
		[[self view] performSelectorOnMainThread:@selector(clear) withObject:nil waitUntilDone:NO];
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

-(void)paste:(id)arg
{
	if ([self viewAttached])
	{
		[[self view] performSelectorOnMainThread:@selector(paste) withObject:nil waitUntilDone:NO];
	}
}
@end
