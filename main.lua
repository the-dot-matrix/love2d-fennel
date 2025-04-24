fnlORlua = true
if fnlORlua then
  fennel = require("fennel")
  fennel.install({correlate=true})
  fennel.dofile("fnl/mygame.fnl")
else
  require("lua.mygame")
end
