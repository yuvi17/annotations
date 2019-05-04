# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'ingest', to: 'snippets#update_or_create_snippet'

  get 'list', to: 'snippets#list'

  get 'search', to: 'snippets#search'
end
