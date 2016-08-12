// Generated by Apple Swift version 2.2 (swiftlang-703.0.18.8 clang-703.0.31)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import ObjectiveC;
@import CoreGraphics;
@import iCarousel;
@import Foundation;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;
@class NSObject;
@class UITabBarController;

SWIFT_CLASS("_TtC8SwiftOne11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary * _Nullable)launchOptions;
- (UITabBarController * _Nonnull)setTabBar;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8SwiftOne9HomeModel")
@interface HomeModel : NSObject
@property (nonatomic, copy) NSString * _Nullable strLastUpdateDate;
@property (nonatomic, copy) NSString * _Nullable strDayDiffer;
@property (nonatomic, copy) NSString * _Nullable strHpId;
@property (nonatomic, copy) NSString * _Nullable strHpTitle;
@property (nonatomic, copy) NSString * _Nullable strThumbnailUrl;
@property (nonatomic, copy) NSString * _Nullable strOriginalImgUrl;
@property (nonatomic, copy) NSString * _Nullable strAuthor;
@property (nonatomic, copy) NSString * _Nullable strContent;
@property (nonatomic, copy) NSString * _Nullable strMarketTime;
@property (nonatomic, copy) NSString * _Nullable sWebLk;
@property (nonatomic, copy) NSString * _Nullable strPn;
@property (nonatomic, copy) NSString * _Nullable wImgUrl;
@property (nonatomic, readonly, copy) NSString * _Nonnull description;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSCoder;
@class ZDContent;

SWIFT_CLASS("_TtC8SwiftOne8HomeView")
@interface HomeView : UIView
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (void)setupViews;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)configureViewWithHomeEntity:(ZDContent * _Nonnull)homeModel animated:(BOOL)animated;
- (void)startRefresh;
- (void)refreshSubviewsForNewItem;
@end

@class iCarousel;
@class NSBundle;

SWIFT_CLASS("_TtC8SwiftOne14ViewController")
@interface ViewController : UIViewController <iCarouselDelegate, iCarouselDataSource>
- (void)viewDidLoad;
- (void)SetNavigationBarShowRightBarButtonItem:(BOOL)show;
- (void)share;
- (NSInteger)numberOfItemsInCarousel:(iCarousel * _Nonnull)carousel;
- (UIView * _Nonnull)carousel:(iCarousel * _Nonnull)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView * _Nullable)view;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class RightRefreshView;

SWIFT_CLASS("_TtC8SwiftOne18HomeViewController")
@interface HomeViewController : ViewController
- (void)viewDidLoad;
- (void)requestHomeContentAtIndex:(NSInteger)index;
- (void)rightPullRefreshViewDidScrollToLastItem:(RightRefreshView * _Nonnull)rightPullRefreshView;
- (NSInteger)numberOfItemsInRightPullRefreshView:(RightRefreshView * _Nonnull)rightPullRefreshView;
- (UIView * _Nonnull)rightPullRefreshView:(RightRefreshView * _Nonnull)rightPullRefreshView ViewForitemAtIndex:(NSInteger)ViewForitemAtIndex resuingView:(UIView * _Nullable)resuingView;
- (void)rightPullRefreshViewRefrshing:(RightRefreshView * _Nonnull)rightPullRefreshView;
- (void)rightPullRefreshView:(RightRefreshView * _Nonnull)rightPullRefreshView Index:(NSInteger)Index;
- (void)rightPullRefreshViewCurrentItemAtIndexDidChange:(RightRefreshView * _Nonnull)rightPullRefreshView;
- (void)praiseBtn;
- (void)share;
- (void)endRefreshing;
- (void)endRequestHomeContent:(HomeModel * _Nonnull)homeModel index:(NSInteger)index;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@interface NSNumber (SWIFT_EXTENSION(SwiftOne))
@property (nonatomic, readonly) BOOL zz_isBool;
@end


@interface NSObject (SWIFT_EXTENSION(SwiftOne))

/// 任意类型  如果传入的是任意类型 主动转成字典 如果不成功返回空对象
///
/// \param obj 任意对象
///
/// \returns  模型
+ (NSObject * _Nullable)zz_objToModel:(id _Nullable)obj;

/// 字典转模型
///
/// \param dic 字典
///
/// \returns  模型
+ (NSObject * _Nullable)zz_dicToModel:(NSDictionary<NSString *, id> * _Nonnull)dic;

/// 逐级递归 遍历赋值给对象
///
/// \param dic1 字典
- (void)setDicValue:(NSDictionary<NSString *, id> * _Nonnull)dic1;

/// 留给子类有实体属性的去继承
///
/// \returns  k , 实体
- (NSDictionary<NSString *, Class> * _Nullable)zz_modelPropertyClass;

