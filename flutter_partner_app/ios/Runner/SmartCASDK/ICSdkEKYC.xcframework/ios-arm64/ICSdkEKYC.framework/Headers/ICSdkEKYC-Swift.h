#if 0
#elif defined(__arm64__) && __arm64__
// Generated by Apple Swift version 5.7.2 (swiftlang-5.7.2.135.5 clang-1400.0.29.51)
#ifndef ICSDKEKYC_SWIFT_H
#define ICSDKEKYC_SWIFT_H
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wduplicate-method-match"
#pragma clang diagnostic ignored "-Wauto-import"
#if defined(__OBJC__)
#include <Foundation/Foundation.h>
#endif
#if defined(__cplusplus)
#include <cstdint>
#include <cstddef>
#include <cstdbool>
#else
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#endif

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
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
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(ns_consumed)
# define SWIFT_RELEASES_ARGUMENT __attribute__((ns_consumed))
#else
# define SWIFT_RELEASES_ARGUMENT
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
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
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif
#if !defined(SWIFT_RESILIENT_CLASS)
# if __has_attribute(objc_class_stub)
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME) __attribute__((objc_class_stub))
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_class_stub)) SWIFT_CLASS_NAMED(SWIFT_NAME)
# else
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME)
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) SWIFT_CLASS_NAMED(SWIFT_NAME)
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
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_WEAK_IMPORT)
# define SWIFT_WEAK_IMPORT __attribute__((weak_import))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if defined(__OBJC__)
#if !defined(IBSegueAction)
# define IBSegueAction
#endif
#endif
#if !defined(SWIFT_EXTERN)
# if defined(__cplusplus)
#  define SWIFT_EXTERN extern "C"
# else
#  define SWIFT_EXTERN extern
# endif
#endif
#if !defined(SWIFT_CALL)
# define SWIFT_CALL __attribute__((swiftcall))
#endif
#if defined(__cplusplus)
#if !defined(SWIFT_NOEXCEPT)
# define SWIFT_NOEXCEPT noexcept
#endif
#else
#if !defined(SWIFT_NOEXCEPT)
# define SWIFT_NOEXCEPT 
#endif
#endif
#if defined(__cplusplus)
#if !defined(SWIFT_CXX_INT_DEFINED)
#define SWIFT_CXX_INT_DEFINED
namespace swift {
using Int = ptrdiff_t;
using UInt = size_t;
}
#endif
#endif
#if defined(__OBJC__)
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import AVFoundation;
@import CoreFoundation;
@import CoreMedia;
@import Foundation;
@import ObjectiveC;
@import UIKit;
#endif

#endif
#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"
#pragma clang diagnostic ignored "-Wdollar-in-identifier-extension"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="ICSdkEKYC",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

#if defined(__OBJC__)
@class NSCoder;
@class UITouch;
@class UIEvent;

/// Lottie comes prepacked with a two Animated Controls, <code>AnimatedSwitch</code> and
/// <code>AnimatedButton</code>. Both of these controls are built on top of <code>AnimatedControl</code>
/// <code>AnimatedControl</code> is a subclass of <code>UIControl</code> that provides an interactive
/// mechanism for controlling the visual state of an animation in response to
/// user actions.
/// The <code>AnimatedControl</code> will show and hide layers depending on the current
/// <code>UIControl.State</code> of the control.
/// Users of <code>AnimationControl</code> can set a Layer Name for each <code>UIControl.State</code>.
/// When the state is change the <code>AnimationControl</code> will change the visibility
/// of its layers.
/// NOTE: Do not initialize directly. This is intended to be subclassed.
SWIFT_CLASS("_TtC9ICSdkEKYC15AnimatedControl")
@interface AnimatedControl : UIControl
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@property (nonatomic, getter=isEnabled) BOOL enabled;
@property (nonatomic, getter=isSelected) BOOL selected;
@property (nonatomic, getter=isHighlighted) BOOL highlighted;
@property (nonatomic, readonly) CGSize intrinsicContentSize;
- (BOOL)beginTrackingWithTouch:(UITouch * _Nonnull)touch withEvent:(UIEvent * _Nullable)event SWIFT_WARN_UNUSED_RESULT;
- (BOOL)continueTrackingWithTouch:(UITouch * _Nonnull)touch withEvent:(UIEvent * _Nullable)event SWIFT_WARN_UNUSED_RESULT;
- (void)endTrackingWithTouch:(UITouch * _Nullable)touch withEvent:(UIEvent * _Nullable)event;
- (void)cancelTrackingWithEvent:(UIEvent * _Nullable)event;
- (nonnull instancetype)initWithFrame:(CGRect)frame SWIFT_UNAVAILABLE;
@end


