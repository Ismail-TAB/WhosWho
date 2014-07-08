//
//  TIWHTMLParser.m
//  WhosWho
//
//  Created by Ismail on 07/07/2014.
//  Copyright (c) 2014 The App Business. All rights reserved.
//

#import "TIWHTMLParser.h"
#import "Employee.h"
@implementation TIWHTMLParser


+(void) ParseHTMLAndSaveInContext:(NSManagedObjectContext*)context
{
    NSError *error = nil;
    NSString *html = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.theappbusiness.com/our-team/"] encoding:NSUTF8StringEncoding error:&error];
    if (error){
        NSLog(@"Error getting HTML");
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Connection Problem" message:@"There is a connection problem." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        NSString *pattern = @"<div class=\"col col2\"><div class=\"title\"><img[^>]* src=[\"']([^\"']+)[\"'][^>]*></div><h3>([^<]+)</h3><p>([^<]+)</p><p class=\"user-description\">([^<]+)</p></div>";
        NSString *searchedString = html;
        NSRange   searchedRange = NSMakeRange(0, [searchedString length]);
        error = nil;
        
        NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern: pattern options:0 error:&error];
        
        NSArray* matches = [regex matchesInString:searchedString options:0 range: searchedRange];
        for (NSTextCheckingResult* match in matches)
        {
            NSRange imagURLRange = [match rangeAtIndex:1];
            NSRange nameRange = [match rangeAtIndex:2];
            NSRange titleRange = [match rangeAtIndex:3];
            NSRange biographyRange = [match rangeAtIndex:4];
            
            Employee * employee = [Employee findorBuildbyImageURL:[searchedString substringWithRange:imagURLRange] withcontext:context];
            [employee setImageURL: [searchedString substringWithRange:imagURLRange]];
            employee.name = [searchedString substringWithRange:nameRange];
            employee.title = [searchedString substringWithRange:titleRange];
            employee.biography = [searchedString substringWithRange:biographyRange];
            
        }
        // save
        error = nil;
        [context save:&error];
        if (error) {
            NSLog(@"Can't Save in Core Data!");
        }
    }
}


@end

