//
//  ObjectBuilder.h
//

#import <Foundation/Foundation.h>

@interface UVJSONToModelMarshal : NSObject

+ (instancetype)builder;
- (id)objectFromJSON:(NSDictionary *)JSON className:(NSString *)className;
- (id)collectionFromJSON:(NSDictionary *)JSON className:(NSString *)className;

- (id)collectionFromJSONArray:(NSArray *)arrayOfDict className:(NSString *)className;

@end
