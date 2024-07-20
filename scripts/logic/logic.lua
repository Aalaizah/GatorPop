-- put logic functions here using the Lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
-- don't be afraid to use custom logic functions. it will make many things a lot easier to maintain, for example by adding logging.
-- to see how this function gets called, check: locations/locations.json
-- example:
function has_at_least_n_bracelet(n)
    local count = Tracker:ProviderCountForCode('bracelet')
    local val = (count >= tonumber(n))
    if ENABLE_DEBUG_LOG then
        print(string.format("called has_at_least_n_bracelet: count: %s, n: %s, val: %s", count, n, val))
    end
    if val then
        return 1 -- 1 => access is in logic
    end
    return 0 -- 0 => no access
end

function has_at_least_n_pencil(n)
    local count = Tracker:ProviderCountForCode('thrown_pencil')
    local val = (count >= tonumber(n))
    if ENABLE_DEBUG_LOG then
        print(string.format("called has_at_least_n_pencil: count: %s, n: %s, val: %s", count, n, val))
    end
    if val then
        return 1 -- 1 => access is in logic
    end
    return 0 -- 0 => no access
end

function can_clear_tutorial()
    if ENABLE_DEBUG_LOG then
        print(string.format("called can_clear_tutorial"))
    end
    if has("pot_q") and has("starter_hat") and cardboard_destroyer() then
        return 1 -- 1 => access is in logic
    end
    return 0 -- 0 => no access
end
-- NEED to check for freeplay in slot_data

function cardboard_destroyer()
    local cd = {"stick","sword","grabby_hand","bug_net","nunchucks","wrench","paleolithic","pot_lid","platter","martin_shield","big_leaf","trampoline","trash_can_lid","rock","blaster","shuriken","bomb","paint_gun"}
    for i, item in ipairs(cd) do
        if has(item) then
            return 1
        end
    end
    return 0
end

function sword()
    local swords = {"stick","sword","paintbrush","spear","grabby_hand","laser_sword","bug_net","nunchucks","wrench","pencil","paleolithic","wand"}
    for i, item in ipairs(swords) do
        if has(item) then
            return 1
        end
    end
    return 0
end

function shield()
    local shields = {"pot_lid","palette","platter","tube","skateboard","martin_shield","chessboard","big_leaf","tower_shield","trash_can_lid","blue_scooter"}
    for i, item in ipairs(shields) do
        if has(item) then
            return 1
        end
    end
    return 0
end

function ranged()
    local ranged = {"rock","blaster","shuriken","paint_gun"}
    for i, item in ipairs(ranged) do
        if has(item) then
            return 1
        end
    end
    return 0
end

function hard()
    return 0 --eventual option for harder completion for two quests
end