/// An interactive button that plays an animation when pressed.
SWIFT_CLASS("_TtC9ICSdkEKYC14AnimatedButton")
@interface AnimatedButton : AnimatedControl
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@property (nonatomic) UIAccessibilityTraits accessibilityTraits;
- (BOOL)beginTrackingWithTouch:(UITouch * _Nonnull)touch withEvent:(UIEvent * _Nullable)event SWIFT_WARN_UNUSED_RESULT;
- (void)endTrackingWithTouch:(UITouch * _Nullable)touch withEvent:(UIEvent * _Nullable)event;
@end



/// An interactive switch with an ‘On’ and ‘Off’ state. When the user taps on the
/// switch the state is toggled and the appropriate animation is played.
/// Both the ‘On’ and ‘Off’ have an animation play range associated with their state.
SWIFT_CLASS("_TtC9ICSdkEKYC14AnimatedSwitch")
@interface AnimatedSwitch : AnimatedControl
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@property (nonatomic) UIAccessibilityTraits accessibilityTraits;
- (void)endTrackingWithTouch:(UITouch * _Nullable)touch withEvent:(UIEvent * _Nullable)event;
@end


/// A view that can be added to a keypath of an AnimationView
SWIFT_CLASS("_TtC9ICSdkEKYC16AnimationSubview")
@interface AnimationSubview : UIView
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end


/// The base view for <code>AnimationView</code> on iOS, tvOS, watchOS, and macCatalyst.
/// Enables the <code>AnimationView</code> implementation to be shared across platforms.
SWIFT_CLASS("_TtC9ICSdkEKYC17AnimationViewBase")
@interface AnimationViewBase : UIView
@property (nonatomic) UIViewContentMode contentMode;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end


IB_DESIGNABLE
SWIFT_CLASS("_TtC9ICSdkEKYC13AnimationView")
@interface AnimationView : AnimationViewBase
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@property (nonatomic, readonly) CGSize intrinsicContentSize;
@end























@class NSString;
@class NSBundle;

/// An Objective-C compatible wrapper around Lottie’s Animation class.
/// Use in tandem with CompatibleAnimationView when using Lottie in Objective-C
SWIFT_CLASS("_TtC9ICSdkEKYC19CompatibleAnimation")
@interface CompatibleAnimation : NSObject
- (nonnull instancetype)initWithName:(NSString * _Nonnull)name bundle:(NSBundle * _Nonnull)bundle OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


/// An Objective-C compatible wrapper around Lottie’s AnimationKeypath
SWIFT_CLASS("_TtC9ICSdkEKYC26CompatibleAnimationKeypath")
@interface CompatibleAnimationKeypath : NSObject
/// Creates a keypath from a dot separated string. The string is separated by “.”
- (nonnull instancetype)initWithKeypath:(NSString * _Nonnull)keypath OBJC_DESIGNATED_INITIALIZER;
/// Creates a keypath from a list of strings.
- (nonnull instancetype)initWithKeys:(NSArray<NSString *> * _Nonnull)keys OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

@class UIColor;

