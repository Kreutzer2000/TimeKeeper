class Attendance < ApplicationRecord
  belongs_to :employee

  before_create :set_recorded_at

  private

  def set_recorded_at
    self.recorded_at ||= Time.current
  end
end
