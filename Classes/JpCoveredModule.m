/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "JpCoveredModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation JpCoveredModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"8337614f-6cdc-4aab-b223-8f63da5f1bce";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"jp.covered";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"change"])
	{
		WARN_IF_BACKGROUND_THREAD_OBJ;	//NSNotificationCenter is not threadsafe
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stateDidChange:) name:UIPasteboardChangedNotification object:[UIPasteboard generalPasteboard]];
	}
	if (count == 1 && [type isEqualToString:@"keyboardDidShow"])
	{
		WARN_IF_BACKGROUND_THREAD_OBJ;	//NSNotificationCenter is not threadsafe
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
	}
	if (count == 1 && [type isEqualToString:@"keyboardDidHide"])
	{
		WARN_IF_BACKGROUND_THREAD_OBJ;	//NSNotificationCenter is not threadsafe
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"change"])
	{
		WARN_IF_BACKGROUND_THREAD_OBJ;	//NSNotificationCenter is not threadsafe
		[[NSNotificationCenter defaultCenter] removeObserver:self];
	}
	if (count == 0 && [type isEqualToString:@"keyboardshow"])
	{
		WARN_IF_BACKGROUND_THREAD_OBJ;	//NSNotificationCenter is not threadsafe
		[[NSNotificationCenter defaultCenter] removeObserver:self];
	}
	if (count == 0 && [type isEqualToString:@"keyboardhide"])
	{
		WARN_IF_BACKGROUND_THREAD_OBJ;	//NSNotificationCenter is not threadsafe
		[[NSNotificationCenter defaultCenter] removeObserver:self];
	}
}

#pragma mark Notifications

// TODO: Change to KrollCallback properties for faster response times?
-(void)stateDidChange:(NSNotification*)note
{
	if ([self _hasListeners:@"change"]) {
		[self fireEvent:@"change"];
	}
}

-(void)keyboardDidShow:(NSNotification*)note
{
	if ([self _hasListeners:@"keyboardDidShow"]) {
		[self fireEvent:@"keyboardDidShow"];
	}
}

-(void)keyboardDidHide:(NSNotification*)note
{
	if ([self _hasListeners:@"keyboardDidHide"]) {
		[self fireEvent:@"keyboardDidHide"];
	}
}

#pragma Public APIs


@end
