#!/usr/bin/env ruby

require "fileutils"

def symlink_to_home(sourcepath)

   sourcepath = File.join(Dir.pwd, sourcepath) 
   sourcefile = "." + File.basename(sourcepath)
   targetpath = File.join(Dir.home(), sourcefile)
   if File.symlink?(targetpath)
      FileUtils.rm(targetpath)
   elsif File.exists?(targetpath)
      unless File.exists?(targetpath + ".local")
         puts targetpath + " moved to " + targetpath + ".local"
         FileUtils.mv(targetpath, targetpath + ".local")
      else
         abort( targetpath + " and " + targetpath + ".local already exist. Please resolve existing files.")
      end
   end
   File.symlink(sourcepath, targetpath) 
   puts targetpath + " -> " + sourcepath
end

def symlink_all_dotfiles(path)

   Dir.chdir(path)
   # Get all directories (recursively) called "dot"
   dot_dirs = Dir.glob("**/*/").select {|f| File.basename(f) == "dot" }
   # Get all the files in the dot/ directories
   dotfiles = dot_dirs.collect {|dir| Dir.glob(File.join(dir, "*"))}.flatten
   dotfiles.each { |sourcepath| symlink_to_home(sourcepath) } 
end 

if __FILE__ == $0
   symlink_all_dotfiles(Dir.pwd)
end
