namespace :jobs do
  task :import => :environment do
    ['accounting+finance',
    'admin / office',
    'arch / engineering',
    'art / media / design',
    'biotech / science',
    'business / mgmt',
    'customer service',
    'education',
    'food / bev / hosp',
    'general labor',
    'government',
    'human resources',
    'internet engineers',
    'legal / paralegal',
    'manufacturing',
    'marketing / pr / ad',
    'medical / health',
    'nonprofit sector',
    'real estate',
    'retail / wholesale',
    'sales / biz dev',
    'salon / spa / fitness',
    'security',
    'skilled trade / craft',
    'software / qa / dba',
    'systems / network',
    'technical support',
    'transport',
    'tv / film / video',
    'web / info design',
    'writing / editing',
    '[ETC]',
    '[ part-time ] '].each do |job|
      Category.find_or_create_by_name_and_post_type(job, 'jobs')
    end
  end
end
