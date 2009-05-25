WakeUpEarlyClient

=== REQUIREMENTS
1. an valid account of www.hayaoki-seikatsu.com
2. ruby 1.9 +
3. httpclient 2.1.4+ (http://dev.ctor.org/http-access2)

=== BRIEF DESCRIPTION
This client will post "I just woke up" message to www.hayaoki-seikatsu.com.

=== DETAILS
WakeUpEarlyClient will 
1. login to www.hayaoki-seikatsu.com using your login name and password
2. post "quick-add" cmd to the server to update your wake-up records. 

At this moment(May 2009), www.hayaoki-seikatsu.com provides no API for remote access.
WakeUpEarlyClient is a quick-and-dirty implementation of www.hayaoki-seikatsu.com client.
