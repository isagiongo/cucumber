require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'site_prism'
require 'mongo'
require 'faker'
require 'capybara/poltergeist'


require_relative 'page_objects'

World(Pages)

#carrega o valor do ambiente que foi configurado como default no arquivo cucumber.yaml
$env = ENV['ENVIRONMENT']

#carrega o arquivo de dados conforme ambiente selecionado
$data = YAML.load_file(File.dirname(__FILE__) + "/data/#{$env}.yaml")

#carrega o noome do navegador que sera executado
$browser = ENV['BROWSER']

Capybara.register_driver :selenium do |app|

    if $browser.eql?('firefox')
        #executa no firefox
        Capybara::Selenium::Driver.new(
            app,
            browser: :firefox,
            marionette: true
        )

    elsif $browser.eql?('chrome')
        #executa chrome
        Capybara::Selenium::Driver.new(
            app,
            browser: :chrome,
            desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
                'chromeOption' => {
                    'args' => ['window-size=1280,800']
                }
            )
        )
    elsif $browser.eql?('headless')
        #executa no phantomjs com poltergeist  
        Capybara::Poltergeist::Driver.new(
            app,
            options = {
                :js_errors => false
            }
        ) 
    end
end

Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = $data['url']
end

Capybara.default_max_wait_time = 5

# mongodb:usuario:senha@servidor:porta/nome_do_banco
$db_connection = 'mongodb://heroku_k3nkvbfs:um7pv4b4iev1degk2vb6f08j6c@ds163232.mlab.com:63232/heroku_k3nkvbfs'

Mongo::Logger.logger.level = Logger::FATAL