/// An Objective-C compatible wrapper around Lottie’s AnimationView.
SWIFT_CLASS("_TtC9ICSdkEKYC23CompatibleAnimationView")
@interface CompatibleAnimationView : UIView
- (nonnull instancetype)initWithCompatibleAnimation:(CompatibleAnimation * _Nonnull)compatibleAnimation OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)_ SWIFT_UNAVAILABLE;
@property (nonatomic, strong) CompatibleAnimation * _Nullable compatibleAnimation;
@property (nonatomic) CGFloat loopAnimationCount;
@property (nonatomic) UIViewContentMode contentMode;
@property (nonatomic) BOOL shouldRasterizeWhenIdle;
@property (nonatomic) CGFloat currentProgress;
@property (nonatomic) NSTimeInterval currentTime;
@property (nonatomic) CGFloat currentFrame;
@property (nonatomic, readonly) CGFloat realtimeAnimationFrame;
@property (nonatomic, readonly) CGFloat realtimeAnimationProgress;
@property (nonatomic) CGFloat animationSpeed;
@property (nonatomic) BOOL respectAnimationFrameRate;
@property (nonatomic, readonly) BOOL isAnimationPlaying;
- (void)play;
- (void)playWithCompletion:(void (^ _Nullable)(BOOL))completion;
- (void)playFromProgress:(CGFloat)fromProgress toProgress:(CGFloat)toProgress completion:(void (^ _Nullable)(BOOL))completion;
- (void)playFromFrame:(CGFloat)fromFrame toFrame:(CGFloat)toFrame completion:(void (^ _Nullable)(BOOL))completion;
- (void)playFromMarker:(NSString * _Nonnull)fromMarker toMarker:(NSString * _Nonnull)toMarker completion:(void (^ _Nullable)(BOOL))completion;
- (void)stop;
- (void)pause;
- (void)reloadImages;
- (void)forceDisplayUpdate;
- (id _Nullable)getValueFor:(CompatibleAnimationKeypath * _Nonnull)keypath atFrame:(CGFloat)atFrame SWIFT_WARN_UNUSED_RESULT;
- (void)logHierarchyKeypaths;
- (void)setColorValue:(UIColor * _Nonnull)color forKeypath:(CompatibleAnimationKeypath * _Nonnull)keypath;
- (UIColor * _Nullable)getColorValueFor:(CompatibleAnimationKeypath * _Nonnull)keypath atFrame:(CGFloat)atFrame SWIFT_WARN_UNUSED_RESULT;
- (void)addSubview:(AnimationSubview * _Nonnull)subview forLayerAt:(CompatibleAnimationKeypath * _Nonnull)keypath;
- (CGRect)convertWithRect:(CGRect)rect toLayerAt:(CompatibleAnimationKeypath * _Nullable)keypath SWIFT_WARN_UNUSED_RESULT;
- (CGPoint)convertWithPoint:(CGPoint)point toLayerAt:(CompatibleAnimationKeypath * _Nullable)keypath SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)progressTimeForMarker:(NSString * _Nonnull)named SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)frameTimeForMarker:(NSString * _Nonnull)named SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS("_TtC9ICSdkEKYC13DPVideoMatrix")
@interface DPVideoMatrix : NSObject
- (void)initWithRows:(NSUInteger)rows columns:(NSUInteger)columns SWIFT_METHOD_FAMILY(none);
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC9ICSdkEKYC13DPVideoMerger")
@interface DPVideoMerger : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSURL;
enum ParallelMergeAlignment : NSInteger;

@interface DPVideoMerger (SWIFT_EXTENSION(ICSdkEKYC))
- (void)mergeVideosWithFileURLs:(NSArray<NSURL *> * _Nonnull)videoFileURLs videoResolution:(CGSize)videoResolution videoQuality:(NSString * _Nonnull)videoQuality completion:(void (^ _Nonnull)(NSURL * _Nullable, NSError * _Nullable))completion;
- (void)gridMergeVideosWithFileURLs:(NSArray<NSURL *> * _Nonnull)videoFileURLs matrix:(DPVideoMatrix * _Nonnull)matrix audioFileURL:(NSURL * _Nullable)audioFileURL videoResolution:(CGSize)videoResolution isRepeatVideo:(BOOL)isRepeatVideo isRepeatAudio:(BOOL)isRepeatAudio isAudio:(BOOL)isAudio videoDuration:(NSInteger)videoDuration videoQuality:(NSString * _Nonnull)videoQuality completion:(void (^ _Nonnull)(NSURL * _Nullable, NSError * _Nullable))completion;
- (void)parallelMergeVideosWithFileURLs:(NSArray<NSURL *> * _Nonnull)videoFileURLs audioFileURL:(NSURL * _Nullable)audioFileURL videoResolution:(CGSize)videoResolution isRepeatVideo:(BOOL)isRepeatVideo isRepeatAudio:(BOOL)isRepeatAudio videoDuration:(NSInteger)videoDuration videoQuality:(NSString * _Nonnull)videoQuality alignment:(enum ParallelMergeAlignment)alignment completion:(void (^ _Nonnull)(NSURL * _Nullable, NSError * _Nullable))completion SWIFT_DEPRECATED_MSG("Use grid merge using matrix");
@end



