require 'generator_spec'
require 'generators/marionette/app/app_generator'

describe Marionette::Generators::AppGenerator, type: :generator do
  destination File.expand_path("../../tmp", __FILE__)
  arguments %w(Dummyapp)

  before(:all) do
    prepare_destination
    touch_files
    run_generator
  end

  it 'has a version number' do
    expect(Marionette::Generators::VERSION).not_to be nil
  end

  it 'creates files' do
    assert_file "app/assets/templates/layouts/layout.jst.skim"
  end

  def touch_files
    dest = File.expand_path("../../tmp", __FILE__)
    %w(Gemfile Bowerfile).each do |file|
      FileUtils.touch File.join(dest, file)
    end
    FileUtils.mkdir_p File.join(dest, "app", "assets", "javascripts")
    FileUtils.touch File.join(dest, "app", "assets", "javascripts", "application.js")
  end

end
