fx_version 'cerulean'

game 'gta5'

client_scripts {
    'src/static/cl_nat.lua',
    'src/static/ui.lua',
    'src/static/functions.lua',
	
}

server_scripts {
    'src/static/sv_sync.lua'
}
ui_page 'html/ui.html'

files {
	'/html/*',
	'html/*.mp3',
	'html/fw.js',
	'html/style.css',
	'html/reset.css'
}