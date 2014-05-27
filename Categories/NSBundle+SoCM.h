//
//  NSBundle+SoCM.h
//  Task-02
//
//  Created by Nicholas Outram on 26/05/2014.
//  Copyright (c) 2014 Plymouth University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (SoCM)
+(NSString*) pathToDocumentsFolder;
+(NSString*) pathToFileInDocumentsFolder:(NSString*)filename;
@end