typedef SWIFT_ENUM(NSInteger, ParallelMergeAlignment, open) {
  ParallelMergeAlignmentVertical = 0,
  ParallelMergeAlignmentHorizontal = 1,
};


SWIFT_CLASS("_TtC9ICSdkEKYC31ProgressingDashedLineCircleView")
@interface ProgressingDashedLineCircleView : UIView
@property (nonatomic) CGFloat heightView;
@property (nonatomic) BOOL isVersionPro2D;
@property (nonatomic, strong) UIColor * _Nonnull colorCircle;
@property (nonatomic) double maxValue;
@property (nonatomic) double startAngle;
@property (nonatomic) double endAngle;
@property (nonatomic) double percent;
@property (nonatomic) double endAngleValue;
@property (nonatomic) BOOL isRollBack;
@property (nonatomic) double value;
- (double)convertToRadianWithDegree:(double)degree SWIFT_WARN_UNUSED_RESULT;
- (void)reset;
- (void)rollBack;
- (void)drawDhashedLineCircle;
- (void)addMartToMiddleViewWithMargin:(CGFloat)margin;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end

@protocol QRScannerViewDelegate;
@class AVCaptureSession;
@class AVCaptureVideoPreviewLayer;

SWIFT_CLASS("_TtC9ICSdkEKYC13QRScannerView")
@interface QRScannerView : UIView
@property (nonatomic, weak) id <QRScannerViewDelegate> _Nullable delegate;
@property (nonatomic, strong) AVCaptureSession * _Null_unspecified captureSession;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder SWIFT_UNAVAILABLE;
- (nonnull instancetype)initWithFrame:(CGRect)frame SWIFT_UNAVAILABLE;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly) Class _Nonnull layerClass;)
+ (Class _Nonnull)layerClass SWIFT_WARN_UNUSED_RESULT;
@property (nonatomic, readonly, strong) AVCaptureVideoPreviewLayer * _Nonnull layer;
- (void)layoutSubviews;
@end

@class AVCaptureMetadataOutput;
@class AVMetadataObject;
@class AVCaptureConnection;

@interface QRScannerView (SWIFT_EXTENSION(ICSdkEKYC)) <AVCaptureMetadataOutputObjectsDelegate>
- (void)captureOutput:(AVCaptureMetadataOutput * _Nonnull)output didOutputMetadataObjects:(NSArray<AVMetadataObject *> * _Nonnull)metadataObjects fromConnection:(AVCaptureConnection * _Nonnull)connection;
@end

@class AVCaptureOutput;

@interface QRScannerView (SWIFT_EXTENSION(ICSdkEKYC)) <AVCaptureVideoDataOutputSampleBufferDelegate>
- (void)captureOutput:(AVCaptureOutput * _Nonnull)output didOutputSampleBuffer:(CMSampleBufferRef _Nonnull)sampleBuffer fromConnection:(AVCaptureConnection * _Nonnull)connection;
@end


@interface QRScannerView (SWIFT_EXTENSION(ICSdkEKYC))
@property (nonatomic, readonly) BOOL isSessionRunning;
- (void)startScanning;
- (void)stopScanning;
- (void)removeInputOutput;
- (void)deallocSession;
- (void)doInitialSetupWithScanRect:(CGRect)scanRect;
@end

@class UIImage;

SWIFT_PROTOCOL("_TtP9ICSdkEKYC21QRScannerViewDelegate_")
@protocol QRScannerViewDelegate
- (void)qrScanningDidFail;
- (void)qrScanningSucceededWithImage:(UIImage * _Nonnull)image value:(NSString * _Nonnull)value;
- (void)qrScanningDidStop;
@end


#endif
#if defined(__cplusplus)
#endif
#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
#endif

#else
#error unsupported Swift architecture
#endif
