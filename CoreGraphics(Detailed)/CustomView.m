//
//  CustomView.m
//  CoreGraphics(Detailed)
//
//  Created by 王红昌 on 17/4/19.
//  Copyright © 2017年 王红昌. All rights reserved.
//

#import "CustomView.h"

@interface CustomView()

@property (nonatomic,assign)CGContextRef currentContext;

@end



@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    //获取当前的上下文
    self.currentContext = UIGraphicsGetCurrentContext();
    
//    [self creatCGpathRefStyles];
//    [self creatCGMutablePathRefStyles];
    
    //根据顶点画自定义路径
//    [self drawCustomPointPath];
    [self drawPathWithCGContext];
    
}

#pragma mark 创建不可变路径
- (void)creatCGpathRefStyles{
    //创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 30, 500);
    CGPathAddLineToPoint(path, NULL, 170, 500);
    //    CGPathAddCurveToPoint(path, NULL, 220, 400, 270, 600, 320, 500);
    CGPathAddQuadCurveToPoint(path, NULL, 220, 400, 320, 500);
    
    
    
    /*根据已存在的路径绘制路径
     */
    //    CGPathRef path0 = CGPathCreateCopy(path);
    //    CGContextSetRGBStrokeColor(self.currentContext, 0.5, 0.1, 0.6, 1);
    //    CGContextSetLineWidth(self.currentContext, 2);
    //    CGContextAddPath(self.currentContext, path0);
    //    CGContextStrokePath(self.currentContext);
    //    CGPathRelease(path0);
    
    //    /*根据已存在的路径绘制路径
    //     *参数1：已存在的路径
    //     *参数2：CGAffineTransform类型转换
    //     */
    //    CGAffineTransform transform = CGAffineTransformMakeTranslation(0,-100);
    //    CGPathRef path1 = CGPathCreateCopyByTransformingPath(path, &transform);
    //    CGContextSetRGBStrokeColor(self.currentContext, 0.5, 0.1, 0.6, 1);
    //    CGContextSetLineWidth(self.currentContext, 2);
    //    CGContextAddPath(self.currentContext, path1);
    //    CGContextStrokePath(self.currentContext);
    //    CGPathRelease(path1);
    
    /*绘制矩形路径
     *参数1：矩形frame
     *参数2：CGAffineTransform类型转换
     */
    CGPathRef path2 = CGPathCreateWithRect(CGRectMake(50, 270, 80, 60), NULL);
    CGContextSetRGBStrokeColor(self.currentContext, 0.8, 0.6, 0.2, 1);
    CGContextSetLineWidth(self.currentContext, 2);
    CGContextAddPath(self.currentContext, path2);
    CGContextStrokePath(self.currentContext);
    CGPathRelease(path2);
    
    /*绘制椭圆（圆是一种特殊的椭圆）
     *参数1：椭圆的外部frame
     *参数2：CGAffineTransform类型转换
     */
    CGPathRef path3 = CGPathCreateWithEllipseInRect(CGRectMake(150, 275, 100, 50), NULL);
    CGContextSetRGBStrokeColor(self.currentContext, 0.4, 0.9, 0.9, 1);
    CGContextSetLineWidth(self.currentContext, 3);
    CGContextAddPath(self.currentContext, path3);
    CGContextStrokePath(self.currentContext);
    CGPathRelease(path3);
    /*创建一个圆角图形
     *参数1：路径的frame
     *参数2：圆角的宽
     *参数3：圆角的高
     *参数4：CGAffineTransform类型转换
     */
    CGPathRef path4 = CGPathCreateWithRoundedRect(CGRectMake(260, 250, 100, 100), 30, 40, NULL);
    CGContextSetRGBStrokeColor(self.currentContext, 0.1, 0.6, 0.9, 1);
    CGContextSetLineWidth(self.currentContext, 5);
    CGContextAddPath(self.currentContext, path4);
    CGContextStrokePath(self.currentContext);
    CGPathRelease(path4);
    
    /*根据已存在的路径创建一个虚线路径，同时参数`phase', `lengths', and
     `count'与对应的`CGContextSetLineDash'参数有相同的含义，CGAffineTransform类型,用于在二维空间做旋转,缩放和平移。如transform非空，则在这些参数被添加之前，先进行transform相关的转换。
     *参数1：要进行虚线化的不可变路径
     *参数2：CGAffineTransform类型转换
     *参数3：从lengths数组的第几部分开始绘制虚线
     *参数4：C风格的数组 其中为CGFloat值 表示每段虚线的绘制长度 例如传入数组为{10,5}，则虚线的先绘制长度为10的实线 在绘制长度为5的空白 在进行循环
     *参数5：count是使用数组的长度，也就是说如果数组长度是4，而count是3，那么只使用数组的前三个
     */
    CGFloat dash[] = {15,20,20,4};
    CGPathRef path5 = CGPathCreateCopyByDashingPath(path, NULL, 0, dash, 3);
    //将路径加在上下文对象上
    CGContextSetRGBStrokeColor(self.currentContext, 0.2, 0.8, 0.5, 1);
    CGContextAddPath(self.currentContext, path5);
    CGContextStrokePath(self.currentContext);
    //释放路径对象
    //    CGPathRelease(path);
    //    CGPathRelease(path5);
    
    
    /*根据已存在的路径创建一个路径的描边轮廓，同时参数`lineWidth', `lineCap',`lineJoin', and `miterLimit'与对应的cgcontext参数有相同的含义，CGAffineTransform类型,用于在二维空间做旋转,缩放和平移。如transform非空，则在这些参数被添加之前，先进行transform相关的转换。
     *参数1：已存在的不可变路径
     *参数2：CGAffineTransform类型转换
     *参数3：路径宽度
     *参数4：定义线条末端样式
     typedef CF_ENUM(int32_t, CGLineCap) {
     kCGLineCapButt,//指定不绘制端点， 线条结尾处直接结束。(default)
     kCGLineCapRound,//指定绘制圆形端点， 线条结尾处绘制一个直径为线条宽度的半圆
     kCGLineCapSquare//指定绘制方形端点。线条结尾处绘制半个边长为线条宽度的正方形。注意这种形状的端点与“butt”形状的端点十分相似，只是线条比第一种模式长半个线条宽度。
     };
     *参数5：设置线条连接点的风格
     typedef CF_ENUM(int32_t, CGLineJoin) {
     kCGLineJoinMiter,//接合点为尖角(default)
     kCGLineJoinRound,//接合点为圆角
     kCGLineJoinBevel//接合点为斜角
     };
     *参数6：这个值将决定线连接处角的锋利程度当参数5为kCGLineJoinMiter时才起作用
     */
    CGPathRef path6 = CGPathCreateCopyByStrokingPath(path5, NULL, 10, kCGLineCapRound, kCGLineJoinRound, 3);
    //将路径加在上下文对象上
    CGContextSetRGBStrokeColor(self.currentContext, 0.6, 0.4, 0.5, 1);
    CGContextSetLineWidth(self.currentContext, 2);
    CGContextAddPath(self.currentContext, path6);
    CGContextStrokePath(self.currentContext);

    //释放路径对象
    CGPathRelease(path);
    CGPathRelease(path5);
    CGPathRelease(path6);

}

