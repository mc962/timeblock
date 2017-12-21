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

require 'rails_helper'

RSpec.describe Event, type: :model do
    describe 'validates the presence of required traits' do
        it { should validate_presence_of(:time) }
        it { should validate_presence_of(:location) }

    end
end
