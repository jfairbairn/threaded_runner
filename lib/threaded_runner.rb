class ThreadedRunner
  def initialize(cmd)
    @cmd = cmd
  end

  attr_reader :thread

  def start(wait_for=nil)
    @thread = Thread.new do
      IO.popen(@cmd) do |f|
        @pid = f.pid
        f.each_line do |line|
          line.strip!
          yield line if block_given?
          if @regex && line =~ @regex
            @gotit = true
            @regex = nil
          end
        end
      end
    end
    nil
    wait_for(wait_for) if wait_for
  end

  def wait_for(output)
    @regex = output
    sleep 0.2 until @gotit
    @gotit = false
    nil
  end

  def stop
    Process.kill("TERM", @pid)
  end
end
