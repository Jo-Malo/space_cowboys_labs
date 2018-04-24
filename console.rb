require('pry')
require_relative('models/bounty_hunter')

hunter1 = Bounty.new({
  'name' => 'Boba Fett',
  'species' => 'Human',
  'home_world' => 'Kamino',
  'last_known_location' => 'Tatooine'
  })
hunter1.save()

  hunter2 = Bounty.new({
    'name' => 'Spike Spiegel',
    'species' => 'Human',
    'home_world' => 'Mars',
    'last_known_location' => 'Jupiter'
    })
hunter2.save()

  binding.pry
  nil
