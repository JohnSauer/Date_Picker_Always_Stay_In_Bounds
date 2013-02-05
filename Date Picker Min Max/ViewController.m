#import "ViewController.h"



@implementation ViewController


- (void)viewDidLoad {
    NSDate* now = [NSDate date] ;
    // Get current NSDate without seconds & milliseconds, so that I can better compare the chosen date to the minimum & maximum dates.
    NSCalendar* calendar = [NSCalendar currentCalendar] ;
    NSDateComponents* nowWithoutSecondsComponents = [calendar components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit) fromDate:now] ;
    NSDate* nowWithoutSeconds = [calendar dateFromComponents:nowWithoutSecondsComponents] ;
    //  UIDatePicker* picker ;
    picker.minimumDate = nowWithoutSeconds ;
    
    NSDateComponents* addOneMonthComponents = [NSDateComponents new] ;
    addOneMonthComponents.month = 1 ;
    NSDate* oneMonthFromNowWithoutSeconds = [calendar dateByAddingComponents:addOneMonthComponents toDate:nowWithoutSeconds options:0] ;
    picker.maximumDate = oneMonthFromNowWithoutSeconds ;
}




- (IBAction)pickerValueChanged:(id)sender {
    NSLog(@"pickerValueChanged to: %@", picker.date) ;
    
    // When `setDate:` is called, if the passed date argument exactly matches the Picker's date property's value, the Picker will do nothing. So, offset the passed date argument by one second, ensuring the Picker scrolls every time.
    NSDate* oneSecondAfterPickersDate = [picker.date dateByAddingTimeInterval:1] ;
    if ( [picker.date compare:picker.minimumDate] == NSOrderedSame ) {
        NSLog(@"date is at or below the minimum") ;
        picker.date = oneSecondAfterPickersDate ;
    }
    else if ( [picker.date compare:picker.maximumDate] == NSOrderedSame ) {
        NSLog(@"date is at or above the maximum") ;
        picker.date = oneSecondAfterPickersDate ;
    }
}



@end
