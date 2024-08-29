local testUnit = require('@rakis/test-unit')
local calcValue = require('calcvalue')
local distribute = require('distribute')
local allocator = require('main')
local helpers = require('helpers')
local bint = require('.bint')(256)

local t = testUnit.new('Allocation Tests')

local deposits = require('fixtures.deposits')
local prices = require('fixtures.prices')
local yields = require('fixtures.yields')

-- Reset list
if Deposits then
  Deposits = Utils.map(function (d) d.Score = nil; d.Reward = nil; d.score = nil; d.reward = nil; return d; end, Deposits)
end

function excludeZero (d)
  return bint(d.Amount) > 0
end

t:add("test allocation compute", function () 
  local reward = "21180781930430"
  -- loaded from global...
  local balances = allocator.compute(deposits, reward, prices, yields)
  print(helpers.take(1, Utils.filter(excludeZero, balances)))
  print("Total Rewarded: " .. helpers.sum("Reward", balances))
  print("Reward: " .. reward)
end)

t:add("test allocation compute2", function () 
  local reward = "21180781930430"
  -- loaded from global...
  local balances = allocator.compute(Deposits or deposits, reward, prices, yields)
  print(helpers.take(10, Utils.filter(excludeZero, balances)))
  print("Total Rewarded: " .. helpers.sum("Reward", balances))
  print("Reward: " .. reward)
end)

t:add("calculate score", function() 
  local score = calcValue(bint.ipow(10, 18), "100", "600")
  assert(tostring(score) == "6000000000000000000000000000000000000")
end)

t:add("distribute reward", function ()
  local acct = {
    Score = "1000000"
  }
  local reward = "21180781930430"
  local totalScore = "1000000000000000000"
  acct = distribute(reward, totalScore)(acct)
  -- print("reward: " .. acct.reward)
  assert(acct.Reward == "21")
end)

return t:run()
