//
//  ObjectBuilder.m

//

#import "UVJSONToModelMarshal.h"
#import <Mantle/Mantle.h>


@implementation UVJSONToModelMarshal

+ (instancetype)builder
{
    static dispatch_once_t onceQueue;
    static UVJSONToModelMarshal *__builder = nil;
    dispatch_once(&onceQueue, ^{
        __builder = [[UVJSONToModelMarshal alloc] init];
    });
    
    return __builder;
}

- (id)objectFromJSON:(NSDictionary *)JSON className:(NSString *)className
{
    NSParameterAssert(className);
    
    NSError *error = nil;
    id model = [MTLJSONAdapter modelOfClass:NSClassFromString(className) fromJSONDictionary:JSON error:&error];
    
    if (!error) {
        return model;
    } else {
        return nil;
    }
}

- (id)collectionFromJSON:(NSDictionary *)JSON className:(NSString *)className
{
    NSParameterAssert(className);
    
    if ([JSON isKindOfClass:[NSDictionary class]]) {
        
        NSValueTransformer *valueTransformer = [MTLValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(className)];
        
        NSArray *collection = [valueTransformer transformedValue:JSON];
        
        return collection;
        
    }
    return nil;
}

- (id)collectionFromJSONArray:(NSArray *)arrayOfDict className:(NSString *)className
{
    NSLog(@"className==%@===%@",className,arrayOfDict);
    NSParameterAssert(className);
    
    if ([arrayOfDict isKindOfClass:[NSArray class]]) {
        
        NSLog(@"checking here");
        
        NSValueTransformer *valueTransformer = [MTLValueTransformer mtl_JSONArrayTransformerWithModelClass:NSClassFromString(className)];
        
        NSArray *collection = [valueTransformer transformedValue:arrayOfDict];
        
        return collection;
        
    }
    return nil;
}

@end
