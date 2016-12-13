Gem::Specification.new do |s|
  s.name        = 'threaded_runner'
  s.version     = '1.0.1'
  s.licenses    = ['MIT']
  s.summary     = "A simple class to run subprocesses under test in a thread"
  s.description = <<-EOT
    This class allows you to wait for your subprocess to output a line matching a
    given regex, and also yields each line of the subprocess' output to an optional
    block.
  EOT
  s.authors     = ["James Fairbairn"]
  s.email       = 'james@netlagoon.com'
  s.files       = ["lib/threaded_runner.rb", "long_talkative_process.sh"]
  s.homepage    = 'https://github.com/jfairbairn/threaded_runner'
end
