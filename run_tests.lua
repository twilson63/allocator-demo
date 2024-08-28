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

t:add("test allocation compute2", function () 
  local reward = "21180781930430"
  -- loaded from global...
  local balances = allocator.compute(Deposits or deposits, reward, prices, yields)
  print(helpers.take(4, balances))
  print("Total Rewarded: " .. helpers.sum("reward", balances))
  print("Reward: " .. reward)
end)

t:add("calculate score", function() 
  local score = calcValue(bint.ipow(10, 18), "100", "600")
  assert(tostring(score) == "6000000000000000000000000000000000000")
end)

t:add("distribute reward", function ()
  local acct = {
    score = "1000000"
  }
  local reward = "21180781930430"
  local totalScore = "1000000000000000000"
  acct = distribute(reward, totalScore)(acct)
  -- print("reward: " .. acct.reward)
  assert(acct.reward == "21")
end)

return t:run()
