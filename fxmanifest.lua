fx_version 'cerulean'

game 'gta5'

client_scripts {
    'src/static/cl_nat.lua'
}

server_scripts {
    'src/static/sv_sync.lua'
}
ui_page 'html/ui.html'

files {
	'/html/*',
	'html/*.mp3',
	'html/fw.js'
}