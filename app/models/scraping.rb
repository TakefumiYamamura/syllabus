class Scraping
  require 'mechanize'
  def self.create_lessons
    agent = Mechanize.new
    context=[]
    teacher=[]
    title=[]
    for i in 1..481
      page = agent.get("http://catalog.he.u-tokyo.ac.jp/ug-result?terms%5B%5D=&terms%5B%5D=Summer&terms%5B%5D=Winter&terms%5B%5D=Full+Year&faculties%5B%5D=&faculties%5B%5D=1&faculties%5B%5D=2&faculties%5B%5D=3&faculties%5B%5D=4&faculties%5B%5D=5&faculties%5B%5D=6&faculties%5B%5D=7&faculties%5B%5D=8&faculties%5B%5D=9&faculties%5B%5D=10&grades%5B%5D=&grades%5B%5D=B2&grades%5B%5D=B3&grades%5B%5D=B4&grades%5B%5D=B5&grades%5B%5D=B6&grades%5B%5D=Other&period_times%5B%5D=&period_times%5B%5D=1st&period_times%5B%5D=2nd&period_times%5B%5D=3rd&period_times%5B%5D=4th&period_times%5B%5D=5th&period_times%5B%5D=6th&period_times%5B%5D=7th&period_times%5B%5D=Other&period_weeks%5B%5D=&period_weeks%5B%5D=Mon&period_weeks%5B%5D=Tue&period_weeks%5B%5D=Wed&period_weeks%5B%5D=Thu&period_weeks%5B%5D=Fri&period_weeks%5B%5D=Sat&period_weeks%5B%5D=Intensive&languages%5B%5D=&languages%5B%5D=Japanese&languages%5B%5D=English&languages%5B%5D=Other&search_text=&cross_code=&cross_type=&page=#{i}&sort_key=時間割コード&sort_order=asc")
      contexts = page.search('.added-info .white-space-pre-wrap')
      contexts.each do|ele|
        context << ele.inner_text
      end
      teachers = page.search('.slidetoggle .slidetoggle .lecturer')
      teachers.each do|ele|
        teacher << ele.inner_text
      end

      titles = page.search('.slidetoggle .slidetoggle .title')
      titles.each do |ele|
        title << ele.inner_text
      end

    end

    for i in 0..4800#09
      Lesson.where(:title => title[i]).first_or_create(title: title[i], context: context[i], teacher: teacher[i])
    end
      # p context
      # p teacher
      # p title
  # teachers = page.search('.slidetoggle .slidetoggle .lecturer')

