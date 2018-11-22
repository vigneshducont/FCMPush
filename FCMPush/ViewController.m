//
//  ViewController.m
//  FCMPush
//
//  Created by Ducont India on 09/10/18.
//  Copyright © 2018 Ducont India. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>



@interface ViewController ()<CLLocationManagerDelegate>


@property (strong, nonatomic) CLLocationManager *LocationManager;


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _activityIndicator.hidden=YES;
    
    //[self getCurrentLocation];

   
    
}

-(void)getCurrentLocation
{

    _LocationManager = [[CLLocationManager alloc] init];
    _LocationManager.delegate = self;
    _LocationManager.distanceFilter = kCLDistanceFilterNone;
    _LocationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        [_LocationManager requestWhenInUseAuthorization];
    
    [_LocationManager startUpdatingLocation];
    
   // @property (strong, nonatomic) CLLocationManager *LocationManager;

    
//    <key>LSApplicationQueriesSchemes</key>
//    <array>
//    <string>comgooglemaps</string>
//    </array>
    
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    NSLog(@"lat%f - lon%f", location.coordinate.latitude, location.coordinate.longitude);
    
    
    NSString *googleMapsURLString = [NSString stringWithFormat:@"http://maps.google.com/?saddr=%1.6f,%1.6f&daddr=%1@,%1@",
                                     location.coordinate.latitude, location.coordinate.longitude,@"12.9279", @"77.6271"];
    
    NSURL *url = [NSURL URLWithString:googleMapsURLString];
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:url options:@{} completionHandler:nil];
}

- (void)textfield:(UITextField *)textField{

}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    
//    if(_textField_otp.text.length > 3)
//    {
//        [self validateTextFields:textField.text];
//        return NO;
//
//    }
   
    NSString *strText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    NSLog(@"%@",strText);

    if(strText.length >= 4)
   {
      [self validateTextFields:strText];
    }
    
    //NSLog(@"your  3 stirs ==%@   %@ ",strText, textField.text);

    return YES;

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if(_textField_otp.text.length >= 4)
    {
        [self validateTextFields:textField.text];
        
    }
    [self showLoader];

    return YES;
}

-(void) validateTextFields:(NSString *)textString {
    
     array = [NSMutableArray array];
    for (int i = 0; i < [textString length]; i++) {
        NSString *ch = [textString substringWithRange:NSMakeRange(i, 1)];
        [array addObject:ch];
    }
      //shows Description
   
   
    if(_textField_otp.text == nil){
   
        _textField_otp.text=@"";   //shows Description
        _textField_otp.text=[array objectAtIndex:0];
        
    }//Shows Data
    _textfield_0.text=[array objectAtIndex:1];
    _textfield_1.text=[array objectAtIndex:2];   // shows IMG
    _textfield_2.text=[array objectAtIndex:3];   // shows IMG
   
    
    [self showLoader];

    NSLog(@"your  3 stirs ==%@   %@  %@", _textField_otp.text, _textfield_0.text, _textfield_1.text);
    
    
}
-(void)showLoader{
    _activityIndicator.hidden=NO;
}
@end
