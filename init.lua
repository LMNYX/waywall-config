local waywall = require("waywall")
local utils = require("utils")

local screen_is1440 = true
local primary_col = "#3dffe8"
local secondary_col = "#fb7dff"

local e_count = 		{ enabled = true, x = 1500, y = 400, size = 7, colorkey = true} 
local thin_pie = 		{ enabled = true, x = 1490, y = 645, size = 3, colorkey = true} 
local thin_percent =	{ enabled = true, x = 1568, y = 1050, size = 8} 
local tall_pie = 		{ enabled = true, x = 1490, y = 645, size = 3, colorkey = true}
local tall_percent =	{ enabled = true, x = 1568, y = 1050, size = 8}

local keybind_remaps = require("remaps").keybind_remaps
keybinds = require("keybinds")

local overlay_path = utils.get_resource("measuring_overlay.png")

local images = {
	measuring_overlay = utils.make_image(overlay_path, {
		dst = screen_is1440 
			and { x = 94, y = 470, w = 900, h = 500 }
			or  { x = 30, y = 340, w = 700, h = 400 },
		}),
}

------------------ Mirrors
local mirrors = {
    e_counter = utils.make_mirror({
		src = { x = 13, y = 37, w = 37, h = 9 },
		dst = { x = e_count.x, y = e_count.y, w = 37*e_count.size, h = 9*e_count.size },
		color_key = e_count.colorkey and {
			input = "#dddddd",
			output = primary_col,
		} or  nil,
	}),


    thin_pie_all = utils.make_mirror({
		src = screen_is1440
    		and { x = 10, y = 694, w = 340, h = 221 }
    		or  { x = 0,  y = 674, w = 340, h = 221 },
		dst = { x = thin_pie.x, y = thin_pie.y, w = 420*thin_pie.size/4, h = 273*thin_pie.size/4 },
    }),

    thin_pie_entities = utils.make_mirror({
		src = screen_is1440
    		and { x = 10, y = 694, w = 340, h = 178 }
    		or  { x = 0,  y = 674, w = 340, h = 178 },
		dst = { x = thin_pie.x, y = thin_pie.y, w = 420*thin_pie.size/4, h = 423*thin_pie.size/4 },
		color_key = {
			input = "#E446C4",
			output = secondary_col,
		},
	}),
    thin_pie_unspecified = utils.make_mirror({
		src = screen_is1440
    		and { x = 10, y = 694, w = 340, h = 178 }
    		or  { x = 0,  y = 674, w = 340, h = 178 },
		dst = { x = thin_pie.x, y = thin_pie.y, w = 420*thin_pie.size/4, h = 423*thin_pie.size/4 },
		color_key = {
			input = "#46CE66",
			output = secondary_col,
		},
	}),
    thin_pie_blockentities = utils.make_mirror({
		src = screen_is1440
    		and { x = 10, y = 694, w = 340, h = 178 }
    		or  { x = 0,  y = 674, w = 340, h = 178 },
		dst = { x = thin_pie.x, y = thin_pie.y, w = 420*thin_pie.size/4, h = 423*thin_pie.size/4 },
		color_key = {
			input = "#ec6e4e",
			output = primary_col,
		},
	}),
	thin_pie_destroyProgress = utils.make_mirror({
		src = screen_is1440
    		and { x = 10, y = 694, w = 340, h = 178 }
    		or  { x = 0,  y = 674, w = 340, h = 178 },
		dst = { x = thin_pie.x, y = thin_pie.y, w = 420*thin_pie.size/4, h = 423*thin_pie.size/4 },
		color_key = {
			input = "#CC6C46",
			output = secondary_col,
		},
	}),
	thin_pie_prepare = utils.make_mirror({
		src = screen_is1440
    		and { x = 10, y = 694, w = 340, h = 178 }
    		or  { x = 0,  y = 674, w = 340, h = 178 },
		dst = { x = thin_pie.x, y = thin_pie.y, w = 420*thin_pie.size/4, h = 423*thin_pie.size/4 },
		color_key = {
			input = "#464C46",
			output = secondary_col,
		},
	}),


	thin_percent_all = utils.make_mirror({
		src = screen_is1440
			and { x = 257, y = 879, w = 33, h = 25 }
			or  { x = 247, y = 859, w = 33, h = 25 },
		dst = { x = thin_percent.x, y = thin_percent.y, w = 33*thin_percent.size, h = 25*thin_percent.size },
    }),
	thin_percent_blockentities = utils.make_mirror({
		src = screen_is1440
			and { x = 257, y = 879, w = 33, h = 25 }
			or  { x = 247, y = 859, w = 33, h = 25 },
		dst = { x = thin_percent.x, y = thin_percent.y, w = 33*thin_percent.size, h = 25*thin_percent.size },
		color_key = {
			input = "#e96d4d",
			output = secondary_col,
		},
    }),
	thin_percent_unspecified = utils.make_mirror({
		src = screen_is1440
			and { x = 257, y = 879, w = 33, h = 25 }
			or  { x = 247, y = 859, w = 33, h = 25 },
		dst = { x = thin_percent.x, y = thin_percent.y, w = 33*thin_percent.size, h = 25*thin_percent.size },
		color_key = {
			input = "#45cb65",
			output = secondary_col,
		},
    }),


	tall_pie_all = utils.make_mirror({
		src = { x = 44, y = 15978, w = 340, h = 221 },
		dst = { x = tall_pie.x, y = tall_pie.y, w = 420*tall_pie.size/4, h = 273*tall_pie.size/4 },
	}),
	tall_pie_entities = utils.make_mirror({
		src = { x = 44, y = 15978, w = 340, h = 178 },
		dst = { x = tall_pie.x, y = tall_pie.y, w = 420*tall_pie.size/4, h = 423*tall_pie.size/4 },
		color_key = {
			input = "#E446C4",
			output = secondary_col,
		},
	}),
    tall_pie_unspecified = utils.make_mirror({
		src = { x = 44, y = 15978, w = 340, h = 178 },
		dst = { x = tall_pie.x, y = tall_pie.y, w = 420*tall_pie.size/4, h = 423*tall_pie.size/4 },
		color_key = {
			input = "#46CE66",
			output = secondary_col,
		},
	}),
    tall_pie_blockentities = utils.make_mirror({
		src = { x = 44, y = 15978, w = 340, h = 178 },
		dst = { x = tall_pie.x, y = tall_pie.y, w = 420*tall_pie.size/4, h = 423*tall_pie.size/4 },
		color_key = {
			input = "#ec6e4e",
			output = primary_col,
		},
	}),
	tall_pie_destroyProgress = utils.make_mirror({
		src = { x = 44, y = 15978, w = 340, h = 178 },
		dst = { x = tall_pie.x, y = tall_pie.y, w = 420*tall_pie.size/4, h = 423*tall_pie.size/4 },
		color_key = {
			input = "#CC6C46",
			output = secondary_col,
		},
	}),
	tall_pie_prepare = utils.make_mirror({
		src = { x = 44, y = 15978, w = 340, h = 178 },
		dst = { x = tall_pie.x, y = tall_pie.y, w = 420*tall_pie.size/4, h = 423*tall_pie.size/4 },
		color_key = {
			input = "#464C46",
			output = secondary_col,
		},
	}),


	tall_percent_all = utils.make_mirror({
		src = { x = 291, y = 16163, w = 33, h = 25 },
		dst = { x = tall_percent.x, y = tall_percent.y, w = 33*tall_percent.size, h = 25*tall_percent.size },
    }),
	tall_percent_blockentities = utils.make_mirror({
		src = { x = 291, y = 16163, w = 33, h = 25 },
		dst = { x = tall_percent.x, y = tall_percent.y, w = 33*tall_percent.size, h = 25*tall_percent.size },
		color_key = {
			input = "#e96d4d",
			output = secondary_col,
		},
    }),
	tall_percent_unspecified = utils.make_mirror({
		src = { x = 291, y = 16163, w = 33, h = 25 },
		dst = { x = tall_percent.x, y = tall_percent.y, w = 33*tall_percent.size, h = 25*tall_percent.size },
		color_key = {
			input = "#45cb65",
			output = secondary_col,
		},
    }),


	eye_measure = utils.make_mirror({
		src = { x = 162, y = 7902, w = 60, h = 580 },
		dst = screen_is1440 
			and { x = 94, y = 470, w = 900, h = 500 }
			or  { x = 30, y = 340, w = 700, h = 400 },
		}),
}