- (void)creatCGMutablePathRefStyles{
    //设置填充颜色
    CGContextSetRGBFillColor(self.currentContext, 0.6,0.5,0.3,1);//或
    //CGContextSetFillColor(currentContext, CGColorGetComponents([UIColor greenColor].CGColor));
    //设置路径颜色
    CGContextSetRGBStrokeColor(self.currentContext, 0.2, 0.8, 0.5, 1);//或
    //CGContextSetStrokeColor(currentContext, CGColorGetComponents([UIColor redColor].CGColor));
    
    /*
     *创建一个可变路径
     */
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 50, 100);
    CGPathAddLineToPoint(path, NULL, 150, 200);
    CGPathAddLineToPoint(path, NULL, 50, 200);
    //将路径加到当前的上下文
//    CGContextAddPath(self.currentContext, path);
    //关闭路径
//    CGContextClosePath(self.currentContext);
    //如果单独的设置只会应用前者填充颜色或者路径颜色之一
    //CGContextStrokePath(self.currentContext);
    //CGContextFillPath(self.currentContext);
//    CGContextDrawPath(self.currentContext, kCGPathFillStroke);
    
    /*
     *创建已存在路径的一个副本
     */
    CGMutablePathRef path0 = CGPathCreateMutableCopy(path);
    CGPathAddQuadCurveToPoint(path0, NULL, 200, 50, 200, 100);
    //将路径加到当前的上下文
    CGContextAddPath(self.currentContext, path0);
    CGContextClosePath(self.currentContext);
    CGContextDrawPath(self.currentContext, kCGPathFillStroke);

    
    /*创建已存在路径的一个副本，并传入相对已存在的路径CGAffineTransform对象的位移，缩放或者旋转变换
     *参数1：已存在路径
     *参数2：CGAffineTransform对象的位移，缩放或者旋转变换
     */
    CGAffineTransform transform = CGAffineTransformMakeScale(1.5, 1.5);
    CGMutablePathRef path1 = CGPathCreateMutableCopyByTransformingPath(path0, &transform);
    CGContextAddPath(self.currentContext, path1);
    //关闭路径
    CGContextClosePath(self.currentContext);
    /*CGPathDrawingMode枚举
     *typedef CF_ENUM (int32_t, CGPathDrawingMode) {
         kCGPathFill,//只填充而路径没有颜色(表示用非零绕数规则)
         kCGPathEOFill,//使用奇偶规则填充当前路径
         kCGPathStroke,//只有边框
         kCGPathFillStroke,//表示既描线又填充
         kCGPathEOFillStroke//奇偶填充并绘制边框
      };
     *非零绕数规则，假如一个点被从左到右跨过，计数器+1，从右到左跨过，计数器-1，最后，如果结果是0，那么不填充，如果是非零，那么填充。
     *奇偶规则，假如一个点被跨过，那么+1，最后是奇数，那么要被填充，偶数则不填充，和方向没有关系。
     */
    CGContextDrawPath(self.currentContext, kCGPathFillStroke);
    //释放路径对象
    CGPathRelease(path);
    CGPathRelease(path0);
    CGPathRelease(path1);
    
}

