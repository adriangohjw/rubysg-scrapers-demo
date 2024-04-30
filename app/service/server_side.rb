class ServerSide
  def initialize
    @url = 'http://localhost:3000/server_side_rendering'
    @content = nil
  end

  def call
    scrape_content
    { total_count:, jobs: }
  end

  private

  def scrape_content
    body = HTTParty.get(@url).body
    @content = Nokogiri::HTML(body)
  end

  def total_count
    @content.at_xpath('.//h1')
            .children[0]
            .text
            .gsub(/\D/, '')
            .to_i
  end

  def jobs
    @content.xpath('.//ul//li')
            .map do |element|
              {
                id: element.attr('id').to_i,
                title: element.text
              }
            end
  end
end
