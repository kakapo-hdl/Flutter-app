# Vue reactivity.
要实现数据的响应式变化，我们需要对数据进行观察，
- observe重新定义数据
- Dep类添加两个方法依赖depend和通知方法notify
```
  function observe (obj) {
  Object.keys(obj).forEach(key => {
    let internalValue = obj[key]
    const dep = new Dep()
    Object.defineProperty(obj, key, {
      // 在getter收集依赖项，当触发notify时重新运行
      get () {
        dep.depend()
        return internalValue
      },

      setter用于调用notify
      set (newVal) {
        const changed = internalValue !== newVal
        internalValue = newVal
        if (changed) {
          dep.notify()
        }
      }
    })
  })
  return obj
}
```0