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

class Event < ApplicationRecord
end