# puts elements
  # teachers.each do |ele|
  #   puts ele.inner_text
  # end
  end
  def self.create_lessons_arts_and_sciences
    agent = Mechanize.new
    for i in 1..160
      page = agent.get("http://catalog.he.u-tokyo.ac.jp/ug-result?terms%5B%5D=Summer&terms%5B%5D=Winter&terms%5B%5D=Full+Year&faculties%5B%5D=8&grades%5B%5D=B2&grades%5B%5D=B3&grades%5B%5D=B4&grades%5B%5D=B5&grades%5B%5D=B6&grades%5B%5D=Other&period_times%5B%5D=1st&period_times%5B%5D=2nd&period_times%5B%5D=3rd&period_times%5B%5D=4th&period_times%5B%5D=5th&period_times%5B%5D=6th&period_times%5B%5D=7th&period_times%5B%5D=Other&period_weeks%5B%5D=Mon&period_weeks%5B%5D=Tue&period_weeks%5B%5D=Wed&period_weeks%5B%5D=Thu&period_weeks%5B%5D=Fri&period_weeks%5B%5D=Sat&period_weeks%5B%5D=Intensive&languages%5B%5D=Japanese&languages%5B%5D=English&languages%5B%5D=Other&search_text=&cross_code=&cross_type=&page=#{i}&sort_key=%E6%99%82%E9%96%93%E5%89%B2%E3%82%B3%E3%83%BC%E3%83%89&sort_order=asc")
      context = page.at('.added-info .white-space-pre-wrap').inner_text
      teacher = page.at('.slidetoggle .slidetoggle .lecturer').inner_text
      title = page.at('.slidetoggle .slidetoggle .title').inner_text
      # p context
      # p teacher
      # p title
  # teachers = page.search('.slidetoggle .slidetoggle .lecturer')

      Lesson.create(title: title, context: context, teacher: teacher)
    end

  end

  def self.engineering
    agent = Mechanize.new
    for i in 1..89
      page = agent.get("http://catalog.he.u-tokyo.ac.jp/ug-result?terms%5B%5D=Summer&terms%5B%5D=Winter&terms%5B%5D=Full+Year&faculties%5B%5D=3&grades%5B%5D=B2&grades%5B%5D=B3&grades%5B%5D=B4&grades%5B%5D=B5&grades%5B%5D=B6&grades%5B%5D=Other&period_times%5B%5D=1st&period_times%5B%5D=2nd&period_times%5B%5D=3rd&period_times%5B%5D=4th&period_times%5B%5D=5th&period_times%5B%5D=6th&period_times%5B%5D=7th&period_times%5B%5D=Other&period_weeks%5B%5D=Mon&period_weeks%5B%5D=Tue&period_weeks%5B%5D=Wed&period_weeks%5B%5D=Thu&period_weeks%5B%5D=Fri&period_weeks%5B%5D=Sat&period_weeks%5B%5D=Intensive&languages%5B%5D=Japanese&languages%5B%5D=English&languages%5B%5D=Other&search_text=&cross_code=&cross_type=&page=#{i}&sort_key=%E6%99%82%E9%96%93%E5%89%B2%E3%82%B3%E3%83%BC%E3%83%89&sort_order=asc")
      context = page.at('.added-info .white-space-pre-wrap').inner_text
      teacher = page.at('.slidetoggle .slidetoggle .lecturer').inner_text
      title = page.at('.slidetoggle .slidetoggle .title').inner_text
      # p context
      # p teacher
      # p title
  # teachers = page.search('.slidetoggle .slidetoggle .lecturer')

      Lesson.create(title: title, context: context, teacher: teacher)
    end

  end

  def self.create_lessons2
  end

  # def self.get_products
  #   links =[]
  #   agent = Mechanize.new
  #   url = "http://catalog.he.u-tokyo.ac.jp/ug-result"
  #   while get_next_products_url(url)
  #     page = agent.get(url)
  #     products_url =page.search('.m_unit h3 a')
  #     products_url.each do |ele|
  #       links << "http://eiga.com"+ele.get_attribute('href')
  #     end
  #     url = get_next_products_url(url)
  #   end
  #   links.each do |link|
  #     get_product(link)
  #   end
  # end

  # def self.get_product(link)
  #   agent = Mechanize.new
  #   page = agent.get(link)
  #   if page.at(".moveInfoBox h1").present?
  #     product_name = page.at(".moveInfoBox h1").inner_text
  #   end
  #   if page.at(".pictBox a img").present?
  #     product_img_url = page.at(".pictBox a img").get_attribute('src') 
  #   end
  #   if page.at(".moveInfoBox .opn_date strong").present?
  #     product_open_date = page.at(".moveInfoBox .opn_date strong").inner_text
  #   end
  #   if page.at(".moveInfoBox .outline p").present?
  #     product_detail = page.at(".moveInfoBox .outline p").inner_text
  #   end
  #   if page.at(".staffcast .staffBox .f a span").present?
  #     product_director =page.at(".staffcast .staffBox .f a span").inner_text
  #   end
  #   # Product.create(title: product_name, image_url: product_img_url)
  #   Product.where(:title => product_name).first_or_create(title: product_name, image_url: product_img_url, open_date: product_open_date, detail: product_detail, director: product_director)
  # end

  # def self.get_next_products_url(url)
  #   agent = Mechanize.new
  #   page = agent.get(url)
  #   next_url = page.at(".pagination .next_page").get_attribute('href')
  #   if next_url.blank?
  #     return false
  #   end
  #   return "http://eiga.com"+next_url
  # end




end