# frozen_string_literal: true

# ObjectModel for a snippet in a video
class Snippet < ApplicationRecord
  has_many :object_boxes
  searchkick index_name: 'annotations'

  def update_data(options)
    self.end_time = options[:timestamp]
    save!
  end

  # this method determines what gets indexed to elasticsearch
  def search_data
    {
      video_id: video_id,
      class_name: class_name,
      object_id: object_id,
      start_time: start_time,
      end_time: end_time,
      ts_to_bbox_map: object_boxes.map(&:map_data)
    }
  end

  def create_object_box(options)
    object_boxes.create(
      timestamp: options[:timestamp],
      xtl: options[:xtl],
      ytl: options[:ytl],
      xbr: options[:xbr],
      ybr: options[:ybr]
    )
  end
end
