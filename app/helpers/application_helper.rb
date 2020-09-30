# frozen_string_literal: true

module ApplicationHelper
  def notices_in_flash?
    flash.notice.present?
  end
end
