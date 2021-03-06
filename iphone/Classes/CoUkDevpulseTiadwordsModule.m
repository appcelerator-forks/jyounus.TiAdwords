/**
 * TiAdwords
 *
 * Created by Your Name
 * Copyright (c) 2015 Your Company. All rights reserved.
 */

#import "CoUkDevpulseTiadwordsModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "ACTReporter.h"

@implementation CoUkDevpulseTiadwordsModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"d4bd367d-0236-440b-a912-f816c76d097f";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"co.uk.devpulse.tiadwords";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(void)sendRequest:(id)args
{
    ENSURE_UI_THREAD_1_ARG(args);
    ENSURE_ARG_COUNT(args, 1);
    
    NSDictionary *dict = args[0];
    
    NSString *conversionId = dict[@"conversionId"];
    NSString *label = dict[@"label"];
    NSString *value = dict[@"value"];
    NSNumber *isRepeatable = dict[@"isRepeatable"];
    
    NSLog(@"[INFO] Sending Adwords request: %@, %@, %@, %@", conversionId, label, value, isRepeatable);
    
    [ACTConversionReporter reportWithConversionID:conversionId label:label value:value isRepeatable:isRepeatable.boolValue];
}



@end
