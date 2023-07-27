//
//  XEFontManager.h
//  Xedit
//
//  Created by Mustafa Malik on 25/07/2023.
//

#ifndef XEDIT_MANAGER_TEXT_XEFONTMANAGER_H
#define XEDIT_MANAGER_TEXT_XEFONTMANAGER_H

#define XE_USE_COCOA

#import "XETools.h"

@interface XEFontManager : NSObject

+ (NSFont*) resizeFont:(NSFont*)text fontSize:(float)size fontWeight:(float)weight;

@end

#endif /* XEDIT_MANAGER_TEXT_XEFONTMANAGER_H */
