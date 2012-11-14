#!/usr/bin/env io

// Print Io distribution information
// Jacob Peck
// 20120517

args := System args rest

all := (args size == 0)
sysinfo := (args contains("-s"))
distinfo := (args contains("-d"))
addinfo := (args contains("-a"))

info := ""

if(all or sysinfo,
  info = info .. "System information:\n"
  info = info .. "  Number of cores: #{System activeCpus}\n"
  info = info .. "  Platform: #{System platform}, version #{System platformVersion}\n\n"
)

if(all or distinfo,
  info = info .. "Io Language distribution information:\n"
  info = info .. "  Io distribution name: #{System iovmName}\n"
  info = info .. "  Io version number: #{System version}\n"
  info = info .. "  iospec version: #{System iospecVersion}\n"
  info = info .. "  Io path: #{System ioPath}\n"
  info = info .. "  Launch path: #{System launchPath}\n"
  info = info .. "  Launch script: #{System launchScript}\n"
  info = info .. "  AddonLoader search paths:\n"
  AddonLoader searchPaths foreach(s, info = info .. ("    #{s}\n" interpolate))
  info = info .. "\n"
)

if(all or addinfo,
  info = info .. "Io Language Addons installed:\n"
  AddonLoader addons sort foreach(a, info = info .. ("  #{a name}:  #{a addonPath}\n" interpolate))
)

info = info interpolate

writeln(info)

File with("info.txt") remove openForAppending write(info) close
