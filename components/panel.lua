local addon, ns = ...

local layout = ns.lib.layout
local components = ns.components

components.panel = function(self, config)

	local frame = self:frame({ parent = config.parent })
	local engine = layout:new(frame, {
		layout = "vertical",
		origin = "TOPLEFT",
		wrap = false,
		autosize = "y",
		itemSpacing = 15
	})

	frame.addChild = function(f, child)
		engine:addChild(child)
		engine:performLayout()
	end

	frame.read = function()

		for i, child in ipairs(engine.children) do
			child:read()
		end

	end

	frame.write = function()

		for i, child in ipairs(engine.children) do
			child:write()
		end

		frame:written()

	end

	frame.written = function() end

	return frame

end
