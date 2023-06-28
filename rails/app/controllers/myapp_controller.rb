class MyappController < ApplicationController
    def index
        render 'index'
    end

    def hello
        render plain: 'Hello'
    end

    def foo
        render plain: 'Bar'
    end
end