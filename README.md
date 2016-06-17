# angular2-mk-browserify

An easy pluggable script for SPAs in ES5/ES6 that use GNU Make as a
build system.

## Prologue

In the past, Anguler2 was distributed as several UMD modules: a giant
one that had everything in itself, a middle-sized one supposedly
suited for production & a "small" one that was of a dubious utility
for it didn't include even an http module. Every .umd.js had a
minified companion.

Now it's all ancient history & Angular2 ships in multiple small
modules w/ an idea that you yourself should pick up only what you
need. The question is _how_ to do it properly.

## Why?

Instead of the ugliness of

~~~
<script src="../node_modules/zone.js/dist/zone.js"></script>
<script src="../node_modules/reflect-metadata/Reflect.js"></script>
<script src="../node_modules/rxjs/bundles/Rx.umd.js"></script>
<script src="../node_modules/@angular/core/bundles/core.umd.js"></script>
<script src="../node_modules/@angular/common/bundles/common.umd.js"></script>
<script src="../node_modules/@angular/compiler/bundles/compiler.umd.js"></script>
<script src="../node_modules/@angular/platform-browser/bundles/platform-browser.umd.js"></script>
<script src="../node_modules/@angular/platform-browser-dynamic/bundles/platform-browser-dynamic.umd.js"></script>
<script src="../node_modules/@angular/http/bundles/http.umd.js"></script>
...
~~~

you'll need to include only 1 file into your html:

~~~
<script src="angular.browserify.js"></script>
~~~

which will be automatically mifinied in a production build.

## Usage

You'll need to copy 2 files to your project:

* `ng.m4` -- a template from which browserify will grab angular src
  files;
* `mg.mk` -- a makefile "plugin" that you `include` into your
  Makefile.


This repo contains a hello world angular2 app & a primitive makefile
for creating 2 different project builds:

* `build.development` -- where Angular2 works in its "developer" mode;
* `build.profuction` -- where Angular2 works in its "production"
  mode + we minify the bundle.

You clone the repo, then type

~~~
$ npm install
$ make
$ make NODE_ENV=production
$ make server
~~~

& open http://localhost:8000/build.development/ to browse the
development version & http://localhost:8000/build.production/ for the
production one.

## See also

https://github.com/gromnitsky/jekyllmk contains the real world example
of a Make-based build system that uses this plugin.

## License

MIT.
