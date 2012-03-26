Sprout::Specification.new do |s|
  s.name = "asmock"
  s.version = "1.0"

  s.add_remote_file_target do |t|
    t.url = "http://jaist.dl.sourceforge.net/project/asmock/asmock/asmock-1.0/asmock-v1.0.zip"
    t.archive_type = "zip"
    t.md5 = "d2d79e12b42f2948125390bdb5ac225e"
    t.platform = :universal
    #t.add_library :swc,'asmock-v1.0-asunit-v4.0.swc'
    t.add_library :swc,'asmock-v1.0.swc'
  end
end

Sprout::Specification.new do |s|
  s.name = "asmock_asunit_integration"
  s.version = "1.0"

  s.add_remote_file_target do |t|
    t.url = "http://jaist.dl.sourceforge.net/project/asmock/asmock/asmock-1.0/asmock-v1.0.zip"
    t.archive_type = "zip"
    t.md5 = "d2d79e12b42f2948125390bdb5ac225e"
    t.platform = :universal
    t.add_library :swc,'asmock-v1.0-asunit-v4.0.swc'
  end
end

