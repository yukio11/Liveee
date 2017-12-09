class Scraping

  def self.live_urls
    links = []
    month = 1

    while month <= 12 do
      if month <= 9
        links << ("http://www.yoshimoto.co.jp/lumine/schedule0"+ "#{month}"+".php")
      else
        links << ("http://www.yoshimoto.co.jp/lumine/schedule"+"#{month}"+".php")
      end
      month = month + 1
    end

    links.each do |link|
    get_products(link)
    end
  end

  def self.get_products(link)
    agent = Mechanize.new
    page = agent.get(link)

    schedule_part = page.search('#schedule_pc')
    eles = schedule_part.search('ul')

    eles.each do |ele|
      if ele.search('#dayTitle').present?
        day = ele.search('#dayTitle').inner_text
      else
        day = Live.last.day
      end
      title = ele.search('li .schedule_con, .lastChild')[1].inner_text
      starting_time = ele.search('li .schedule_con, .lastChild')[0].inner_text
      place = 'ルミネtheよしもと'
      price = ele.search('li .schedule_con, .lastChild')[4].inner_text
      performers_list = ele.search('li .schedule_con, .lastChild')[2].inner_text
      detail = ele.search('li .schedule_con, .lastChild')[3].inner_text

      live = Live.where(title: title, day: day, starting_time: starting_time, place: place, price: price, performer: performers_list, detail: detail).first_or_create
      binding.pry
      performers = performers_list.gsub(/\r\n|\s/,"").gsub(/\[.*?\]/,"／").split("／").reject(&:blank?)
      performers.each do |name|
        performer = Performer.where(name: name).first_or_create
        live.performers << performer
      end
    end
  end
end
