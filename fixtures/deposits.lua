local bint = require('.bint')(256)

local deposits = {
  {
      User = "0x53b517968dbD242De0348A2f0d70D55C1BF7BcD3",
      Amount = tostring(bint(82114) * bint.ipow(10, 18)),
      Token = "stETH",
      Recipient = "FWlLi87gg_ZU5guWirjLCp-7TyzcK8CgVdOCng5Rgzk"
  },
  {
      User = "0x53b517968dbD242De0348A2f0d70D55C1BF7BcD3",
      Amount = tostring(bint(323423) * bint.ipow(10, 18)),
      Token = "DAI",
      Recipient = "FWlLi87gg_ZU5guWirjLCp-7TyzcK8CgVdOCng5Rgzk"
  },
  {
      User = "0x53b517968dbD242De0348A2f0d70D55C1BF7BcD3",
      Amount = "19999999999999999998",
      Token = "stETH",
      Recipient = "0hzBwBIkuJ96p544dY3v_dRCc0sws9c6l6AQPQvIavs"
  },
  {
      Token = "DAI",
      Amount = tostring(bint(20) * bint.ipow(10,18)),
      User = "0x5aFe4d6B18ff37fF05885D66906be163500b3f7A",
      Recipient = "BUGLYgDGnKi511RADVivKIlyeYs61FnwwxObkdaJ6Mw"
  },
  {
      Token = "stETH",
      Amount = tostring(bint(50) * bint.ipow(10, 18)),
      User = "0x92a4F58009dF9eaC5f2AF6d05977683639f0060e",
      Recipient = "UpRii1hPhIhmL9dx70lXa2uvDPB1IyIbHEZH-eRO0ac"
  },
  {
      Token = "stETH",
      Amount = tostring(bint(1000) * bint.ipow(10, 18)),
      User = "0x92a4F58009dF9eaC5f2AF6d05977683639f0060e",
      Recipient = "UpRii1hPhIhmL9dx70lXa2uvDPB1IyIbHEZH-eRO0ac"
  },
  {
      Token = "DAI",
      Amount = tostring(bint(1000000) * bint.ipow(10, 18)),
      User = "0x92a4F58009dF9eaC5f2AF6d05977683639f0060e",
      Recipient = "UpRii1hPhIhmL9dx70lXa2uvDPB1IyIbHEZH-eRO0ac"
  }
}

return deposits
