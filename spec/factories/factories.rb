# frozen_string_literal: true

FactoryBot.define do
  factory :api, class: ApiAuth::Api do
    path { '/api/users' }
  end

  factory :client, class: ApiAuth::Client do
    name { 't' }
    email { 't@t.com' }
    desc { 't' }
    factory :client_with_authorized_apis do
      transient do
        apis_count { 1 }
      end

      after(:create) do |client, evaluator|
        create_list(:authorized_api, evaluator.apis_count, client: client)
      end
    end
  end

  factory :authorized_api, class: ApiAuth::AuthorizedApi do
    api
    client
    GET { true }
    POST { true }
    PUT { true }
    DELETE { true }
  end

  factory :user do
    name { 'T' }
    email { 't@t.t' }
  end
end
