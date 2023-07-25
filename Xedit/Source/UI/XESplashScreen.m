//
//  XESplashScreen.m
//  Xedit
//
//  Created by Mustafa Malik on 25/07/2023.
//

#import "XESplashScreen.h"
#import "XEWindowManager.h"
#import "XEFontManager.h"

@implementation XESplashScreen

@synthesize width;
@synthesize height;
@synthesize window;

- (void) createWelcomeWindow {
    self.window = [XEWindowManager makeWindow:NSMakeRect(0, 0, self.width, self.height) mask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable defer:NO];
    self.window.titlebarAppearsTransparent = YES;
    
    [self.window setBackgroundColor:[NSColor controlBackgroundColor]];
    
    [self createLeftView];
    [self createRightView];
    [self createMainStack];
    
    [self.window setContentView:self.mainStack];
    [self.window center];
    [self.window makeKeyAndOrderFront:nil];
}

- (void) createMainStack {
    self.mainStack = [NSStackView stackViewWithViews: @[self.leftStack, self.rightStack]];
    self.mainStack.orientation = NSUserInterfaceLayoutOrientationHorizontal;
    self.mainStack.alignment = NSLayoutAttributeCenterY;
    self.mainStack.distribution = NSStackViewDistributionFillEqually;
    self.mainStack.edgeInsets = NSEdgeInsetsMake(0, 35, 0, 0);
}

- (void) createLeftView {
    NSImage* logo = [NSImage imageNamed:@"AppIcon"];
    NSImageView* logoView = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 0, logo.size.width, logo.size.height)];
    logoView.image = logo;
    
    NSString* titleInfo = @"Welcome to ";
    NSTextField* title = [NSTextField labelWithString: [titleInfo stringByAppendingString:@XE_SPLASH_TITLE_NAME]];
    [title setFont: [XEFontManager resizeFont:title fontSize:45.0f fontWeight:4.0f]];
    
    NSString* versionStringMain = @"Version: ";
    NSTextField* versionString = [NSTextField labelWithString: [versionStringMain stringByAppendingString: XE_BUILD_VERSION]];
    [versionString setFont: [XEFontManager resizeFont:versionString fontSize:15.0f fontWeight:4.0f]];
    [versionString setTextColor: [NSColor grayColor]];
    
    self.leftStack = [NSStackView stackViewWithViews: @[logoView, title, versionString]];
    self.leftStack.orientation = NSUserInterfaceLayoutOrientationVertical;
    self.leftStack.alignment = NSLayoutAttributeCenterX;
}

- (void) createRightView {
    self.rightStack = [NSStackView stackViewWithViews: @[]];
    self.rightStack.orientation = NSUserInterfaceLayoutOrientationVertical;
    self.rightStack.alignment = NSLayoutAttributeCenterX;
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

- (void) applicationDidBecomeActive:(NSNotification *)notification {
    [self createWelcomeWindow];
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
