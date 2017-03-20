---
layout: post
comments: true
title: terminal_mail
---

col 1
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
<!-- START OF CONTENT AREA -->

<!-- ccount   -->

<!-- ccount  http://hints.macworld.com/article.php?story=20081217161612647  -->

10.5: Send mail from Terminal using mail/sendmail
    [![UNIX](http://hints.macworld.com/layout/hints1/images/topics/t_unix.png "UNIX")](http://hints.macworld.com/index.php?topic=unix)

Dec 22, '08 07:30:00AM • Contributed by: [techiejohn](http://hints.macworld.com/users.php?mode=profile&uid=1060138)

        I have some scripts that need to send mail from the command line. While

<tt>mail</tt> works out of the box, it will not work if your ISP blocks port 25, or if your ISP's network address range is on a blacklist. You could use Mail.app and AppleScript, but that requires that the user in question be logged in, and may not work for scripts run by root.


This solution configures

<tt>postfix</tt>, the service used by

<tt>mail</tt> and

<tt>sendmail</tt>, to relay messages through a third-party server (ideally your ISP), optionally using authentication and TLS. You'll need to be root to create/edit the files and run the commands. So, without further delay, enjoy.

Edit

<tt>/etc/postfix/main.cf</tt> and add the following to the end:

```
relayhost = smtp.yourisp.com # (you can use smtp.yourisp.com:port, such as smtp.yourisp.com:587)
smtp_sasl_auth_enable = yes
smtp_use_tls = yes
smtp_enforce_tls = yes
smtp_sasl_security_options =
smtp_sasl_tls_security_options =
smtp_sasl_tls_verified_security_options =
smtp_tls_loglevel = 2 # optional if you wan to see what's going on with the TLS negotiation in /var/log/mail.log
smtp_sasl_password_maps = hash:/etc/postfix/smtp_sasl_passwords
smtp_tls_per_site = hash:/etc/postfix/smtp_tls_sites
tls_random_source = dev:/dev/urandom
```

Create

<tt>/etc/postfix/smtp_sasl_passwords</tt> with the following contents:

```
smtp.yourisp.com username:password
```

Create

<tt>/etc/postfix/smtp_tls_sites</tt> with the following contents:

```
smtp.yourisp.com MUST_NOPEERMATCH
```

Then run the following commands:

```
$ cd /etc/postfix
$ chmod go-rx smtp_sasl_passwords
$ postmap smtp_sasl_passwords
$ postmap smtp_tls_sites
```

To test, try:

```
echo "Hello" | mail -s "Test" you@domain.com
```

The above test may not work if your provider requires a valid source e-mail address. If that's the case, try:

```
printf "Subject: TestnHello" | sendmail -f you@domain.com you@domain.com
```

This second test form specifies the "from" address as you, but can be changed to anything you want as long as it passes muster with your provider's server. You can now check the logs:

```
tail /var/log/mail.log
```

Or, if you're crafty, you'll open a second Terminal window, and before running the tests in the first window, do:

```
tail -f /var/log/mail.log
```

Here are some notes about options that you see in the content above:

* The

    <tt>*_security_options</tt> settings allow postfix to use plain text passwords during authentication (albeit over TLS).

* The

    <tt>MUST_NOPEERMATCH</tt> in the

    <tt>smtp_tls_sites</tt> file ignores certificate mismatches when negotiating TLS. This, overall, is not a good idea, but I didn't have time to play with it yet and configure the CA. Other options are

    <tt>NONE</tt>,

    <tt>MAY</tt>, and

    <tt>MUST</tt>, but some will require configuration of the CA so that a trust can be established with the server. This, I believe, is configured with

    <tt>smtp_tls_CAfile</tt>. When I get it working, I may post an update.

* The

    <tt>chmod go-rx smtp_sasl_passwords</tt> removes the group and other/world read/execute permissions on the password files. Only the root user should be able to read it.

That is all. I pieced this information together from lots of useless searches and several useful how-to's and postings. I make no guarantees, but I hope it helps someone.

