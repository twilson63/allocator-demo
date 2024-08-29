local bint = require('.bint')(256)
local calcValue = require('calcvalue')
local distribute = require('distribute')
local helpers = require('helpers')

--[[
  allocate rewards based on a list of deposits
]]
local allocate = { _version = "0.0.2" }

-- @param deposits is a table of table objects with an amount and token property
-- @param reward is a bint compatable number or string to distribute
-- @param prices is a lookup table of prices denominated by 4 by token
-- @param yields is a lookup table of yields denominated by 4 by token
-- @returns a table of items with a score and reward property
function allocate.compute(deposits, reward, prices, yields)
  assert(type(deposits) == "table", 'deposits must be a table')
  assert(bint(reward), 'reward must be bint')
  assert(type(prices) == "table", 'prices must be table')
  assert(type(yields) == "table", 'yields must be table')
  local scores = Utils.map(
    function (deposit)
        assert(type(deposit), 'deposit must be table')
        assert(deposit.Token ~= nil, 'deposit must have a token symbol')
        assert(deposit.Amount ~= nil, 'deposit must have an amount')
        local price = prices[deposit.Token]
        local yield = yields[deposit.Token]
        deposit.score = tostring(calcValue(deposit.Amount, price, yield))
        return deposit
    end,
    deposits
  )
  local totalScores = helpers.sum('score', scores)
  return Utils.map(distribute(reward, totalScores), scores)
end

return allocate
