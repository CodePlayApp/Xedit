//
//  XESplashScreen.m
//  Xedit
//
//  Created by Mustafa Malik on 25/07/2023.
//

#import "XESplashScreen.h"
#import "XEWindowManager.h"
#import "XEFontManager.h"

static NSView* createSplashButton(NSString* title, NSUInteger style, BOOL bordered);
static NSLayoutConstraint* fixLayoutConstraint(id view, NSLayoutAttribute attrib1, NSLayoutRelation relation, id toItem, NSLayoutAttribute attrib2, float mul, float apply);

@implementation XESplashScreen

- (void) createWelcomeWindow {
    self->window = [XEWindowManager makeWindow:NSMakeRect(0, 0, self.width, self.height) mask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable defer:NO];
    self->window.titlebarAppearsTransparent = YES;
    
    [self->window setBackgroundColor:[NSColor controlBackgroundColor]];
    
    [self createLeftView];
    [self createRightView];
    [self createMainStack];
    
    [self->window setContentView:self->mainStack];
    [self->window center];
    [self->window makeKeyAndOrderFront:nil];
}

- (void) createMainStack {
    self->mainStack = [NSStackView stackViewWithViews: @[self->leftStack, self->rightStack]];
    self->mainStack.orientation = NSUserInterfaceLayoutOrientationHorizontal;
    self->mainStack.alignment = NSLayoutAttributeCenterY;
    self->mainStack.distribution = NSStackViewDistributionFillEqually;
    self->mainStack.edgeInsets = NSEdgeInsetsMake(0, 35, 0, 0);
}

- (void) createLeftView {
    NSImage* logo = [NSImage imageNamed:@"AppIcon"];
    NSImageView* logoView = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 0, logo.size.width, logo.size.height)];
    logoView.image = logo;
    
    NSString* titleInfo = @"Welcome to ";
    NSTextField* title = [NSTextField labelWithString: [titleInfo stringByAppendingString:@XE_SPLASH_TITLE_NAME]];
    [title setFont: [XEFontManager resizeFont:title.font fontSize:45.0f fontWeight:4.0f]];
    
    NSString* versionStringMain = @"Version: ";
    NSTextField* versionString = [NSTextField labelWithString: [versionStringMain stringByAppendingString: XE_BUILD_VERSION]];
    [versionString setFont: [XEFontManager resizeFont:versionString.font fontSize:15.0f fontWeight:4.0f]];
    [versionString setTextColor: [NSColor grayColor]];
    
    NSImage* plusIcon = [NSImage imageWithSystemSymbolName:@"plus.app" accessibilityDescription:nil];
    //[plusIcon setSize:NSMakeSize(30, 30)];
    
    NSView* createButton = createSplashButton(@"Create a new project", NSBezelStyleRounded, NO);
//    [createButton setContentTintColor:[NSColor systemBlueColor]];
//    [createButton setImage:plusIcon];
//    [createButton setImagePosition:NSImageLeft];
//    [createButton setImageScaling:NSImageScaleProportionallyUpOrDown];
    
    NSView* openButton = createSplashButton(@"Open a file or folder", NSBezelStyleRounded, YES);
    NSView* cloneButton = createSplashButton(@"Clone a git project", NSBezelStyleRounded, YES);
    
    self->leftStack = [NSStackView stackViewWithViews: @[logoView, title, versionString, createButton, openButton, cloneButton]];
    self->leftStack.orientation = NSUserInterfaceLayoutOrientationVertical;
    self->leftStack.alignment = NSLayoutAttributeCenterX;
    //self->leftStack.edgeInsets = NSEdgeInsetsMake(0, 0, 100, 0);
}

- (void) createRightView {
    self->rightStack = [NSStackView stackViewWithViews: @[]];
    self->rightStack.orientation = NSUserInterfaceLayoutOrientationVertical;
    self->rightStack.alignment = NSLayoutAttributeCenterX;
}

- (void) createRecentStack {
    
}

- (BOOL) canReadCachedProjects {
    return NO;
}

- (void) displayRecentProjects {
    
}

- (int) width {
    return XE_SPLASH_SCREEN_WIDTH;
}

- (int) height {
    return XE_SPLASH_SCREEN_HEIGHT;
}

- (void) applicationDidFinishLaunching:(NSNotification *)notification {
    [self createWelcomeWindow];
}

- (void) applicationDidBecomeActive:(NSNotification *)notification {
    
}

- (void) applicationWillTerminate:(NSNotification *)notification {
    
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

- (BOOL) applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

@end

static NSView* createSplashButton(NSString* title, NSUInteger style, BOOL bordered) {
    
    NSView* mainButtonView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 300, 100)];
    //[mainButtonView setTranslatesAutoresizingMaskIntoConstraints:NO];
    mainButtonView.wantsLayer = NO;
    mainButtonView.layer.backgroundColor = [NSColor redColor].CGColor;
    
//    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:mainButtonView
//                                                                       attribute:NSLayoutAttributeWidth
//                                                                       relatedBy:NSLayoutRelationEqual
//                                                                          toItem:nil
//                                                                       attribute:NSLayoutAttributeNotAnAttribute
//                                                                      multiplier:1.0
//                                                                        constant:300];
//
//    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:mainButtonView
//                                                                         attribute:NSLayoutAttributeHeight
//                                                                         relatedBy:NSLayoutRelationEqual
//                                                                            toItem:nil
//                                                                         attribute:NSLayoutAttributeNotAnAttribute
//                                                                        multiplier:1.0
//                                                                          constant:50];
    
    NSLayoutConstraint* widthConstraint = fixLayoutConstraint(mainButtonView, NSLayoutAttributeWidth, NSLayoutRelationEqual, nil, NSLayoutAttributeNotAnAttribute, 1.0f, 300);
    NSLayoutConstraint* heightConstraint = fixLayoutConstraint(mainButtonView, NSLayoutAttributeHeight, NSLayoutRelationEqual, nil, NSLayoutAttributeNotAnAttribute, 1.0f, 50);
    
    [mainButtonView addConstraints:@[widthConstraint, heightConstraint]];
    
    NSButton* button = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 300, 50)];
    [button setBezelStyle:style];
    [button setBordered:NO];
    [button setFont:[XEFontManager resizeFont:button.font fontSize:20.0f fontWeight:4.0f]];
    button.title = title;
    button.alignment = NSTextAlignmentCenter;
    [mainButtonView addSubview:button];
    return mainButtonView;
}

static NSLayoutConstraint* fixLayoutConstraint(id view, NSLayoutAttribute attrib1, NSLayoutRelation relation, id toItem, NSLayoutAttribute attrib2, float mul, float apply) {
    return [NSLayoutConstraint constraintWithItem:view attribute:attrib1 relatedBy:relation toItem:toItem attribute:attrib2 multiplier:mul constant:apply];
}
