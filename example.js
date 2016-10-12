/* globals ng */
'use strict';

let Example = ng.core.Component({
    selector: 'example',
    template: `
<h1>{{ pkg?.name }} {{ pkg?.version }}</h1>
<p>
Browserify: {{ pkg?.dependencies?.browserify }}<br>
<span *ngIf='pkg?.dependencies'>Angular: {{ pkg.dependencies['@angular/core'] }}</span>
</p>
`
}).Class({
    constructor: [ng.http.Http, function(http) {
	console.log('Example')

	http.get('package.json').map(res => res.json()).
	    subscribe(json => {
		this.pkg = json
	    })
    }]
})

// I don't even.
let ExampleModule = ng.core.NgModule({
    imports: [ng.platformBrowser.BrowserModule, ng.http.HttpModule],
    declarations: [ Example ],
    bootstrap: [ Example ],
}).Class({
    constructor: function() {}
})

let boot = function() {
    ng.platformBrowserDynamic.platformBrowserDynamic()
	.bootstrapModule(ExampleModule);
}

if (document.readyState === "loading") {
    document.addEventListener('DOMContentLoaded', boot)
} else {
    boot()
}
