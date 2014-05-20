module.exports = function(grunt) {
  grunt.loadNpmTasks('grunt-contrib-requirejs');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-copy');

  grunt.initConfig({
    copy: {
      images: {
        expand: true,
        cwd: 'images',
        src: '**',
        dest: '../public/web/images'
      },
      html: {
        expand: true,
        cwd: 'html',
        src: '**',
        dest: '../public/web/html'
      },
      index: {
        src: 'index.html',
        dest: '../public/web/index.html'
      }
    }, /* copy */
    requirejs: {
      compile: {
        options: {
          baseUrl: 'js',
          out: '../public/web/web.js',
          name: 'bootstrap'
        }
      }
    }, /* requirejs */
    sass: {
      dist: {
        files: {
          '../public/web/web.css': 'css/web.css.scss'
        }
      }
    }, /* sass */
    watch: {
      index: {
        files: ['index.html'],
        tasks: ['copy:index'],
        options: {
          livereload: true
        }
      },
      html: {
        files: ['html/**/*.html'],
        tasks: ['copy:html'],
        options: {
          livereload: true
        }
      },
      css: {
        files: ['css/**/*.scss'],
        tasks: ['sass'],
        options: {
          livereload: true
        }
      },
      js: {
        files: ['js/**/*.js'],
        tasks: ['requirejs'],
        options: {
          livereload: true
        }
      }
    } /* watch */
  });

  grunt.registerTask('default', ['sass', 'copy', 'requirejs', 'watch']);
};