local show_mirrors = function(eye, f3, tall, thin)

	images.measuring_overlay(eye)
	mirrors.eye_measure(eye)

	if e_count.enabled then
    	mirrors.e_counter(f3)
	end

	if thin_pie.enabled then
		if thin_pie.colorkey then
			mirrors.thin_pie_entities(thin)
			mirrors.thin_pie_unspecified(thin)
			mirrors.thin_pie_blockentities(thin)
			mirrors.thin_pie_destroyProgress(thin)
			mirrors.thin_pie_prepare(thin)
		else
			mirrors.thin_pie_all(thin)
		end
	end

	if thin_percent.enabled then
		if thin_percent.colorkey then
			mirrors.thin_percent_blockentities(thin)
			mirrors.thin_percent_unspecified(thin)
		else
			-- mirrors.thin_percent_all(thin)
		end
	end

	if tall_pie.enabled then
		if tall_pie.colorkey then
			mirrors.tall_pie_entities(tall)
			mirrors.tall_pie_unspecified(tall)
			mirrors.tall_pie_blockentities(tall)
			mirrors.tall_pie_destroyProgress(tall)
			mirrors.tall_pie_prepare(tall)
		else
			mirrors.tall_pie_all(tall)
		end
	end

	if tall_percent.enabled then
		if tall_percent.colorkey then
			mirrors.tall_percent_blockentities(tall)
			mirrors.tall_percent_unspecified(tall)
		else
			-- mirrors.tall_percent_all(tall)
		end
	end


