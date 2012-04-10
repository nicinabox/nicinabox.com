---
layout: post
title: "Geektool Scripts"
date: 2009-4-19 22:29
comments: true
categories: Projects
---

**UPDATE 8/15/2011:** Most of these scripts have been [repackaged in a gem](http://rubygems.org/gems/geeklets2).
***
<nav class="try">
  <a class="download" href="https://github.com/nicinabox/Geektool-Scripts/zipball/master">Download <small>v1.7 (Github)</small></a>
</nav>

These are an ever growing compilation of scripts and code snippets that I have written or collected in a format that’s easy to understand and use. If you need help feel free to email me at [nic`nicinabox.com](mailto:nic`nicinabox.com), **but please read the documentation first**. 

I encourage you to checkout some of the Desktop screenshots on Flickr (some are very nice!) for ideas.If you have a script or something clever you'd like to add to this collection, please contact me.

These commands require that you actually install the scripts. Some are built into the system, but most are custom. For more information, check `readme.html` included in the download. 

<!--more-->

This package includes the following: 

  * Network info
  * Unread Gmail
  * Uptime
  * Calendar (with current day denoted)
  * Weather
  * System Stats
  * Recent Music plays

## Installing the scripts

Note: this step can be skipped if you're using the gem.

Copy files to a directory in your PATH. I recommend `/usr/local/bin`. This will make the commands accessible by just typing the name of it, eg.
{% codeblock %}
$ airport
{% endcodeblock %}

That's it!

## Using the scripts

After you've got them installed you'll want to pop open Geektool and enter the command in the Command field. You should immediately see output on your desktop. For time sensitive scripts like weather you'll probably want to set a refresh time of 30-60 seconds.

If you're using the gem and RVM you need to include and extra line in the command. Geektool runs in a subshell and does not use custom PATHs specified in your `.bash_profile` or `.profile`. Simply tell Geektool to use your profile as the source of the subshell (the period means "source").

{% codeblock command.sh %}
. /Users/nic/.bash_profile # be sure to include this part if using the gem
weather -z 60614
{% endcodeblock%}

Obviously substitute my username for your own shortname.

### Uptime

Displays your system's uptime.

{% codeblock %}
uptime | awk '{print "Uptime : " $3 " " $4 " " $5 }' | sed -e 's/.$//g'
{% endcodeblock %}
{% codeblock uptime output %}
Uptime : 25 days, 8:28
{% endcodeblock %}

### Network Info

Displays your Wifi or Ethernet IP. Also see IP script

#### Internal IP

{% codeblock %}
ifconfig en1 | grep "inet " | awk '{print $2}'
{% endcodeblock %}
{% codeblock network output %}
192.168.1.2
{% endcodeblock %}

#### External IP

{% codeblock %}
curl -s www.whatismyip.com/automation/n09230945.asp | awk {'print "External : " $1'}
{% endcodeblock %}
{% codeblock network output %}
External: 72.45.123.12
{% endcodeblock %}

### Calendar

{% codeblock %}
cal | sed "s/^/ /;s/$/ /;s/ $(date +%e) / $(date +%e | sed 's/./#/g') /"
{% endcodeblock %}
{% codeblock calendar output %}
      July 2009 
Su Mo Tu We Th Fr Sa 
          1  2  3  4 
 5  6  7  8  9 ## 11 
12 13 14 15 16 17 18 
19 20 21 22 23 24 25 
26 27 28 29 30 31 
{% endcodeblock %}

### Memory Usage

Prints out total Memory Usage

{% codeblock %}
top -l 1 | awk '/PhysMem/ {print "Used: " $8}'
top -l 1 | awk '/PhysMem/ {print "Inactive:  " $6+$10"M"}'
{% endcodeblock %}
{% codeblock memory output %}
Used:  1769M
Inactive:  688M
{% endcodeblock %}

### CPU Usage

#### Horizontal

{% codeblock %}
top -l 1| awk '/CPU usage/ {print $6, $7, $8, $9, $10, $11, $12, $13}'
{% endcodeblock %}
{% codeblock CPU output %}
CPU usage: 22.22% user, 71.11% sys, 6.67% idle
{% endcodeblock %}

#### Vertical

{% codeblock %}
echo CPU usage
top -l 1| awk '/CPU usage/ {print $8, $9}'
top -l 1| awk '/CPU usage/ {print $10, $11}'
top -l 1| awk '/CPU usage/ {print $12, $13}'
{% endcodeblock %}
{% codeblock CPU output %}
CPU usage
22.22% user,
71.11% sys,
6.67% idle{% endcodeblock %}

### Unread Gmail

This script requires a username and password. You must edit it before use. Replace `USERNAME` `PASSWORD` with your username and password. _Credits to Greg Newman._

{% codeblock %}
gmail
{% endcodeblock %}
{% codeblock Unread Gmail output %}
3 Unread
{% endcodeblock %}

### IP Address

{% codeblock %}
ipaddress
{% endcodeblock %}
{% codeblock IP Address output %}
Ethernet : INACTIVE
Airport : 161.45.27.132
{% endcodeblock %}