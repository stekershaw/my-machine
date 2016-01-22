# 'my-machine' chef cookbook

This chef cookbook is intended to speed up the process of getting up and running on a new PC.

# How to use

As this cookbook is intended to be used on a fresh PC, it would normally be run using chef zero.

1. Download the chef-client
1. Open a command prompt, "Run as administrator"
1. Run `chef-client -z -o my-machine`

# Features

+ For Windows
    + Install useful programs using chocolatey

# Notes

*Chocolatey* does not play too nicely with manually installed packages. For that reason, once this cookbook is used, stick with it, or, at the least, stick to using *chocolatey* where possible.
