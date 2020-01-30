resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Wipe'

version '1.0'

server_script {
	'@mysql-async/lib/MySQL.lua',
	"server.lua"
}

dependencies {
	'es_extended'
}