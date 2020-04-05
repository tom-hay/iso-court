require 'faker'

FAMILY = ['Pappa Bear', 'Ben', 'Emily', 'Pops', 'Nonna', 'Boss Lady']
FRIENDS = ['Tom', 'Wes', 'Cam', 'Juliette', 'Cassi', 'Mannon']

puts "destroying Sentences"
Sentence.destroy_all
puts "destroying Charges"
Charge.destroy_all
UserCommitment.destroy_all
puts "destroying Commitments"
Commitment.destroy_all
puts "destroying Links Between"
puts "destroying Users"
UserGroup.destroy_all
User.destroy_all
puts "destroying Groups"
Group.destroy_all

puts "Making groups"
Group.create(name: 'me familia')
Group.create(name: 'Le Wagon Friends')

puts "FRIENDS USERS"
FRIENDS.each do |name|
  User.create(username: name, password: 'password', email: Faker::Internet.email)
  UserGroup.create(group_id: (Group.find_by(name: 'Le Wagon Friends')).id, user_id: User.last.id)
  puts "name: #{User.last.username}, email: #{User.last.email}"
end
puts "FAMILY USERS"
FAMILY.each do |name|
  User.create(username: name, password: 'password', email: Faker::Internet.email)
  UserGroup.create(group_id: (Group.find_by(name: 'me familia')).id, user_id: User.last.id)
  puts "name: #{User.last.username}, email: #{User.last.email}"
end

COMMITMENTS = [
  ['Exercise', 'Go for a walk each day'],
  ['Exercise', 'Each day do 30 push ups throughout the day'],
  ['Exercise', 'Each day do 30 sit ups throughout the day'],
  ['Mindfulness', 'Meditate for 30mins once a day'],
  ['Hygiene', 'Don\'t touch your face without first washing hands'],
  ['Health', 'Drink atleast 2L of water each day'],
  ['Health', 'Have a peice of fruit once a day'],
  ['Cleanliness', 'Make your bed each day'],
  ['Routine', 'Wake up before 9am each day'],
  ['Connection', 'Talk to someone atleast once a day']
]

puts "Making commitments"
COMMITMENTS.each do |name|
  Commitment.create(category: name[0], description: name[1])
end

puts "Assigning commitments"
USERS = User.all.ids
commitments = Commitment.all.ids
USERS.each do |id|
  the_commitment = commitments.sample
  UserCommitment.create(user_id: id, commitment_id: the_commitment)
  "#{User.find(UserCommitment.last.user_id).username} has to #{Commitment.find(the_commitment).description}"
end

CHARGES = [
  ['Hygiene', 'sneezed into their hands'],
  ['Hygiene', 'didn\'t put their tissue straight into the bin'],
  ['Hygiene', 'Paid with cash at the supermarket instead of card'],
  ['Hygiene', 'didn’t wash their hands after coming home from the park'],
  ['Hygiene', 'touched their face 20 times in 1 minute'],
  ['Media', 'watched the morning news, then the midday news, then the evening news, followed up by the late news'],
  ['Information', 'took COVID-19 advice from a clickbait facebook'],
  ['Social distancing', 'had a tinder date over that they had never met'],
  ['Calm approach', 'hoarded supplies from the supermarket meaning no one else could wipe their bum'],
  ['Fight boredom', 'watched netflix for 23 hours of a 24 hour period'],
  ['Positive focus', 'refuses to talk about anything apart from the COVID-19 death statistics'],
  ['Social connection', 'didn’t check in with friends'],
  ['Physical activity', 'didn\'t get off the couch for 3 days'],
  ['Work from home', 'didn\'t take any breaks from work'],
  ['Tidying', 'haven’t cleaned their bedroom for 2 weeks']
]
SENTENCES = [
  'pick objects up with your elbows for 1 hour',
  'donate a bottle of booze to the household you grotty grotty boy',
  'donate the rest of the cash in your wallet to another group member',
  'disinfect all the doorknobs in the house',
  'donate 20 cents per face touch to a COVID-19 charity organisation',
  'no news for 3 days',
  'read the WHO website for COVID-19 health advice',
  'meditate for 30 minutes each day',
  'donate 2 rolls of toilet paper to another member of the group',
  'read a book you’ve been meaning to read for a while',
  'tell everyone in the group 3 positive news stories that have come out in the last week',
  'check in with 1 friend per day for the next week',
  'do 30 push ups and sit ups per day for a week',
  'cook yourself a nice home made lunch every work day this week',
  'do the laundry for the whole house for 3 days'
]
puts "making charges"
CHARGES.each_with_index do |name, index|
  the_user = USERS.sample
  Charge.create(category: name[0], description: name[1], user_id: the_user)
  puts "#{name[0]}: #{name[1]}"
  # Sentence.create(name: SENTENCES[index], charge_id: Charge.last.id)
  puts "#{User.find(the_user).username} charged with #{Charge.last.category}: #{Charge.last.description}"
end

# , sentenced to #{Sentence.last.name}
