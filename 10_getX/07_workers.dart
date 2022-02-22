
一般在 onInit 中监听

// 监听值改变
ever(count1,(newValue){
  print('发生改变')
})

// 只监听一次
once()

// 防抖，重复点击只触发一次
debounce(count1,(newValue){
  print('发生改变')
},time: Duration(seconds:3))

// 节流
interval(count1,(newValue){
  print('发生改变')
},time: Duration(seconds:3))

