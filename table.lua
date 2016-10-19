window = {}

window.prototype = {x = 0, y = 0, width = 100, height = 100}
window.mt = {}

function window.new (o)
   setmetatable(o, window.mt)
   return o
end

window.mt.__index = function (table , key)
 return window.prototype[key]
end

w = window.new{x = 10, y = 20}
print(w.width)


function setDefault(t,d)
local mt = {__index = function () return d end}

setmetatable(t, mt)

end

tab = {x = 10, y = 20}
print(tab.x, tab.w)
setDefault(tab, 22)

print(tab.w)


local index = {}

local ta = {
__index = function (t,k)
print("access to elemt "..tostring(k))
return t[index][k]
end,

__newindex = function(t,k,v)		
print("update of elemet "..tostring(k).." to "..tostring(v))
t[index][k] = v
end
}

function track(t)
local proxy = {}
proxy[index] = t
setmetatable(proxy, ta)
return proxy
end

t = track{"one"}

print(index)
t["test"] = "hello"
print(t["test"])
print(index)

