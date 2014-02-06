module.exports = (grunt) ->
	grunt.initConfig
		watch:
			coffee:
				files: ['app/**/*.coffee']
				tasks: 'coffee'
			stylus:
				files: ['app/**/*.styl']
				tasks: 'stylus'
			express:
				files: ['cache/**/*']
				tasks: ['express:dev']
				options:
					spawn: false
		coffee:
			glob_to_multiple:
				expand: true,
				flatten: true,
				cwd: 'app',
				src: ['**/*.coffee']
				dest: 'cache'
				ext: '.js'
		stylus:
			compile:
				options:
					urlfunc: 'embedurl'
				files:
					'cache/public/main.css': 'app/public/*.styl'
		express:
			dev:
				options:
					script: 'cache/server.js'
					port: 3000

	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-stylus'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-express-server'

	grunt.registerTask 'deploy', ['coffee', 'stylus']
	grunt.registerTask 'server:dev', ['deploy', 'express:dev', 'watch']
