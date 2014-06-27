
 
#import "ADDateHelper.h"


@implementation ADDateHelper

//Constants
#define SECOND 1
#define MINUTE (60 * SECOND)
#define HOUR (60 * MINUTE)
#define DAY (24 * HOUR)
#define MONTH (30 * DAY)


+ (NSString*)intervalBetweenNowUntilDate:(NSDate*)untilDate
{
    NSDate *now = [NSDate date];

    if(untilDate>now)
    {
        //Calculate the delta in seconds between the two dates
        NSTimeInterval delta = [untilDate timeIntervalSinceDate:now];

        if (delta < 1 * MINUTE)
        {
            return delta == 1 ? @"one second ago" : [NSString stringWithFormat:@"%d seconds ago", (int)delta];
        }
        if (delta < 2 * MINUTE)
        {
            return @"a minute ago";
        }
        if (delta < 60 * MINUTE)
        {
            int minutes = floor((double)delta/MINUTE);
            return [NSString stringWithFormat:@"%d minutes ago", minutes];
        }
        if (delta < 120 * MINUTE)
        {
            return @"over an hour ago";
        }
        if (delta < 24 * HOUR)
        {
            int hours = floor((double)delta/HOUR);
            return [NSString stringWithFormat:@"%d hours ago", hours];
        }
        if (delta < 48 * HOUR)
        {
            return @"yesterday";
        }
        if (delta < 30 * DAY)
        {
            int days = floor((double)delta/DAY);
            return [NSString stringWithFormat:@"%d days ago", days];
        }
        if (delta < 12 * MONTH)
        {
            int months = floor((double)delta/MONTH);
            return months <= 1 ? @"one month ago" : [NSString stringWithFormat:@"%d months ago", months];
        }
        else
        {
            int years = floor((double)delta/MONTH/12.0);
            return years <= 1 ? @"one year ago" : [NSString stringWithFormat:@"%d years ago", years];
        }

    }
    else{

        //the date is in the future
        NSTimeInterval delta = [now timeIntervalSinceDate:untilDate];

        if (delta < 1 * MINUTE)
        {
            return delta == 1 ? @"in one second" : [NSString stringWithFormat:@"in %d seconds", (int)delta];
        }
        if (delta < 2 * MINUTE)
        {
            return @"in less than 2 minutes";
        }
        if (delta < 60 * MINUTE)
        {
            int minutes = floor((double)delta/MINUTE);
            return [NSString stringWithFormat:@"in %d minutes", minutes];
        }
        if (delta < 120 * MINUTE)
        {
            return @"in less than 2 hours";
        }
        if (delta < 24 * HOUR)
        {
            int hours = floor((double)delta/HOUR);
            return [NSString stringWithFormat:@"in %d hours", hours];
        }
        if (delta < 48 * HOUR)
        {
            return @"in less than 48 hours";
        }
        if (delta < 30 * DAY)
        {
            int days = floor((double)delta/DAY);
            return [NSString stringWithFormat:@"in %d days", days];
        }
        if (delta < 12 * MONTH)
        {
            int months = floor((double)delta/MONTH);
            return months <= 1 ? @"in one month" : [NSString stringWithFormat:@"in %d months", months];
        }
        else
        {
            int years = floor((double)delta/MONTH/12.0);
            return years <= 1 ? @"one year ago" : [NSString stringWithFormat:@"%d years ago", years];
        }

    }
}

@end