end

local thin_enable = function()
    show_mirrors(false, true, false, true)
end

local tall_enable = function()
	show_mirrors(true, true, true, false)
end
local wide_enable = function()
	show_mirrors(false, false, false, false)
end

local res_disable = function()
    show_mirrors(false, false, false, false)
end

local resolutions = {
	thin = utils.make_res(screen_is1440 and 350 or 340, screen_is1440 and 1100 or 1080, thin_enable, res_disable),
	tall = utils.make_res(384, 16384, tall_enable, res_disable),
	wide = utils.make_res(screen_is1440 and 2560 or 1920, screen_is1440 and 400 or 300, wide_enable, res_disable),
}


local config = {
    input = {
        layout = "us",
        repeat_rate = 40,
        repeat_delay = 300,

        sensitivity = 1.0,
        confine_pointer = false,
        remaps = keybind_remaps
    },
    theme = {
        background = "#303030ff",
        background_png = utils.get_resource("varesa.png")
    },
}

config.actions = {
    [keybinds.thin_resolution] = function()
        resolutions.thin()
    end,
    [keybinds.wide_resolution] = function()
		resolutions.wide()
	end,

	[keybinds.tall_resolution] = function()
		resolutions.tall()
	end,
    [keybinds.floating_toggle] = function()
        waywall.show_floating(not waywall.floating_shown())
    end,
    [keybinds.run_external_software] = function()
        if not utils.is_nnb_running() then
            waywall.exec("sh /home/jill/ninja.sh")
        end
    end,
    [keybinds.fullscreen_toggle] = function()
        waywall.toggle_fullscreen()
    end,
}

return config
