var page   = require('webpage').create(),
    system = require('system'),
    t, address, filename;

if (system.args.length === 1) {
    console.log('Usage: screenshot.js <some URL>');
    phantom.exit();
}

page.evaluate(function() {
    document.body.bgColor = 'white';
});

page.viewportSize = {
    width:  1280,
    height: 1024
  };

page.settings.userAgent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17';

page.customHeaders = {
      Referer: address
  };


address = system.args[1];
directory = system.args[2];
filename = system.args[3];

page.open(address, function(status) {
    if (status !== 'success') {
        console.log('failed to load address');
    } else {

          page.evaluate(function () {

              // get rid of some of the damn popups

              var cover = document.querySelector("#html-greyed-out");
              if (cover !== null) {
                  cover.style.display = "none";
              }

              var popup = document.querySelector("#boxes-box-congress_enews_popup");
              if (popup !== null) {
                  popup.style.display = "none";
              }

          });

          window.setTimeout(function() {
              page.render('screenshots/' + directory + '/' + filename + '.png');
              phantom.exit();
          }, 10000);


    }

});