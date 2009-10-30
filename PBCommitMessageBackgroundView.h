//
//  PBCommitMessageView.h
//  GitX
//
//  Created by Jeff Mesnil on 13/10/08.
//  Copyright 2008 Jeff Mesnil (http://jmesnil.net/). All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PBCommitMessageBackgroundView : NSView {

	IBOutlet NSTextView *commitMessageView;
}

@end