-- helper.lua
-- List features and usage of the schema.

local function translator(input, seg)
  if input:find('^help$') then
    local table = {
          { '以形查音', '~键引导以形查音' }
        , { '选单', 'Ctrl+` 或 F4' }
        , { 'lua字符串', '以大写字母开头' }
        , { '农历反查', '任意大写字母引导+数字日期' }
        , { '时间', rv_var["date_var"] .. '｜' .. rv_var["time_var"] .. '｜' .. rv_var["week_var"] }
        , { '历法', rv_var["nl_var"] .. '｜' .. rv_var["jq_var"] }
    }
    for k, v in ipairs(table) do
      local cand = Candidate('help', seg.start, seg._end, v[2], ' ' .. v[1])
      cand.preedit = input .. '\t简要说明'
      yield(cand)
    end
  end
end

return translator