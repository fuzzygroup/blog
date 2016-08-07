#Failing at React Native Just By Starting
One of the problems of having done development for a long, long time is you get use to certain idiosyncratic practices of your own.  Things that you do for every project because you know that if you don't you're going to have issues.  One of mine is that I always, always, always, unfailingly, always create a top level directory in a project called docs and in there I put ANYTHING and EVERYTHING related to the project.

If its ruby and a gem dumps some anomalous output on startup?  Bam!  It goes in docs.  If its nokogiri and I can't install it for the 11,000th time and I finally dig up this bit of arcana:

gem install nokogiri -- --with-xml2-include=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include/libxml2 --use-system-libraries

Bam!  It goes in docs.

And those idiosyncratic practices?  Sometimes they kill you...

I've been messing about with React Native recently and I created a new project, fired it off in the Simulator and got this little gem:

!(http://imgur.com/a/fPhGP)

And it has really left me scratching my head.  Google gave me nothing helpful.  Nor did Stack Overflow.  Nor did trying again and again.  Finally I was typing out a description to a buddy and it hit me "Schmuck!  You always do exactly the same thing -- DO NOT make a docs directory".  So I moved the directory and fired off the simulator and:

!(http://imgur.com/a/RnC4T)

Habits.  Great when they work.  Sometimes they just plain don't.