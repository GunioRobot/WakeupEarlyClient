# WakeUpEarlyClient

### BRIEF DESCRIPTION
This client will post "I just woke up" message to [www.hayaoki-seikatsu.com](http://www.hayaoki-seikatsu.com).

### REQUIREMENTS
- an valid account of www.hayaoki-seikatsu.com
- ruby 1.9 +
- [httpclient 2.1.4+](http://dev.ctor.org/http-access2)

### DETAILS
WakeUpEarlyClient will 
- login to www.hayaoki-seikatsu.com using your login name and password
- post "quick-add" cmd to the server to update your wake-up records. 

At this moment(May 2009), www.hayaoki-seikatsu.com provides no API for remote access.
Thus, WakeUpEarlyClient is a quick-and-dirty implementation of [www.hayaoki-seikatsu.com](http://www.hayaoki-seikatsu.com) client.
