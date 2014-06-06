#created by Amit on 5/5/14.
gulp = require 'gulp'
gulpUtil = require 'gulp-util'
coffee = require 'gulp-coffee'
connect = require 'gulp-connect'
jade = require 'gulp-jade'
uglify = require 'gulp-uglify'
concat = require 'gulp-concat'
watch = require 'gulp-watch'
cssmin = require 'gulp-cssmin'
connect = require 'gulp-connect'
jshint = require 'gulp-jshint'
plumber = require 'gulp-plumber'
livereload = require 'gulp-livereload'
rename = require 'gulp-rename'


sources =
  libjsfiles:['vendor/lodash.js', 'vendor/jquery-2.1.0.js', 'vendor/angular/js/angular.js', 'vendor/angular/js/angular-resource.js', 'vendor/angular/js/angular-ui-router.js', 'vendor/bootstrap/js/bootstrap.min.js']
  libcssfiles:['vendor/bootstrap/css/bootstrap.min.css']
  coffee: ['src/coffee/**/*.coffee','!src/coffee/app.coffee','!src/coffee/service.coffee']
  jade:['src/jade/**/*.jade']
  css:['src/css/**/*.css']

gulp.task 'connect', connect.server({
  root: ['build/html','build/js','build/css','build/other']
  port: 4444
  liveReload: true
})

gulp.task 'coffee', ->
  gulp.src('src/coffee/app.coffee')
    .pipe watch (files) ->
      files.pipe(plumber())
      .pipe(coffee({bare: true}))
      .pipe(uglify({mangle:false}))
      .pipe(rename({ suffix: '.min' }))
      .pipe(gulp.dest('build/js/'))
  gulp.src('src/coffee/service.coffee')
    .pipe watch (files) ->
      files.pipe(plumber())
      .pipe(coffee({bare: true}))
      .pipe(uglify({mangle:false}))
      .pipe(rename({ suffix: '.min' }))
      .pipe(gulp.dest('build/js/'))
  watch {glob: sources.coffee, emit:'all'}, (files) ->
    files.pipe(plumber())
    .pipe(coffee({bare: true}))
    .pipe(uglify({mangle:false}))
    .pipe(concat('all.min.js'))
    .pipe(gulp.dest('build/js/'))
  return

gulp.task 'script', ->
  watch {glob: sources.libjsfiles}, (files) ->
    files.pipe(plumber())
    .pipe(concat('lib.min.js'))
    .pipe(gulp.dest('build/js/'))

gulp.task 'bootstrap', ->
  gulp.src('vendor/bootstrap/fonts/*.*')
  .pipe(gulp.dest('build/other/fonts/'))
  watch {glob: ['src/images/*.*']}, (files) ->
    files.pipe(plumber())
    .pipe(gulp.dest('build/other/images/'))

gulp.task 'jade',->
  watch {glob: sources.jade}, (files) ->
    files.pipe(plumber())
    .pipe(jade())
    .pipe(gulp.dest('build/html/'))

gulp.task 'cssmin', ->
  watch {glob: sources.css}, (files) ->
    files.pipe(plumber())
    .pipe(cssmin())
    .pipe(concat('all.min.css'))
    .pipe(gulp.dest('build/css/'))
  watch {glob: sources.libcssfiles}, (files) ->
    files.pipe(plumber())
    .pipe(cssmin())
    .pipe(concat('lib.min.css'))
    .pipe(gulp.dest('build/css/'))

gulp.task 'default', ['cssmin','coffee','bootstrap', 'jade', 'connect', 'script'], ->
  console.log 'gulp started..'