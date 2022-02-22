
dpx 6s 是 2

window.physicalSize.width; 物理宽度
window.physicalSize.height; 物理高度

// 需要放在 MaterlApp 的子widget 中获取，因为它需要 某个东西初始化之后才能获取到
MediaQuery.of(context).size.width
MediaQuery.of(context).size.height

drp = window.devicePixelRtio;  直接获取dpr

// 算出逻辑宽高
width = physicalSizeWidth / dpr
height = physicalSizeHeight / dpr
height = window.padding.top / dpr // 状态栏高度 

rpx = width / 750;
px = width / 750 * 2;

MediaQuery.of(context).padding.top; // 状态栏高度 

封装到 size_fit 
调用 init 方法初始化

小程序
将所有屏幕都分成 750
375 /750 
320 / 750
rpx = width / 750;

width = 200 * hit.rpx;
