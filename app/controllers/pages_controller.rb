class PagesController < ApplicationController
    def home
        @policies = Policy.all
    end
end
