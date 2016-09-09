---
layout: post
title: Source of Truth Local Db or Schema in Git
---
no changes added to commit (use "git add" and/or "git commit -a")
sjohnson@ScottJohnsonMacbookAir:~/appdatallc/banks$ git status | grep migrate
	db/migrate/20160908163042_create_page2016_q3s.rb
	db/migrate/20160908163054_create_page2016_q4s.rb
	db/migrate/20160908163110_create_page_body2016_q3s.rb
	db/migrate/20160908163120_create_page_body2016_q4s.rb
	db/migrate/20160908163141_create_link2016_q3s.rb
	db/migrate/20160908163149_create_link2016_q4s.rb
	db/migrate/20160908163320_create_unique_url2016_q3s.rb
	db/migrate/20160908163333_create_unique_url2016_q4s.rb
sjohnson@ScottJohnsonMacbookAir:~/appdatallc/banks$ rm db/migrate/20160908163042_create_page2016_q3s.rb db/migrate/20160908163054_create_page2016_q4s.rb db/migrate/20160908163110_create_page_body2016_q3s.rb db/migrate/20160908163120_create_page_body2016_q4s.rb db/migrate/20160908163141_create_link2016_q3s.rb db/migrate/20160908163149_create_link2016_q4s.rb db/migrate/20160908163320_create_unique_url2016_q3s.rb db/migrate/20160908163333_create_unique_url2016_q4s.rb