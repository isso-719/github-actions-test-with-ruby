# minitest で必要なものを読み込む
require 'minitest/autorun'
require 'rack/test'

# 実行する app.rb を読み込む
require './app.rb'

# テスト環境にする
ENV['RACK_ENV'] = 'test'

# テスト用のクラスを定義
class HelloWorldTest < MiniTest::Test
    include Rack::Test::Methods

    # Sinatra の実行コンテキスト
    def app
    Sinatra::Application
    end

    # テスト用のコードを実行する
    # root にアクセスした時に "Hello World" が返ってくることを確認する
    def test_it_says_hello_world
        get '/'
        assert last_response.ok?
        assert_equal 'Hello World', last_response.body
    end

    # テスト用のコードを実行する
    # /person にアクセスした時にパラメータ name = Simon が含まれてレスポンスが返ってくることを確認する
    def test_it_says_hello_to_a_person
        get '/person', :name => 'Simon'
        assert last_response.body.include?('Simon')
    end
end