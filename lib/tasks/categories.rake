namespace :categories do

  task :import => :environment do
    ['appliances',
    'antiques',
    'barter',
    'bikes',
    'boats',
    'books',
    'business',
    'computer',
    'free',
    'furniture',
    'general',
    'jewelry',
    'materials',
    'rvs',
    'sporting',
    'tickets',
    'tools',
    'wanted',
    'arts+crafts',
    'auto parts',
    'baby+kids',
    'beauty+hlth',
    'cars+trucks',
    'cds/dvd/vhs',
    'cell phones',
    'clothes+acc',
    'collectibles',
    'electronics',
    'farm+garden',
    'garage sale',
    'household',
    'motorcycles',
    'music instr',
    'photo+video',
    'toys+games',
    'video gaming'].each do |category|
      Category.find_or_create_by_name(category)
    end

 
  end

end
