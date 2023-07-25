//
//  XESplashScreen.m
//  Xedit
//
//  Created by Mustafa Malik on 25/07/2023.
//

#import "XESplashScreen.h"
#import "XEWindowManager.h"

@implementation XESplashScreen

@synthesize width;
@synthesize height;
@synthesize window;

- (void) createWelcomeWindow {
    self.window = [XEWindowManager makeWindow:NSMakeRect(0, 0, self.width, self.height) mask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable defer:NO];
    self.window.titlebarAppearsTransparent = YES;
    
    [self.window setBackgroundColor:[NSColor whiteColor]];
    
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
}

- (void) createLeftView {
    NSBox* box = [[NSBox alloc] init];
    box.boxType = NSBoxCustom;
    box.fillColor = [NSColor redColor];
    [box setFrameSize: NSMakeSize(100, 100)];
    
    self.leftStack = [NSStackView stackViewWithViews: @[box]];
    self.leftStack.orientation = NSUserInterfaceLayoutOrientationVertical;
    self.leftStack.alignment = NSLayoutAttributeCenterX;
}

- (void) createRightView {
    self.rightStack = [NSStackView stackViewWithViews: @[]];
    self.leftStack.orientation = NSUserInterfaceLayoutOrientationVertical;
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
