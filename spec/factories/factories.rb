# frozen_string_literal: true

FactoryBot.define do
  factory :api, class: ApiAuth::Api do
    path { '/users/:id' }
  end

  factory :client, class: ApiAuth::Client do
    name { 't' }
    email { 't@t.com' }
    desc { 't' }
  end

  factory :authorized_api, class: ApiAuth::AuthorizedApi do
    api
    client
    GET { true }
    POST { false }
    PUT { false }
    DELETE { false }
  end
end
