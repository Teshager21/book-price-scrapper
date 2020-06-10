module UrlMatcher
  def url_matcher(sel)
    url_match = { 'b' => 'https://www.amazon.com/Best-Sellers-Books-Deals/zgbs/books/45/ref=zg_bs_pg_1?_encoding=UTF8&pg=',
                  'bg' => 'https://www.amazon.com/Best-Sellers-Computers-Accessories-Laptop-Messenger-'\
  'Shoulder-Bags/zgbs/pc/3012921011/ref=zg_bs_pg_1?_encoding=UTF8&pg=',
                  'l' => 'https://www.amazon.co.uk/gp/most-wished-for/computers/429886031/ref=zg_mw_pg_2/261-4675934-0829812?ie=UTF8&pg=',
                  'c' => 'https://www.amazon.co.uk/gp/most-wished-for/clothing/ref=zg_mw_pg_2?ie=UTF8&pg=',
                  'cp' => 'https://www.amazon.co.uk/gp/new-releases/automotive/ref=zg_bsnr_pg_2?ie=UTF8&pg=',
                  'm' => 'https://www.amazon.co.uk/Best-Sellers-Music-Symphonies-Orchestras/zgbs/music/505594/ref=zg_bs_pg_2?_encoding=UTF8&pg=',
                  'g' => 'https://www.amazon.co.uk/Best-Sellers-PC-Video-Games-PlayStation-Consoles-Accessories/'\
  'zgbs/videogames/13978348031/ref=zg_bs_pg_2?_encoding=UTF8&pg=',
                  'bt' => 'https://www.amazon.co.uk/gp/most-wished-for/beauty/ref=zg_mw_pg_2?ie=UTF8&pg=' }

    url_match[sel]
  end
end
