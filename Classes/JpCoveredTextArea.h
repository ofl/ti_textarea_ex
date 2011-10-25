/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2011 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiUIView.h"
#import "TiUITextArea.h"

@interface JpCoveredTextArea : TiUITextArea {
	
@private
	NSString *lastClearText;	
}
-(void)textWidget:(UIView<UITextInputTraits>*)tw didFocusWithText:(NSString *)value;
-(void)textWidget:(UIView<UITextInputTraits>*)tw didBlurWithText:(NSString *)value;

@end
