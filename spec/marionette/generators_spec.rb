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
    backbone = "app/assets/javascripts/backbone"
    [
      "#{backbone}/dummyapp.js.coffee",
      "app/assets/templates/layouts/layout.jst.skim",
      "#{backbone}/utils/logger.js.coffee",
      "#{backbone}/utils/defaults.js.coffee",
      "#{backbone}/config.js.coffee",
      "#{backbone}/views/layouts/layout.js.coffee",
      "#{backbone}/routers/app_router.js.coffee",
      "app/views/layouts/application.html.slim"
    ].each do |file|
      assert_file file
    end
  end

  def touch_files
    %w(Gemfile Bowerfile).each do |file|
      FileUtils.touch File.join(destination_root, file)
    end
    FileUtils.mkdir_p File.join(destination_root, "app", "assets", "javascripts")
    FileUtils.touch File.join(destination_root, "app", "assets", "javascripts", "application.js")
  end

end
