module.exports = (grunt) ->
  grunt.initConfig
    watch:
      coffee:
        files: ['app/**/*.coffee']
        tasks: 'coffee'
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
        dest: 'cache/app'
        ext: '.js'

    express:
      dev:
        options:
          script: 'cache/app/server.js'
          port: 3000


  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-express-server'


  grunt.registerTask 'server', ['coffee', 'express:dev', 'watch']
