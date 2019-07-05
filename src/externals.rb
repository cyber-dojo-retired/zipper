require_relative 'external_disk'
require_relative 'external_sheller'
require_relative 'external_stdout_logger'
require_relative 'saver_service'
require_relative 'zipper'
require 'net/http'

class Externals

  def zipper
    @zipper ||= Zipper.new(self)
  end

  def saver
    @saver ||= SaverService.new(self)
  end

  def shell
    @shell ||= ExternalSheller.new(self)
  end

  def disk
    @disk ||= ExternalDisk.new(self)
  end

  def log
    @log ||= ExternalStdoutLogger.new(self)
  end

  def http
    @http ||= Net::HTTP
  end

end
