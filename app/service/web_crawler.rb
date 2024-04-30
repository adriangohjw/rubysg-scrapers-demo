class WebCrawler
  def initialize(url: 'http://localhost:3000/client_side_rendering')
    @url = url
    @content = nil
  end

  def call
    scrape_content
    { total_count:, jobs: }
  end

  private

  def scrape_content
    driver = Selenium::WebDriver.for :chrome
    driver.get(@url)
    sleep(5)
    @content = Nokogiri::HTML(driver.page_source)
    driver.quit
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
