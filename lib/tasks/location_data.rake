namespace :location_data do

  task :import => :environment do
    country = Country.find_or_create_by_name('United States')
    state = State.find_or_create_by_name_and_country_id('Alabama', country.id)
    City.find_or_create_by_name_and_state_id('Hose', state.id)
    City.find_or_create_by_name_and_state_id('Billyville', state.id)
    state = State.find_or_create_by_name_and_country_id('Alaska', country.id)
    City.find_or_create_by_name_and_state_id('ZillaVille', state.id)
    state = State.find_or_create_by_name_and_country_id('Arizona', country.id)
    City.find_or_create_by_name_and_state_id('BLAH', state.id)
    country = Country.find_or_create_by_name('Canada')
    state = State.find_or_create_by_name_and_country_id('Alabaster', country.id)
    City.find_or_create_by_name_and_state_id('Something', state.id)
  end

end
