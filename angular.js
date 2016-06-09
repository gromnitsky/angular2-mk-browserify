'use strict';

require('zone.js')
require('reflect-metadata')
require('rxjs')

var ng = {}
ng.core = require('@angular/core')
ng.common = require('@angular/common')
ng.compiler = require('@angular/compiler')
ng.platformBrowser = require('@angular/platform-browser')
ng.platformBrowserDynamic = require('@angular/platform-browser-dynamic')
ng.http = require('@angular/http')
ng.router_deprecated = require('@angular/router-deprecated')

module.exports = ng
