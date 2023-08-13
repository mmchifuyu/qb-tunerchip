fx_version 'cerulean'
game 'gta5'

description 'QB-TunerChip'
version '1.0.0'

ui_page 'html/index.html'

client_scripts {
    'client/main.lua',
    'client/nos.lua'
}

server_script '@oxmysql/lib/MySQL.lua'
server_script 'server/main.lua'

files {
    'html/*',
    "html/mi.png",
    "html/audio/pop.wav",
}

lua54 'yes'