module.exports = (grunt) ->
	grunt.initConfig
		watch:
			coffee:
				files: ['app/**/*.coffee']
				tasks: 'coffee'
			stylus:
				files: ['app/**/*.styl']
				tasks: 'stylus'

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
					paths: ['node_modules/bootstrap3-stylus/lib'],
					urlfunc: 'embedurl'
					use: [
						require('stylus-font-face')
					]
				files:
					'cache/public/main.css': ['app/public/*.styl']


	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-stylus'
	grunt.loadNpmTasks 'grunt-contrib-watch'

	grunt.registerTask 'deploy', ['coffee', 'stylus']
	grunt.registerTask 'server', () ->
		this.async()
		require './cache/server.js'
	grunt.registerTask 'server:dev', ['deploy', 'server', 'watch']
