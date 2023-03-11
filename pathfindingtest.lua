-- Pathfinding using A* Method

getgenv().goal = nil

local nodespacing = 2
local openlist = {workspace}
local closedlist = {}

local goal = CFrame.new(getgenv().goal)
local start = game.Players.LocalPlayer.Character.HumanoidRootPart

local validDirections = {
    Vector3.new(1, 0, 0),
    Vector3.new(-1, 0, 0),
    Vector3.new(1, 0, 1),
    Vector3.new(-1, 0, -1),
    Vector3.new(1, 0, -1),
    Vector3.new(-1, 0, 1),
    Vector3.new(0, 0, 1),
    Vector3.new(0, 0, -1),
}

function createPart(position, parent)
    local part = Instance.new("Part", parent)
    part.Name = "Node"
    part.BrickColor = BrickColor.Blue()
    part.Position = position
    part.Size = Vector3.new(1, 1, 1)
    part.Anchored = true
    part.CanCollide = false

    local G = Instance.new("IntValue", part)
    G.Name = "G"
    G.Value = parent.G.Value + 1

    return part
end

function raycast(start, direction)
    return workspace:FindPartOnRay(Ray.new(start, direction * nodespacing))
end

function tracepath(lastnode)
    local current = lastnode
    repeat task.wait()
        current.BrickColor = BrickColor.Yellow()
        current = current.Parent
    until current.Parent == workspace
end

function scan()
    local final = nil
    repeat task.wait()
        local lowf = math.huge
        local best = nil
        for i, node in ipairs(openlist) do
            local H = (node.Position - goal.Position).Magnitude * nodespacing
            local G = node.G.Value
            if G + H < lowf then
                lowf = G + H
                best = {node, i}
            end
        end
        table.insert(closedlist, best[1])
        if best[1] ~= start then
            best[1].BrickColor = BrickColor.Blue()
        end
        table.remove(openlist, best[2])
        for i, vector in ipairs(validDirections) do
            local raypart, raypos = raycast(best[1].Position, vector)
            if not raypart then
                local part = createPart(raypos, best[1])
                table.insert(openlist, part)
            end
        end
        final = best[1]
    until #openlist <= 0 or (best[1].Position - goal.Position.Magnitude <= nodespacing * 1.5)
    tracepath(final)
end

task.wait(5)
scan()

print("finished cycle")