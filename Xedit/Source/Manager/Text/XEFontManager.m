//
//  XEFontManager.m
//  Xedit
//
//  Created by Mustafa Malik on 25/07/2023.
//

#import "XEFontManager.h"

@implementation XEFontManager

+ (NSFont*) resizeFont:(NSTextField *)text fontSize:(float)size fontWeight:(float)weight {
    return [[NSFontManager sharedFontManager] fontWithFamily: text.font.familyName traits:NSFontUIOptimizedTrait weight:weight size:size];
}

@end

