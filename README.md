## Screenshots of the official website for each member of Congress

Taken with [phantomjs](https://github.com/ariya/phantomjs) on 6/12/2013 with member data from the [Sunlight Congress API](http://sunlightlabs.github.io/congress/). Since screenshots are via PhantomJS, some elements may appear differently in the screenshots (webfonts, flash, annoying lightboxes, etc.).

Each screenshot filename contains a timestamp when it was taken with the number of seconds since Epoch (`Time.now.to_i`).

=====

To run the script, first make sure [HTTParty](https://github.com/jnunemaker/httparty) and [PhantomJS](https://github.com/ariya/phantomjs) are installed locally.

Secondly, the data for the members of Congress is from the wonderful Sunlight Foundation, so sign up for an API key and add it to `screenshotter.rb` before running.

Once you are set, run `ruby screenshotter.rb` on the command line. Add `time` to track the total time (`time ruby screenshotter.rb`). It took ~2 hours when I ran this the first time. The screenshots are added to a directory in the current directory called `screenshots`, so create one if one isn't available.
