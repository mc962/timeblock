# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  time        :datetime         not null
#  location    :string           not null
#  title       :string
#  description :text
#  comments    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
    factory :event do
        time {|t| Faker::Time.between(DateTime.now, DateTime.now + rand(100)) }
        location { |l| Faker::LordOfTheRings.location }
        title { |t| Faker::HowIMetYourMother.catch_phrase }
        description { |d| Faker::Lorem.sentence }
        comments { |c| Faker::Lorem.sentence }
    end
end
