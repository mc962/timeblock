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
    validates :time, :location, presence: true

    # after_find :convert_local_time

    # private
    #
    # def convert_local_time
    #   debugger
    #
    #   self.time = self.time.localtime
    #   self.time = self.time.strftime('%m/%d/%Y, %I:%M%p')
    # end
end