#pragma mark 根据顶点画自定义路径
- (void)drawCustomPointPath{
    //设置填充颜色
    CGContextSetRGBFillColor(self.currentContext, 0.6,0.5,0.3,1);//或
    //    CGContextSetFillColor(currentContext, CGColorGetComponents([UIColor greenColor].CGColor));
    
    //设置路径颜色
    CGContextSetRGBStrokeColor(self.currentContext, 0.2, 0.8, 0.5, 1);//或
    //    CGContextSetStrokeColor(currentContext, CGColorGetComponents([UIColor redColor].CGColor));
    
    
    //创建三角形路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 100, 100);
    CGPathAddLineToPoint(path, NULL, 150, 200);
    CGPathAddLineToPoint(path, NULL, 50, 200);

    //将路径加在上下文对象上
    CGContextAddPath(self.currentContext, path);
    //关闭路径
    CGContextClosePath(self.currentContext);
    
    //如果单独的设置只会应用前者填充颜色或者路径颜色之一
    //    CGContextStrokePath(currentContext);
    //    CGContextFillPath(currentContext);
    
    CGContextDrawPath(self.currentContext, kCGPathFillStroke);
    //释放路径对象
    CGPathRelease(path);
    
    
}

- (void)drawPathWithCGContext{
    //绘制三角形(同下面注释掉的三行)
    CGPoint points[] = {
        CGPointMake(100,100),
        CGPointMake(150,200),
        CGPointMake(50,200)
    };
    CGContextAddLines(self.currentContext, points, 3);
//    CGContextMoveToPoint(self.currentContext, 100, 100);
//    CGContextAddLineToPoint(self.currentContext, 150, 200);
//    CGContextAddLineToPoint(self.currentContext, 50, 200);
    //设置填充颜色
    [[UIColor purpleColor] setFill];
    //设置路径颜色
    [[UIColor blackColor] setStroke];
    CGContextClosePath(self.currentContext);
    CGContextDrawPath(self.currentContext, kCGPathFillStroke);
    
    //绘制椭圆（圆形是特殊的椭圆）
    CGContextAddEllipseInRect(self.currentContext, CGRectMake(180, 100, 150, 100));
    //设置填充颜色
    CGContextSetRGBFillColor(self.currentContext, 0.6,0.5,0.3,1);//或
    //CGContextSetFillColor(currentContext, CGColorGetComponents([UIColor greenColor].CGColor));
    //设置路径颜色
    CGContextSetRGBStrokeColor(self.currentContext, 0.2, 0.8, 0.5, 1);//或
    //CGContextSetStrokeColor(currentContext, CGColorGetComponents([UIColor redColor].CGColor));
    CGContextDrawPath(self.currentContext,kCGPathFillStroke);
    
    //绘制扇形
    float radius = 50;
    CGPoint center = CGPointMake(100, 300);
    CGContextMoveToPoint(self.currentContext, center.x, center.y);
    /*参数1：上下文
     *参数2，3：扇形的圆心
     *参数4：扇形的半径
     *参数5：顺时针还是逆时针，1表示顺时针，0表示逆时针（由于Core Graphics的坐标系和UIKit坐标系不同，我们实际看到的视图1表示逆时针，0表示顺时针）
     */
    CGContextAddArc(self.currentContext, center.x, center.y, radius, M_PI_2, M_PI, 1);
    [[UIColor blueColor] setFill];
    [[UIColor cyanColor] setStroke];
    CGContextClosePath(self.currentContext);
    CGContextDrawPath(self.currentContext,kCGPathFillStroke);
    
    //绘制三次贝塞尔曲线
    CGContextMoveToPoint(self.currentContext, 200, 300);
    /*参数1：上下文
     *参数2，3：曲线第一个控制点的x和y坐标
     *参数4，5：曲线第二个控制点的x和y坐标
     *参数6：路径的终点
     */
    CGContextAddCurveToPoint(self.currentContext, 250, 250, 300, 350, 350, 300);
    [[UIColor whiteColor] setFill];
    [[UIColor brownColor] setStroke];
    CGContextClosePath(self.currentContext);
    CGContextDrawPath(self.currentContext,kCGPathFillStroke);
    
    //绘制二次贝塞尔曲线
    CGContextMoveToPoint(self.currentContext, 50, 400);
    /*参数1：上下文
     *参数2，3：曲线控制点的x和y坐标
     *参数4：路径的终点
     */
    CGContextAddQuadCurveToPoint(self.currentContext, 100, 450, 150, 400);
    CGFloat len[] = {5,4,3,6};
    //设置路径宽度
    CGContextSetLineWidth(self.currentContext, 4);
    //设置路径虚线
    CGContextSetLineDash(self.currentContext, 0, len, 4);
    //设置路径颜色
    [[UIColor redColor] setStroke];
    //    CGContextClosePath(self.currentContext);
    CGContextDrawPath(self.currentContext,kCGPathStroke);
}


@end
