#!/usr/bin/env ruby

require "fileutils"


def symlink_to_home(sourcepath)

   sourcepath = File.join(Dir.pwd, sourcepath) 
   sourcefile = "." + File.basename(sourcepath)
   targetpath = File.join(Dir.home(), sourcefile)
   if File.exists?(targetpath)
      puts "file exists"
      unless File.exists?(targetpath + ".local")
         FileUtils.mv(targetpath, targetpath + ".local")
      else
         puts "local also exists"
         abort("dotfile and local dotfile already exist")
      end
   end
  
   puts sourcepath
   puts targetpath
   File.symlink(sourcepath, targetpath) 
   puts "symlink!"
end

