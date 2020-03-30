local hf = {}

-- Print key, value pairs of table
hf.printTable = function(table)
  for key, value in pairs(table) do
    print(key, ": ", value)
  end
end

return hf