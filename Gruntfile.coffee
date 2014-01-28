module.exports = (grunt) ->
  grunt.initConfig
    watch:
      coffee:
        files: ['app/scripts/*.coffee'],
        tasks: 'coffee'

    coffee:
      glob_to_multiple:
        expand: true,
        flatten: true,
        cwd: 'app/scripts',
        src: ['*.coffee'],
        dest: 'cache/app/scripts',
        ext: '.js'

    express:
      dev:
        options:
          script: 'cache/app/scripts/server.js'
          port: 3000


  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-express-server'

  grunt.registerTask 'server', ['express', 'watch']
