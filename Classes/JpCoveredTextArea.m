/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2011 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "JpCoveredTextArea.h"
#import "JpCoveredTextAreaProxy.h"
#import "TiUtils.h"
#import "TiApp.h"

@implementation JpCoveredTextArea

-(void)dealloc
{
	if (lastClearText!=nil)
	{
		RELEASE_TO_NIL(lastClearText);
	}
	[super dealloc];
}

- (void)cursorLeft
{
	NSRange range = [(UITextView *)[self textWidgetView] selectedRange];
	[(UITextView *)[self textWidgetView] setSelectedRange:NSMakeRange(range.location - 1, range.length)];
	[[UIDevice currentDevice] playInputClick];
	[[(UITextView *)[self textWidgetView] undoManager] registerUndoWithTarget:self selector:@selector(cursorRight) object:nil];
}

- (void)cursorRight
{
	NSRange range = [(UITextView *)[self textWidgetView] selectedRange];
	[(UITextView *)[self textWidgetView] setSelectedRange:NSMakeRange(range.location + 1, range.length)];
	[[UIDevice currentDevice] playInputClick];
	[[(UITextView *)[self textWidgetView] undoManager] registerUndoWithTarget:self selector:@selector(cursorLeft) object:nil];
}

- (void)insertString:(NSString *)insertingString
{
	NSRange range = [(UITextView *)[self textWidgetView] selectedRange];
    NSString * firstHalfString = [[(UITextView *)[self textWidgetView] text] substringToIndex:range.location];  
    NSString * secondHalfString = [[(UITextView *)[self textWidgetView] text] substringFromIndex: range.location];  
    ((UITextView *)[self textWidgetView]).scrollEnabled = NO;  // turn off scrolling or you'll get dizzy ... I promise  
	
    ((UITextView *)[self textWidgetView]).text = [NSString stringWithFormat: @"%@%@%@",  
					 firstHalfString,  
					 insertingString,  
					 secondHalfString];  
    range.location += [insertingString length];  
    ((UITextView *)[self textWidgetView]).selectedRange = range;  
    ((UITextView *)[self textWidgetView]).scrollEnabled = YES;  // turn scrolling back on.  
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


-(void)keyboardChanged:(NSNotification *)notification;
{
    NSDictionary *info = [notification userInfo];
    NSValue *keyValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [keyValue CGRectValue].size;
	NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys:
						   [NSNumber numberWithFloat:keyboardSize.height],@"kbHeight",
						   [NSNumber numberWithFloat:keyboardSize.width],@"kbWidth",
						   nil];    
    [self.proxy fireEvent:@"keyboardChanged" withObject:event propagate:NO];
}

#pragma mark Keyboard Delegates

-(void)textWidget:(UIView<UITextInputTraits>*)tw didFocusWithText:(NSString *)value
{
	TiViewProxy * ourProxy = (TiViewProxy *)[self proxy];
	[[TiApp controller] didKeyboardFocusOnProxy:ourProxy];
    
	if ([ourProxy _hasListeners:@"focus"])
	{
		[ourProxy fireEvent:@"focus" withObject:[NSDictionary dictionaryWithObject:value forKey:@"value"] propagate:NO];
	}    
	if ([self.proxy _hasListeners:@"keyboardChanged"])
	{
        WARN_IF_BACKGROUND_THREAD_OBJ;
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChanged:) name:UIKeyboardWillChangeFrameNotification object:nil];
	}
}

-(void)textWidget:(UIView<UITextInputTraits>*)tw didBlurWithText:(NSString *)value
{
	TiViewProxy * ourProxy = (TiViewProxy *)[self proxy];
    
	[[TiApp controller] didKeyboardBlurOnProxy:ourProxy];
    
	if ([ourProxy _hasListeners:@"blur"])
	{
		[ourProxy fireEvent:@"blur" withObject:[NSDictionary dictionaryWithObject:value forKey:@"value"] propagate:NO];
	}
	
	// In order to capture gestures properly, we need to force the root view to become the first responder.
	[self makeRootViewFirstResponder];
    
	if ([self.proxy _hasListeners:@"keyboardChanged"])
	{
        WARN_IF_BACKGROUND_THREAD_OBJ;
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
	}
	
}


@end
