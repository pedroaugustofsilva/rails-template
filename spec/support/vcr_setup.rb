# frozen_string_literal: true

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = Rails.root.join('spec/cassettes')
  c.configure_rspec_metadata!
  c.default_cassette_options = { record: :new_episodes }
end
