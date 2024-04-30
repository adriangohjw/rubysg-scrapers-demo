class ClientSideApi
  def initialize
    @url = 'http://localhost:3000/api/jobs'
  end

  def call
    HTTParty.get(@url)
  end
end
