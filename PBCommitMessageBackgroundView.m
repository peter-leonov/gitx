//
//	PBCommitMessageView.m
//	GitX
//
//	Created by Jeff Mesnil on 13/10/08.
//	Copyright 2008 Jeff Mesnil (http://jmesnil.net/). All rights reserved.
//

#import "PBCommitMessageBackgroundView.h"
#import "PBGitDefaults.h"

@implementation PBCommitMessageBackgroundView

- (void)drawRect:(NSRect)aRect
{		
	[[commitMessageView backgroundColor] set];
	NSRectFill(aRect);

	// draw a vertical line after the given size (used as an indicator
	// for the first line of the commit message)
	float characterWidth = [@" " sizeWithAttributes:[commitMessageView typingAttributes]].width;
	float lineWidth = characterWidth * [PBGitDefaults commitMessageViewVerticalLineLength];

	[[NSColor lightGrayColor] set];
	// This depends upon the fact that NSTextView always redraws complete lines.
	float padding = [[commitMessageView textContainer] lineFragmentPadding];
	NSRect line;
	line.origin.x = padding + [commitMessageView frame].origin.x + lineWidth;
	line.origin.y = aRect.origin.y;
	line.size.width = 1;
	line.size.height = aRect.size.height;
	NSRectFill(line);
}

@end
