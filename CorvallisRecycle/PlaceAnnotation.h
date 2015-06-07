#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

//code here served as a resource: http://courseware.codeschool.com/mapkit/Operation-MapKit-Slides.pdf. 
@interface PlaceAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) NSString *subTitle;
@property (nonatomic, retain) NSURL *url;

@end

