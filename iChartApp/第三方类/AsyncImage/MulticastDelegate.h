#import <Foundation/Foundation.h>

@class MulticastDelegateEnumerator;

struct MulticastDelegateListNode {
	id __unsafe_unretained delegate;
    NSMutableArray __unsafe_unretained *array;
    
	struct MulticastDelegateListNode * prev;
    struct MulticastDelegateListNode * next;
    NSUInteger retainCount;

};
typedef struct MulticastDelegateListNode MulticastDelegateListNode;


@interface MulticastDelegate : NSObject
{
	MulticastDelegateListNode *delegateList;
}

- (void)addDelegate:(id)delegate;
- (void)removeDelegate:(id)delegate;

- (void)removeAllDelegates;
- (BOOL)doesRecognizeSelector:(SEL)aSelector;

- (NSUInteger)count;

- (MulticastDelegateEnumerator *)delegateEnumerator;

@end

@interface MulticastDelegateEnumerator : NSObject
{
	NSUInteger numDelegates;
	NSUInteger currentDelegateIndex;
	MulticastDelegateListNode **delegates;
}

- (id)nextDelegate;
- (id)nextDelegateOfClass:(Class)aClass;
- (id)nextDelegateForSelector:(SEL)aSelector;

@end
