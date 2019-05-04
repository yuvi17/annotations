# frozen_string_literal: true

# This class corresponds to one object box
class ObjectBox < ApplicationRecord
  belongs_to :snippet

  # timestamp
  # xtl
  # ytl
  # xbr
  # ybr

  def map_data
    res = {}
    res[:timestamp] = timestamp
    res[:position] = [xtl, ytl, xbr, ybr]
    res
  end
end
