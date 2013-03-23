user { 'tiddlyweb':
	ensure  => present,
	comment => 'TiddlyWeb user',	
	managehome => true,
	home => '/home/tiddlyweb',
	groups => ['sudo'],	
	shell => '/bin/bash',
}

class {'apache': }