/// 判断对象中是否包含某个属性
///
/// \param cla 类
///
/// \param varName 变量名
///
/// \returns  bool
- (BOOL)zz_getVariableWithClass:(Class _Nonnull)cla varName:(NSString * _Nonnull)varName;
@end


SWIFT_CLASS("_TtC8SwiftOne15NetworkResponse")
@interface NetworkResponse : NSObject
@property (nonatomic, copy) NSString * _Nullable result;
- (nonnull instancetype)initWithDict:(NSDictionary<NSString *, id> * _Nonnull)dict OBJC_DESIGNATED_INITIALIZER;
@end

@class NSDictionary;

SWIFT_CLASS("_TtC8SwiftOne11NetworkTool")
@interface NetworkTool : NSObject
+ (NSDictionary * _Nonnull)parametersWithIndex:(NSInteger)index;
- (void)requestHomeContentByIndex:(NSInteger)index successBlock:(void (^ _Nonnull)(id _Nonnull backMsg))successBlock failBlock:(void (^ _Nonnull)(id _Nonnull error))failBlock;
- (NSDictionary * _Nonnull)parametersWithIndex:(NSInteger)index;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8SwiftOne21ProfileViewController")
@interface ProfileViewController : ViewController
- (void)viewDidLoad;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8SwiftOne22QuestionViewController")
@interface QuestionViewController : ViewController
- (void)viewDidLoad;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8SwiftOne18ReadViewController")
@interface ReadViewController : ViewController
- (void)viewDidLoad;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8SwiftOne16RightRefreshView")
@interface RightRefreshView : UIView <iCarouselDataSource, iCarouselDelegate>
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (void)delete:(id _Nullable)sender;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@property (nonatomic, readonly) NSInteger currentItemIndex;
@property (nonatomic, readonly, strong) UIView * _Nonnull currentItemView;
@property (nonatomic, readonly, strong) UIView * _Nonnull contentView;

/// 插入一个新的Item
///
/// \param index 新的Item的下标
///
/// \param animated 动画
- (void)inisertItemIndex:(NSInteger)index animated:(BOOL)animated;

/// 重新加载数据
- (void)reloaData;

/// 重新加载指定下标的Item
///
/// \param index 下标
///
/// \param animated 动画
- (void)reloadItemIndex:(NSInteger)index animated:(BOOL)animated;
- (UIView * _Nonnull)itemViewIndex:(NSInteger)index;

/// 结束刷新
- (void)endRefresh;
- (NSInteger)numberOfItemsInCarousel:(iCarousel * _Nonnull)carousel;
- (UIView * _Nonnull)carousel:(iCarousel * _Nonnull)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView * _Nullable)view;
- (CGFloat)carouselItemWidth:(iCarousel * _Nonnull)carousel;
- (void)carouselCurrentItemIndexDidChange:(iCarousel * _Nonnull)carousel;
- (void)carouselDidScroll:(iCarousel * _Nonnull)carousel;
- (void)carouselDidEndDragging:(iCarousel * _Nonnull)carousel willDecelerate:(BOOL)decelerate;
- (void)carouselDidEndScrollingAnimation:(iCarousel * _Nonnull)carousel;
@end


SWIFT_CLASS("_TtC8SwiftOne20ThingsViewController")
@interface ThingsViewController : ViewController
- (void)viewDidLoad;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@class NSString;
@class NSDate;

SWIFT_CLASS("_TtC8SwiftOne14ZDBaseFunction")
@interface ZDBaseFunction : NSObject
+ (NSString * _Nonnull)homeENMarketTimeWithOriginalMarketTime:(NSString * _Nonnull)originalMarketTime;
+ (NSDate * _Nonnull)dateFromString:(NSString * _Nonnull)dateStr;
+ (NSString * _Nonnull)stringDateBeforeTodaySeveralDays:(NSInteger)days;
+ (NSString * _Nonnull)stringDateFromDate:(NSDate * _Nonnull)date;
+ (NSString * _Nonnull)stringDateFromCurrent;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8SwiftOne9ZDContent")
@interface ZDContent : NSObject
@property (nonatomic, copy) NSString * _Nullable strLastUpdateDate;
@property (nonatomic, copy) NSString * _Nullable strDayDiffer;
@property (nonatomic, copy) NSString * _Nullable strHpId;
@property (nonatomic, copy) NSString * _Nullable strHpTitle;
@property (nonatomic, copy) NSString * _Nullable strThumbnailUrl;
@property (nonatomic, copy) NSString * _Nullable strOriginalImgUrl;
@property (nonatomic, copy) NSString * _Nullable strAuthor;
@property (nonatomic, copy) NSString * _Nullable strContent;
@property (nonatomic, copy) NSString * _Nullable strMarketTime;
@property (nonatomic, copy) NSString * _Nullable sWebLk;
@property (nonatomic, copy) NSString * _Nullable strPn;
@property (nonatomic, copy) NSString * _Nullable wImgUrl;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
