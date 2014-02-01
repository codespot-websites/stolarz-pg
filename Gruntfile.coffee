module.exports = (grunt) ->
  grunt.initConfig
    watch:
      coffee:
        files: ['app/**/*.coffee']
        tasks: 'coffee'
      sass:
        files: ['app/**/*.sass']
        tasks: 'sass'
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

    sass:
      dist:
        files: [
          {
            expand: true
            cwd: 'app'
            src: ['**/*.sass']
            dest: 'cache'
            ext: '.css'
          }
        ]

    express:
      dev:
        options:
          script: 'cache/server.js'
          port: 3000


  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-express-server'


  grunt.registerTask 'server', ['coffee', 'sass', 'express:dev', 'watch']
