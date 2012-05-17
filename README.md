# io-info
Jacob Peck

## Overview

Just a small script to dump information about your Io installation.

## Usage

    ./info.io <params>
    
or

    io info.io <params>

Where params is either empty, meaning dump everything (same as `-a -s -d`), or 
any combination of the following:

    -a   Print addon information
    -d   Print Io distribution information
    -s   Print system information

Look in the directory afterwards for a file named "info.txt".

## License

Public domain.

## Why?

Easier to debug issues, and an easy way to report installed addons for iobin builds.
