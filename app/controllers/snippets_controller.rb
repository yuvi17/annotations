# frozen_string_literal: true

# SnippetsController
class SnippetsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_snippet, only: [:update_or_create_snippet]

  def search
    search = Snippet.search '*', where: snippet_where_query, load: false
    render json: { annotations: search.results }
  end

  def list
    render json: { video_ids: Snippet.pluck(:video_id).uniq }
  end

  def update_or_create_snippet
    if @snippet.present?
      @snippet.update_data params
    else
      create_snippet params
    end

    @snippet.create_object_box(params)
    @snippet.save!

    render json: { status: 'success' }
  end

  private

  def find_snippet
    @snippet = Snippet.where(video_id: params[:video_id])
                      .where(class_name: params[:class_name])
                      .where(object_id: params[:object_id])
                      .where('end_time - ? <= 1000', params[:timestamp]).last
    @snippet
  end

  def create_snippet(params)
    @snippet = Snippet.create(
      video_id: params[:video_id],
      class_name: params[:class_name],
      object_id: params[:object_id],
      start_time: params[:timestamp],
      end_time: params[:timestamp]
    )
  end

  def snippet_where_query
    {
      video_id: params[:video_id],
      class_name: params[:class_name],
      start_time: { lte: params[:start_time] },
      end_time: { gte: params[:end_time] },
      "ts_to_bbox_map.timestamp": { gte: params[:end_time] }
    }
  end
end
