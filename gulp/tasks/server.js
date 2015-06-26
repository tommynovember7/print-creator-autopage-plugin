var gulp      = require('gulp');
var webserver = require('gulp-webserver');
var config    = require('../config');

gulp.task('webserver', function() {
  gulp.src(config.webroot)
    .pipe(webserver({
      livereload: true,
      directoryListing: true,
      https: true
    }));
});
