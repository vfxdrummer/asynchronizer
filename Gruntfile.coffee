module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    coffee:
      compile:
        files:
          'tmp.js': 'src/asynchronizer.coffee'

    uglify:
      options:
        banner: '''/*! <%= pkg.name %> <%= pkg.version %>, Copyright <%= grunt.template.today("yyyy") %> Kevin Goslar, see https://github.com/kevgo/asynchronizer.js */\n'''

      build:
        src: 'tmp.js',
        dest: 'asynchronizer.js'

    clean: ['tmp.js']

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  grunt.registerTask('release', ['coffee', 'uglify', 'clean'])
