fx_version 'cerulean'

games { 'gta5' }

lua54 'yes'

author 'tuomass'

description ''

version '1.0.0'

shared_scripts {
'@es_extended/imports.lua',
'@ox_lib/init.lua',
}

client_scripts {
'client/*.lua'
}

server_scripts {
'server/*.lua'
}