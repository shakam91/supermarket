fx_version 'adamant'
game 'gta5'

-----------------------------------------------
--------------------RageUI---------------------
-----------------------------------------------

client_scripts {
    'RageUI/RMenu.lua',
    'RageUI/menu/RageUI.lua',
    'RageUI/menu/Menu.lua',
    'RageUI/menu/MenuController.lua',
    'RageUI/components/*.lua',
    'RageUI/menu/elements/*.lua',
    'RageUI/menu/items/*.lua',
    'RageUI/menu/panels/*.lua',
    'RageUI/menu/panels/*.lua',
    'RageUI/menu/windows/*.lua',
}

-----------------------------------------------
-----------------Client------------------------
-----------------------------------------------

client_scripts {
	"client/*.lua",
}

-----------------------------------------------
--------------------server---------------------
-----------------------------------------------

server_scripts {
    '@async/async.lua',
    '@mysql-async/lib/MySQL.lua',
	"server/*.lua",
}

-----------------------------------------------
--------------------Config---------------------
-----------------------------------------------

shared_scripts {
    "config.lua",
}

