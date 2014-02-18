// Generated by CoffeeScript 1.7.1
(function() {
  requirejs.config({
    paths: {
      'text': '../lib/require/text',
      'durandal': '../lib/durandal/js',
      'plugins': '../lib/durandal/js/plugins',
      'transitions': '../lib/durandal/js/transitions',
      'knockout': '../lib/knockout/knockout-3.0.0',
      'jquery': '../lib/jquery/jquery-1.11.0.min',
      'jqueryui': '../lib/jquery/jquery-ui-1.10.4.min'
    }
  });

  define(['durandal/system', 'durandal/app', 'durandal/viewLocator'], function(system, app, locator) {
    system.debug(true);
    app.title = 'TODO List';
    app.configurePlugins({
      router: true
    });
    app.start().then(function() {
      locator.useConvention();
      app.setRoot('viewmodels/shell', 'entrance');
    });
  });

}).call(this);