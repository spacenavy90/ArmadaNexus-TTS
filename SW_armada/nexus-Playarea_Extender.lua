local play_pos = {-53.91035, 0.9,0.0399617 } --0.85507
local stored_pos = {-35.96619, -2, 0.34441}

local tokens = {'2c6267','79d121','68abfc','c09d88','36f595','895e91','fccd7e','f11694',
'8e9ead','0da18e','435013','7c26e3','6754db','8623c2','25a8a0','c223ce','2516df','5028b2','b75a56','014584'}
--'98ac21'

local offset = {99,0,0}

local rules = {'4d1c5d','05b88d','c5d582'}

local rules_offset = {115,0,0}

local damage_offset = {80,0,3}
local damage1_id = '3adb31'
local damage2_id = '88213e'

local mission_offset = {93,0,8 }
local mission_id = '1127bb'

local starters = {'497e62', '62bcb0', '267866', '72b9e5'}
local starters_offset = {99,0,-15}

local init_offset = {85,0,12 }
local init_id = '0f9cf8'

local vector = {}
function onload()
    self.interactable = false
    local store_btn = {}
    store_btn.width = 90
    store_btn.height = 40
    store_btn.position = {-1,0.1,1.1 }
    store_btn.click_function = "store"
    store_btn.function_owner = self
    store_btn.label = "Hide"
    store_btn.font_size = 30
    self.createButton(store_btn)
    local use_btn = {}
    use_btn.width = 90
    use_btn.height = 40
    use_btn.position = {-1,0.1,-1.1 }
    use_btn.click_function = "use"
    use_btn.function_owner = self
    use_btn.label = "Show"
    use_btn.font_size = 30
    self.createButton(use_btn)
end
function store()
    self.setPosition(stored_pos)
    moveIdsByOffset(tokens, vector.neg(offset),-1)
    moveIdsByOffset(rules, vector.neg(rules_offset),-1)
    moveIdsByOffset({damage1_id,damage2_id},vector.neg(damage_offset),-1)
    moveIdsByOffset({mission_id},vector.neg(mission_offset),-1)
    moveIdsByOffset(starters, vector.neg(starters_offset), -1)
    moveIdsByOffset({init_id},vector.neg(init_offset),-1)
--    self.interactable = true
end

function use()
    self.setPosition(play_pos)
    moveIdsByOffset(tokens, offset)
    moveIdsByOffset(rules, rules_offset)
    moveIdsByOffset({damage1_id,damage2_id},damage_offset)
    moveIdsByOffset({mission_id},mission_offset)
    moveIdsByOffset(starters, starters_offset)
    moveIdsByOffset({init_id},init_offset)
    self.interactable = false

end
function moveIdsByOffset(ids, offset,dir)
    if dir == nil then
        dir = 1
    end
    for _,id in ipairs(ids) do
        local obj = getObjectFromGUID(id)
        if obj ~= nil and obj.getPosition()[1]*dir<0 then
            obj.setPosition(vector.add(obj.getPosition(),offset))
        end
    end
end
function vector.add(pos, offset)
    return {pos[1] + offset[1],pos[2] + offset[2],pos[3] + offset[3]}
end
function vector.sub(pos, offset)
    return {pos[1] - offset[1],pos[2] - offset[2],pos[3] - offset[3]}
end
function vector.neg(v)
    return {-v[1],-v[2],-v[3]}
end
