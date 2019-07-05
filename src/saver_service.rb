require_relative 'http_json/request_packer'
require_relative 'http_json/response_unpacker'

class SaverService

  def initialize(external)
    requester = HttpJson::RequestPacker.new(external, 'saver', 4537)
    @http = HttpJson::ResponseUnpacker.new(requester)
  end

  def kata_manifest(kata_id)
    @http.get(__method__, {
      kata_id:kata_id
    })
  end

  def avatars_started(kata_id)
    @http.get(__method__, {
      kata_id:kata_id
    })
  end

  def avatar_increments(kata_id, avatar_name)
    @http.get(__method__, {
      kata_id:kata_id,
      avatar_name:avatar_name
    })
  end

  def tag_visible_files(kata_id, avatar_name, tag)
    @http.get(__method__, {
      kata_id:kata_id,
      avatar_name:avatar_name,
      tag:tag
    })
  end

end
