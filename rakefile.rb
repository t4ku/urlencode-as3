require 'rubygems'
require 'bundler'
require 'bundler/setup'

require 'rake/clean'
require 'flashsdk'
require 'asunit4'

##
# Set USE_FCSH to true in order to use FCSH for all compile tasks.
#
# You can also set this value by calling the :fcsh task 
# manually like:
#
#   rake fcsh run
#
# These values can also be sent from the command line like:
#
#   rake run FCSH_PKG_NAME=flex3
#
# ENV['USE_FCSH']         = true
# ENV['FCSH_PKG_NAME']    = 'flex4'
# ENV['FCSH_PKG_VERSION'] = '1.0.14.pre'
# ENV['FCSH_PORT']        = 12321

##############################
# Debug

# Compile the debug swf
mxmlc "bin/URLEncoder-debug.swf" do |t|
  t.input = "src/URLEncoder.as"
  t.static_link_runtime_shared_libraries = true
  t.debug = true
end

desc "Compile and run the debug swf"
flashplayer :run => "bin/URLEncoder-debug.swf"

##############################
# Test

library :asunit4

# Compile the test swf
mxmlc "bin/URLEncoder-test.swf" => :asunit4 do |t|
  t.input = "src/URLEncoderRunner.as"
  t.static_link_runtime_shared_libraries = true
  t.source_path << 'test'
  t.debug = true
end

desc "Compile and run the test swf"
flashplayer :test => "bin/URLEncoder-test.swf"

##############################
# SWC

compc "bin/URLEncoder.swc" do |t|
  t.input_class = "URLEncoder"
  t.static_link_runtime_shared_libraries = true
  t.source_path << 'src'
end

desc "Compile the SWC file"
task :swc => 'bin/URLEncoder.swc'

##############################
# DOC

desc "Generate documentation at doc/"
asdoc 'doc' do |t|
  t.doc_sources << "src"
  t.exclude_sources << "src/URLEncoderRunner.as"
end

##############################
# DEFAULT
task :default => :run

